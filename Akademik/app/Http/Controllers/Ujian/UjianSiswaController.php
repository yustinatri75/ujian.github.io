<?php

namespace App\Http\Controllers\Ujian;

use App\Http\Controllers\Controller;
use App\Models\UjianPeserta;
use App\Models\UjianSession;
use App\Models\UjianSoal;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;

class UjianSiswaController extends Controller
{
    public function index()
    {
        $dataExam = UjianPeserta::with('ujian_session')->where('peserta_id', auth()->id())->get();
        $parser = ['dataExam' => $dataExam];
        return view('ujian.index')->with($parser);
    }

    public function exam($ujianPesertaId)
    {
        // Checking apakah waktu masih ada ?
        try {
            $timeNow = Carbon::now();
            $dataUjian = UjianPeserta::with('ujian_session')
                ->where('peserta_id', auth()->id())
                ->where('id', $ujianPesertaId)
                ->first();

            if (empty($dataUjian)) throw new Exception("Sesi Ujian tidak ditemukan");
            if (!($timeNow >= $dataUjian->ujian_session->waktu_mulai && $timeNow <= $dataUjian->ujian_session->waktu_selesai)) {
                throw new Exception('Diluar waktu Sesi ujian');
            }

            $dataSoal = UjianSoal::with('ujian_jawabans')->get();
            $sisaWaktu = Carbon::now()->diffInMinutes($dataUjian->ujian_session->waktu_selesai);
            $parser = ['dataUjian' => $dataUjian, 'dataSoal' => $dataSoal, 'sisaWaktu' => $sisaWaktu];
            return view('ujian.exam')->with($parser);
        } catch (Exception $e) {
            dd($e->getMessage());
        }
    }
}

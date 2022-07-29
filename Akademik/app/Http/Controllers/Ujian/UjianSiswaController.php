<?php

namespace App\Http\Controllers\Ujian;

use App\Http\Controllers\Controller;
use App\Models\UjianPeserta;
use App\Models\UjianPesertaJawaban;
use App\Models\UjianSoal;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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

            $dataSoal = UjianSoal::with('ujian_jawabans')
                ->select('ujian_peserta_jawaban.jawaban_id', 'ujian_soal.id', 'ujian_soal.sesi_id', 'ujian_soal.soal')
                ->leftJoin('ujian_peserta_jawaban', function ($join) use ($dataUjian) {
                    $join->on('ujian_peserta_jawaban.peserta_id', DB::raw($dataUjian->id));
                    $join->on('ujian_peserta_jawaban.soal_id', 'ujian_soal.id');
                })
                ->get();

            $sisaWaktu = Carbon::now()->diffInMinutes($dataUjian->ujian_session->waktu_selesai);
            $parser = ['dataUjian' => $dataUjian, 'dataSoal' => $dataSoal, 'sisaWaktu' => $sisaWaktu];
            return view('ujian.exam')->with($parser);
        } catch (Exception $e) {
            dd($e->getMessage());
        }
    }

    public function preview($ujianPesertaId)
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

            $dataSoal = UjianSoal::with('ujian_jawabans')
                ->select('ujian_soal.id')
                ->select('ujian_peserta_jawaban.jawaban_id')
                ->leftJoin('ujian_peserta_jawaban', function ($join) use ($dataUjian) {
                    $join->on('ujian_peserta_jawaban.peserta_id', DB::raw($dataUjian->id));
                    $join->on('ujian_peserta_jawaban.soal_id', 'ujian_soal.id');
                })
                ->get();
            $sisaWaktu = Carbon::now()->diffInMinutes($dataUjian->ujian_session->waktu_selesai);
            $parser = ['dataUjian' => $dataUjian, 'dataSoal' => $dataSoal, 'sisaWaktu' => $sisaWaktu];
            return view('ujian.preview')->with($parser);
        } catch (Exception $e) {
            dd($e->getMessage());
        }
    }

    public function saveAnswer(Request $request, $ujianPesertaId)
    {
        $request->validate(['soal_id' => 'required', 'jawaban_id' => 'required']);
        try {
            UjianPesertaJawaban::updateOrCreate(
                [
                    'peserta_id' => $ujianPesertaId,
                    'soal_id'    => $request['soal_id'],
                ],
                ['jawaban_id' => $request['jawaban_id'],]
            );

            return response()->json(['message' => 'success']);
        } catch (Exception $e) {
            return response()->json([
                'message' => $e->getMessage()
            ], 500);
        }
    }
}

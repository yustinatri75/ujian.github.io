<?php

namespace App\Http\Traits;

use App\Models\UjianPeserta;
use App\Models\UjianPesertaJawaban;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

trait UjianTrait
{

    public function dataUjian($ujianPesertaId)
    {
        $timeNow = Carbon::now();
        $dataUjian = UjianPeserta::with('ujian_session')
            ->where('peserta_id', auth()->id())
            ->where('id', $ujianPesertaId)
            ->first();

        if (empty($dataUjian)) throw new Exception("Sesi Ujian tidak ditemukan");
        if (!($timeNow >= $dataUjian->ujian_session->waktu_mulai && $timeNow <= $dataUjian->ujian_session->waktu_selesai)) {
            throw new Exception('Diluar waktu Sesi ujian');
        }

        return $dataUjian;
    }

    public function calculateScore(UjianPeserta $data)
    {
        $totalSoal = DB::select(DB::raw("SELECT COUNT(*) as total FROM ujian_soal WHERE sesi_id = $data->sesi_id"))[0]->total;
        $dataJawaban = UjianPesertaJawaban::with('ujian_jawaban')->where('peserta_id', $data->id)->get();
        $totalJawaban = 0;
        foreach ($dataJawaban as $jwb) {
            $totalJawaban += $jwb->ujian_jawaban->skor;
        }

        return $totalJawaban / $totalSoal * 100.0;
    }
}

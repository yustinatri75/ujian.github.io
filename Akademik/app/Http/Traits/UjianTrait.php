<?php

namespace App\Http\Traits;
use App\Models\UjianPeserta;
use Carbon\Carbon;

trait UjianTrait {

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
}

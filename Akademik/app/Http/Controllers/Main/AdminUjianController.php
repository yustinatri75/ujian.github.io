<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Http\Traits\UjianTrait;
use App\Models\UjianPeserta;
use App\Models\UjianSession;
use App\Models\UjianSoal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminUjianController extends Controller
{
    use UjianTrait;

    public function index()
    {
        $dataSesiUjian = UjianSession::with('ujian_pesertas')->get();
        $parser = ['dataSesi' => $dataSesiUjian];
        return view('main.admin_ujian.index')->with($parser);
    }

    public function detail($sesiId)
    {
        $dataSesi = UjianSession::with('ujian_pesertas.sys_user')->find($sesiId);
        $result = [];
        foreach ($dataSesi->ujian_pesertas as $peserta) {
            $peserta->hasil = $this->calculateScore($peserta);
            $result[] = $peserta;
        }

        $parser = ['dataResult' => $result, 'dataSesi' => $dataSesi];
        return view('main.admin_ujian.detail')->with($parser);
    }

    public function detailJawabanSiswa($sesiId, $ujianPesertaId)
    {
        $dataUjian = UjianPeserta::find($ujianPesertaId);
        $dataSoal = UjianSoal::with('ujian_jawabans')
            ->select('ujian_peserta_jawaban.jawaban_id', 'ujian_soal.id', 'ujian_soal.sesi_id', 'ujian_soal.soal')
            ->leftJoin('ujian_peserta_jawaban', function ($join) use ($ujianPesertaId) {
                $join->on('ujian_peserta_jawaban.peserta_id', DB::raw($ujianPesertaId));
                $join->on('ujian_peserta_jawaban.soal_id', 'ujian_soal.id');
            })
            ->where('sesi_id', '=', $sesiId)
            ->get();

        $parser = ['dataSoal' => $dataSoal, 'dataUjian' => $dataUjian];
        return view('main.admin_ujian.exam_answer')->with($parser);
    }
}

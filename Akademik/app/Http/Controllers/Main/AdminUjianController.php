<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Http\Traits\UjianTrait;
use App\Models\UjianSession;
use Illuminate\Http\Request;

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

    }
}

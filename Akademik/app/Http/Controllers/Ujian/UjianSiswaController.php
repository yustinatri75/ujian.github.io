<?php

namespace App\Http\Controllers\Ujian;

use App\Http\Controllers\Controller;
use App\Models\UjianPeserta;
use App\Models\UjianSession;
use Carbon\Carbon;
use Illuminate\Http\Request;

class UjianSiswaController extends Controller
{
    public function index()
    {
        $dataExam = UjianPeserta::with('ujian_session')->where('peserta_id', auth()->id())->get();
        $parser = ['dataExam' => $dataExam];
        return view('ujian.index')->with($parser);
    }
}

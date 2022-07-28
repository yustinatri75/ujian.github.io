<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MasterProdi;

class MasterProdiController extends Controller
{
    public function index()
    {
        $dataMasterProdi = MasterProdi::get();
        $parser = ['dataProdi' => $dataMasterProdi];
        return view('main.master_prodi')->with($parser);
    }
}

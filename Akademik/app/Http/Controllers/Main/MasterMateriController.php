<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\MasterMatakuliah;

class MasterMateriController extends Controller
{
    public function index()
    {
        $dataMasterMakul = MasterMatakuliah::get();
        $parser = ['dataMakul' => $dataMasterMakul];
        return view('main.master_makul')->with($parser);
    }
}

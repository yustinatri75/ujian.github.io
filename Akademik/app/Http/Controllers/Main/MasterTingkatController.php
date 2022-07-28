<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MasterTingkat;

class MasterTingkatController extends Controller
{
    public function index()
    {
        $dataMasterTingkat = MasterTingkat::get();
        $parser = ['dataTingkat' => $dataMasterTingkat];
        return view('main.master_tingkat')->with($parser);
    }
}

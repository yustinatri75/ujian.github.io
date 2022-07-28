<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\SysUser;
use Illuminate\Http\Request;

class DataDosenController extends Controller
{
    public function index()
    {
        $dataDosen = SysUser::where('user_level_id', '=', 1)->get();
        $parser = ['dataDosen' => $dataDosen];
        return view('main.data_dosen')->with($parser);
    }
}

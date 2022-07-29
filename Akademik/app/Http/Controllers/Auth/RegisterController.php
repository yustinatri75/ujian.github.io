<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SysUser;

class RegisterController extends Controller
{
    public function index()
    {
        return view("auth.register");
    }

    public function processRegister(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:4|confirmed',
        ]);
        $user = new SysUser();
        $user->user_email = $request->email;
        $user->user_level_id = 2; // staff
        $user->user_password = bcrypt($request->password);
        if ($user->save()) {
            return redirect()->route('login')->with("success", "Register Success");
        } else {
            return redirect()->back()->withInput()->withErrors("Something Error !");
        }
    }
}

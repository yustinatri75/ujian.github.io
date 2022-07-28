<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\MasterMahasiswa;
use App\Models\MasterProdi;
use App\Models\MasterTingkat;
use App\Models\SysUser;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use function Sodium\crypto_box_publickey_from_secretkey;

class DataMahasiswaController extends Controller
{
    public function index()
    {
        $dataMahasiswa = SysUser::where('user_level_id', '=', 2)->get();
        $parser = ['dataMahasiswa' => $dataMahasiswa];
        return view('main.data_mahasiswa')->with($parser);
    }

    public function add()
    {
        $dataProdi = MasterProdi::get();
        $dataTingkat = MasterTingkat::get();
        $parser = ['dataProdi' => $dataProdi, 'dataTingkat' => $dataTingkat];
        return view('main.data_mahasiswa_add')->with($parser);
    }

    public function store(Request $request)
    {
        $request->validate([
            'user_email' => 'required',
            'user_password' => 'required',
            'mhs_nama' => 'required',
            'mhs_tingkat' => 'required',
            'mhs_nim' => 'required',
            'prodi_id' => 'required',
        ]);

        try {
            DB::beginTransaction();
            $addUser = new SysUser();
            $addUser->user_level_id = 2; // karena mahasiswa
            $addUser->user_email = $request['user_email'];
            $addUser->user_password = $request['user_password'];
            $addUser->save();

            $addMahasiswa = new MasterMahasiswa();
            $addMahasiswa->mhs_user_id = $addUser->user_id;
            $addMahasiswa->mhs_prodi_id = $request['prodi_id'];
            $addMahasiswa->mhs_nama = $request['mhs_nama'];
            $addMahasiswa->mhs_tingkat = $request['mhs_tingkat'];
            $addMahasiswa->mhs_nim = $request['mhs_nim'];
            $addMahasiswa->save();

            DB::commit();
            return redirect(url('main/data/mahasiswa'))->with('message', sprintf('%s berhasil ditambahkan', $addMahasiswa->mhs_nama));
        } catch (Exception $e) {
            return redirect()->back()->withErrors(['message' => $e->getMessage()])->withInput($request->except('_token'));
        }

    }

    public function edit($userId)
    {
        $dataUser = SysUser::findOrFail($userId);
        $dataProdi = MasterProdi::get();
        $dataTingkat = MasterTingkat::get();
        $parser = ['dataProdi' => $dataProdi, 'dataTingkat' => $dataTingkat, 'mhs' => $dataUser];
        return view('main.data_mahasiswa_edit')->with($parser);
    }

    public function update(Request $request, $userId)
    {
        $request->validate([
            'user_email' => 'required',
            'mhs_nama' => 'required',
            'mhs_tingkat' => 'required',
            'mhs_nim' => 'required',
            'prodi_id' => 'required',
        ]);

        try {
            DB::beginTransaction();
            $updUser = SysUser::findOrFail($userId);
            $updUser->user_email = $request['user_email'];
            $updUser->save();

            $updMahasiswa = $updUser->master_mahasiswa;
            $updMahasiswa->mhs_user_id = $updUser->user_id;
            $updMahasiswa->mhs_prodi_id = $request['prodi_id'];
            $updMahasiswa->mhs_nama = $request['mhs_nama'];
            $updMahasiswa->mhs_tingkat = $request['mhs_tingkat'];
            $updMahasiswa->mhs_nim = $request['mhs_nim'];
            $updMahasiswa->save();

            DB::commit();
            return redirect(url('main/data/mahasiswa'))->with('message', sprintf('%s berhasil diperbarui', $updMahasiswa->mhs_nama));
        } catch (Exception $e) {
            return redirect()->back()->withErrors(['message' => $e->getMessage()])->withInput($request->except('_token'));
        }
    }

    public function destroy(Request $request, $userId)
    {
        $dataUser = SysUser::findOrFail($userId);
        $namaUser = $dataUser->master_mahasiswa->mhs_nama;
        $dataUser->delete();
        return redirect(url('main/data/mahasiswa'))->with('message', sprintf('%s berhasil dihapus', $namaUser));
    }
}

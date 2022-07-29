<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Main\AdminUjianController;
use App\Http\Controllers\Ujian\UjianSiswaController;
use Illuminate\Support\Facades\Route;

Route::redirect('/', '/auth/login');
Route::prefix('auth')->middleware('guest')->group(function () {
    Route::get('login', [Auth\LoginController::class, 'index'])->name('login');
    Route::post('login', [Auth\LoginController::class, 'processLogin']);
    Route::get('register', [Auth\RegisterController::class, 'index'])->name('register');
    Route::post('register', [Auth\RegisterController::class, 'processRegister']);

    Route::get('oauth/google', [Auth\LoginController::class, 'redirectToGoogle'])->name('google');
    Route::get('oauth/google/callback', [Auth\LoginController::class, 'handleGoogleCallback']);
});
Route::get('logout', [Auth\LoginController::class, 'logout'])->name('logout');

Route::prefix('ujian')->group(function () {
    Route::get('/', [UjianSiswaController::class, 'index']);
    Route::get('/{ujian_peserta_id}/exam', [UjianSiswaController::class, 'exam']);
    Route::get('/{ujian_peserta_id}/preview', [UjianSiswaController::class, 'preview']);
    Route::post('/{ujian_peserta_id}/save-answer', [UjianSiswaController::class, 'saveAnswer']);
    Route::post('/{ujian_peserta_id}/finish', [UjianSiswaController::class, 'finish']);
});

Route::prefix('main')->middleware('auth')->group(function () {
    Route::get('dashboard', [Main\DashboardController::class, 'index'])->name('home');

    Route::prefix('admin/ujian')->group(function () {
        Route::get('/', [AdminUjianController::class, 'index']);
        Route::get('/{sesi_id}', [AdminUjianController::class, 'detail']);
        Route::get('/{sesi_id}/peserta/{peserta_id}/jawaban', [AdminUjianController::class, 'detailJawabanSiswa']);
    });

    Route::prefix('data/mahasiswa')->group(function () {
        Route::get('/', [Main\DataMahasiswaController::class, 'index']);
        Route::get('/add', [Main\DataMahasiswaController::class, 'add']);
        Route::post('/add', [Main\DataMahasiswaController::class, 'store']);
        Route::get('/edit/{user_id}', [Main\DataMahasiswaController::class, 'edit']);
        Route::post('/edit/{user_id}', [Main\DataMahasiswaController::class, 'update']);
        Route::get('/delete/{user_id}', [Main\DataMahasiswaController::class, 'destroy']);
    });

    Route::prefix('data/dosen')->group(function () {
        Route::get('/', [Main\DataDosenController::class, 'index']);
    });

    Route::prefix('master/tingkat')->group(function () {
        Route::get('/', [Main\MasterTingkatController::class, 'index']);
    });

    Route::prefix('master/prodi')->group(function () {
        Route::get('/', [Main\MasterProdiController::class, 'index']);
    });
    Route::prefix('master/materi')->group(function () {
        Route::get('/', [Main\MasterMateriController::class, 'index']);
    });
});

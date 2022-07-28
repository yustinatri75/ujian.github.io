@extends('layouts.layout_main')

@section('title', "Tambah Data Mahasiswa")

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                @if (session("success"))
                    <div class="alert alert-primary">{{ session('success') }}</div>
                @endif
                @if ($errors->any())
                    <div class="alert alert-danger" role="alert">
                        {!! implode('', $errors->all('<li>:message</li>')) !!}
                    </div>
                @endif

                <div class="card-header">
                    <h4 class="card-title">
                        Tambah Data Mahasiswa
                    </h4>
                </div>
                <div class="card-body">
                    <form method="post">
                        @csrf
                        <div class="form-group">
                            <label for="user_email">Email</label>
                            <input id="user_email" class="form-control" type="text" value="{{old('user_email')}}"
                                   name="user_email">
                        </div>
                        <div class="form-group">
                            <label for="user_password">Password</label>
                            <input id="user_password" class="form-control" type="password" value="{{old('user_password')}}"
                                   name="user_password">
                        </div>
                        <div class="form-group">
                            <label for="mhs_nama">Nama Mahasiswa</label>
                            <input id="mhs_nama" class="form-control" type="text" value="{{old('mhs_nama')}}"
                                   name="mhs_nama">
                        </div>
                        <div class="form-group">
                            <label for="mhs_nim">NIM</label>
                            <input id="mhs_nim" class="form-control" type="text" value="{{old('mhs_nim')}}"
                                   name="mhs_nim">
                        </div>
                        <div class="form-group">
                            <label for="mhs_tingkat">Tingkat</label>
                            <select name="mhs_tingkat" id="mhs_tingkat" class="form-control">
                                @foreach($dataTingkat as $tingkat)
                                    <option value="{{ $tingkat->tingkat_id }}">
                                        {{ $tingkat->tingkat_level }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="prodi_id">Prodi</label>
                            <select name="prodi_id" id="prodi_id" class="form-control">
                                @foreach($dataProdi as $prodi)
                                    <option value="{{ $prodi->prodi_id }}">
                                        {{ $prodi->prodi_nama }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <button type="submit" class="btn btn-success">
                            Kirim
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

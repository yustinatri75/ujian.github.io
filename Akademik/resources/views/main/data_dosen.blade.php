@extends('layouts.layout_main')

@section('title', "Data Dosen")

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">
                        Data Dosen
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Nama</th>
                            <th>Kode Dosen</th>
                            <th>NIK</th>
                            <th>Prodi</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($dataDosen as $dosen)
                        <tr>
                            <td>{{ $dosen->master_dosen->dosen_nama }}</td>
                            <td>{{ $dosen->master_dosen->dosen_kode }}</td>
                            <td>{{ $dosen->master_dosen->dosen_nik }}</td>
                            <td>{{ $dosen->master_dosen->master_prodi?->prodi_nama }}</td>
                        </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@extends('layouts.layout_main')

@section('title', 'Dashboard')

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">
                        Admin Ujian
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Ujian</th>
                            <th>Waktu</th>
                            <th>Peserta</th>
                            <th>Aksi</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($dataSesi as $sesi)
                            <tr>
                                <td>{{ $sesi->judul }}</td>
                                <td>{{ $sesi->waktu_mulai->format('Y-m-d H:i:s') }}
                                    s/d {{ $sesi->waktu_selesai->format('Y-m-d H:i:s') }}</td>
                                <td>{{ count($sesi->ujian_pesertas) }}</td>
                                <td><a href="{{ url('/main/admin/ujian/' . $sesi->id) }}"
                                       class="btn btn-sm btn-primary">Detail</a></td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

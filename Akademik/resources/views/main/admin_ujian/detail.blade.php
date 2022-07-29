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
                            <th>Siswa</th>
                            <th>Skor</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($dataResult as $result)
                            <tr>
                                <td>{{ $result->sys_user->user_email }}</td>
                                <td>{{ $result->hasil }}</td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

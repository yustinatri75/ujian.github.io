@extends('layouts.layout_main')

@section('title', 'Dashboard')

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">
                        Data Exam SISWA
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Ujian</th>
                            <th>Waktu</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($dataExam as $exam)
                            <tr>
                                <td>{{$exam->ujian_session->judul}}</td>
                                <td>{{$exam->ujian_session->waktu_mulai->isoFormat('LLLL')}} <br> s/d
                                    <br>{{$exam->ujian_session->waktu_selesai->isoFormat('LLLL')}}</td>
                                @if(\Carbon\Carbon::now() >= $exam->ujian_session->waktu_mulai && \Carbon\Carbon::now() <= $exam->ujian_session->waktu_selesai)
                                    <td>Open</td>
                                    <th>
                                        <a href="{{ url('ujian/' . $exam->id . '/exam') }}" class="btn btn-primary">Exam</a>
                                    </th>
                                @else
                                    <td>Closed</td>
                                    <th>
                                        <button class="btn btn-warning">Lihat</button>
                                    </th>
                                @endif

                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

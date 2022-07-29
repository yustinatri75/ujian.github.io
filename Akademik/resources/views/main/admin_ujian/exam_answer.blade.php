<?php
@extends('layouts.layout_main')

@section('title', 'Dashboard')

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">
                        Exam {{ $dataUjian->ujian_session->judul }}
                    </h4>
                </div>

                <div class="card-body">
                    @foreach($dataSoal as $soal)
                        <p>
                            <b>{{$loop->iteration}} {{$soal->soal}} ?</b>
                            <br>
                        <div>
                            @foreach($soal->ujian_jawabans as $jawaban)
                                <input type="radio" name="soal_{{$soal->id}}" disabled
                                       {{ $soal->jawaban_id == $jawaban->id ? "checked" : "" }}
                                       onclick="saveAnswer({{$soal->id}}, {{$jawaban->id}})">
                                {{$jawaban->jawaban}} <br>
                            @endforeach
                        </div>
                        </p>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endsection

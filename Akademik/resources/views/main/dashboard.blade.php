@extends('layouts.layout_main')

@section('title', 'Dashboard')

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">
                        <marquee> Halo Selamat Datang {{ auth()->user()->user_email }}</marquee>
                    </h4>
                </div>
                <div class="card-body">
                </div>
            </div>
        </div>
    </div>
@endsection

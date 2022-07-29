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
                    <p>Sisa Waktu: <b>{{ $sisaWaktu }} Menit</b></p>
                </div>

                <div class="card-body">
                    <b>Preview Soal</b>
                    <table>
                        @foreach($dataSoal as $soal)
                            <tr>
                                <td>{{ $loop->iteration }}.</td>
                                <td>{{ !empty($soal->jawaban_id) ? 'Terjawab' : 'Belum Terjawab' }}</td>
                            </tr>
                        @endforeach
                    </table>
                    <div>
                        <form action="{{ url('/ujian/' . $dataUjian->id . '/finish') }}" method="post">
                            @csrf
                            <button type="submit" class=" btn btn-primary">Selesai</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

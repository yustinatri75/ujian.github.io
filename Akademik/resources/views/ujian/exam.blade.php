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
                    @foreach($dataSoal as $soal)
                        <p>
                            <b>{{$loop->iteration}} {{$soal->soal}} ?</b>
                            <br>
                        <div>
                            @foreach($soal->ujian_jawabans as $jawaban)
                                <input type="radio" name="soal_{{$soal->id}}"
                                       {{ $soal->jawaban_id == $jawaban->id ? "checked" : "" }}
                                       onclick="saveAnswer({{$soal->id}}, {{$jawaban->id}})">
                                {{$jawaban->jawaban}} <br>
                            @endforeach
                        </div>
                        </p>
                    @endforeach

                    <div>
                        <a href="{{ url('ujian/' . $dataUjian->id . '/preview') }}" class="btn btn-primary">Selesai</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('foot')
    <script>
        async function saveAnswer(soal, jawaban) {
            const result = fetch(`{{ url('/ujian/' . $dataUjian->id .'/save-answer') }}`, {
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'Content-type': 'application/json',
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                body: JSON.stringify({
                    soal_id: soal,
                    jawaban_id: jawaban,
                })
            })
        }
    </script>
@endpush

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
                        <a href="" class=" btn btn-primary">Selesai</a>
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

            console.log(result);
        }
    </script>
@endpush

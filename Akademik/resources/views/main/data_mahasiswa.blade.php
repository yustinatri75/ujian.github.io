@extends('layouts.layout_main')

@section('title', "Data Mahasiswa")

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                @if (session("message"))
                    <div class="alert alert-primary">{{ session('message') }}</div>
                @endif
                @if ($errors->any())
                    <div class="alert alert-danger" role="alert">
                        {!! implode('', $errors->all('<li>:message</li>')) !!}
                    </div>
                @endif

                <div class="card-header">
                    <h4 class="card-title">
                        Data Mahasiswa
                    </h4>

                    <div style="float: right">
                        <a href="{{url('/main/data/mahasiswa/add')}}" class="btn btn-primary">Tambah</a>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Nama</th>
                            <th>NIM</th>
                            <th>Tingkat</th>
                            <th>Prodi</th>
                            <th>Aksi</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($dataMahasiswa as $mhs)
                            <tr>
                                <td>{{ $mhs->master_mahasiswa->mhs_nama }}</td>
                                <td>{{ $mhs->master_mahasiswa->mhs_nim }}</td>
                                <td>{{ $mhs->master_mahasiswa->mhs_tingkat }}</td>
                                <td>{{ $mhs->master_mahasiswa->master_prodi?->prodi_nama }}</td>
                                <td>
                                    <a class="btn btn-success"
                                       href="{{ url('/main/data/mahasiswa/edit/' . $mhs->user_id) }}">Edit</a>
                                    <button class="btn btn-danger" onclick="confirmDelete({{$mhs->user_id}})">Delete
                                    </button>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('foot')
    <script>
        function confirmDelete(userId) {
            let ok = confirm("Delete mahasiswa ini ?")
            if (ok) {
                location.href = `{{ url('/main/data/mahasiswa/delete') }}/${userId}`
            }
        }
    </script>
@endpush

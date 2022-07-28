@extends('layouts.layout_main')

@section('title', "Master Mata Kuliah")

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
                        Master mata kuliah
                    </h4>

                    <div style="float: right">
                        <a href="{{url('/main/master/materi/add')}}" class="btn btn-primary">Tambah</a>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Tingkat</th>
                            <th>Makul</th>
                            <th>Kode</th>
                            <th>Aksi</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($dataMakul as $makul)
                            <tr>
                                <td>{{ $makul->makul_tingkat_id}}</td>
                                <td>{{ $makul->makul_nama}}</td>
                                <td>{{ $makul->makul_kode}}</td>
                                <td>
                                    <a class="btn btn-success"
                                       href="{{ url('/main/master/materi/edit/' . $makul->tingkat_id) }}">Edit</a>
                                    <button class="btn btn-danger" onclick="confirmDelete({{$makul->tingkat_id}})">Delete
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
            let ok = confirm("Delete master data ini ?")
            if (ok) {
                location.href = `{{ url('/main/master/materi/delete') }}/${userId}`
            }
        }
    </script>
@endpush

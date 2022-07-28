@extends('layouts.layout_main')

@section('title', "Data Prodi")

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
                        Master prodi
                    </h4>

                    <div style="float: right">
                        <a href="{{url('/main/master/prodi/add')}}" class="btn btn-primary">Tambah</a>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Nama</th>
                            <th>Kode</th>
                            <th>CreateAt</th>
                            <th>UpdatedAt</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($dataProdi as $prodi)
                            <tr>
                                <td>{{ $prodi->prodi_nama}}</td>
                                <td>{{ $prodi->prodi_kode}}</td>
                                <td>{{ $prodi->prodi_created_at}}</td>
                                <td>{{ $prodi->prodi_updated_at}}</td>
                                <td>
                                    <a class="btn btn-success"
                                       href="{{ url('/main/master/prodi/edit/' . $prodi->prodi_id) }}">Edit</a>
                                    <button class="btn btn-danger" onclick="confirmDelete({{$prodi->prodi_id}})">Delete
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
                location.href = `{{ url('/main/master/prodi/delete') }}/${userId}`
            }
        }
    </script>
@endpush

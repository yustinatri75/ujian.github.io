@extends('layouts.layout_main')

@section('title', "Data Tingkat")

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
                        Master Tingkat
                    </h4>

                    <div style="float: right">
                        <a href="{{url('/main/master/tingkat/add')}}" class="btn btn-primary">Tambah</a>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Level</th>
                            <th>CreateAt</th>
                            <th>UpdatedAt</th>
                            <th>Aksi</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($dataTingkat as $tingkat)
                            <tr>
                                <td>{{ $tingkat->tingkat_level}}</td>
                                <td>{{ $tingkat->tingkat_created_at}}</td>
                                <td>{{ $tingkat->tingkat_updated_at}}</td>
                                <td>
                                    <a class="btn btn-success"
                                       href="{{ url('/main/master/tingkat/edit/' . $tingkat->tingkat_id) }}">Edit</a>
                                    <button class="btn btn-danger" onclick="confirmDelete({{$tingkat->tingkat_id}})">Delete
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
                location.href = `{{ url('/main/master/tingkat/delete') }}/${userId}`
            }
        }
    </script>
@endpush

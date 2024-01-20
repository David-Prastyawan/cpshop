@extends('backend.layouts.master')

@section('main-content')

<div class="card">
    <h5 class="card-header">Tambah Kategori Artikel</h5>
    <div class="card-body">
      <form method="post" action="{{route('post-category.store')}}">
        {{csrf_field()}}
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Nama Kategori</label>
          <input id="inputTitle" type="text" name="title" placeholder="Masukkan kategori"  value="{{old('title')}}" class="form-control">
          @error('title')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
          <label for="status" class="col-form-label">Status</label>
          <select name="status" class="form-control">
              <option value="active">Aktif</option>
              <option value="inactive">Tidak aktif</option>
          </select>
          @error('status')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group mb-3">
          <button type="reset" class="btn btn-warning">Reset</button>
           <button class="btn btn-success" type="submit">Tambah</button>
        </div>
      </form>
    </div>
</div>

@endsection

@extends('main-layout')


@section('content')

    <h2>Products</h2>
    <div class='container-fluid'>
        <div class="row">

            @foreach($products as $product)
              
                <div class="card col-sm-3 img-thumbnail">
                    <p class="font-weight-bold"><h4>{{ $product->name }}</h4></p>
                    <p><img src="{{ $product->getThumbnail() }}" class="img-rounded center-block" alt="{{ $product->name }}" width="150" /></p>
                    <p class="font-weight-normal"> {{ str_limit($product->description, 60) }}</p>
                    
                    <h4>{{ Helper::numberToMoney($product->price) }}</h4>

                </div>

            @endforeach

        </div>

        <div class='navbar-right'>{{ $products->links() }}</div>

    </div>

@stop
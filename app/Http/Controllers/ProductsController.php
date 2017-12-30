<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;

class ProductsController extends Controller
{

	/**
	* 
	*/
    public function productsList(Request $request)
    {
    	
    	$products = Product::paginate(6);
    	return View('products.index', ['products' => $products]);

    }

}

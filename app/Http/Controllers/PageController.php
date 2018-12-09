<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\ProductType;
use App\Slide;

class PageController extends Controller
{

    /*
    |--------------------------------------------------------------------------
    | get index page
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getIndex(){
        $slide = Slide::all();
    	$product = Product::paginate(20);
    	return view('pages.content', compact('slide','product'));
    }

    /*
    |--------------------------------------------------------------------------
    | show information of a product
    |-------------------------------------------------------------------------- 
    | find product by id and show information
    |
    */
    public function getProduct(Request $req){
    	$product = Product::where('id',$req->id)->first();
    	return view('pages.product', compact('product'));
    }

    /*
    |--------------------------------------------------------------------------
    | find product by name and price
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getSearch(Request $req){
    	if($req->key == '') $product = [];
    	else $product = Product::where('name','like','%'.$req->key.'%')->orWhere('unit_price','like',$req->key)->orWhere('promotion_price','like',$req->key)->get();
    	return view('pages.search', compact('product'));
    }

    /*
    |--------------------------------------------------------------------------
    | show list product of a kind
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getProductType($type){
    	$product = Product::where('id_type',$type)->get();
    	$productType = ProductType::where('id',$type)->first();
    	return view('pages.productType', compact('product','productType'));
    }

    /*
    |--------------------------------------------------------------------------
    | get view to display contact to develop team 
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getContact(){
        return view('pages.contact');
    }

    /*
    |--------------------------------------------------------------------------
    | get view to display about information about website
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getAbout(){
        return view('pages.about');
    }
}

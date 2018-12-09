<?php

namespace App\Http\Controllers;
use App\Product;
use App\ProductType;
use App\Cart;
use Session;
use App\Customer;
use App\Bill;
use App\BillDetail;
use App\User;
use Hash;
use Auth;

use Illuminate\Http\Request;

class CheckoutController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | get view to checkout 
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getCheckout(){
        return view('pages.checkout');
    }

    /*
    |--------------------------------------------------------------------------
    | receive information of customer and product to ship to customer 
    |-------------------------------------------------------------------------- 
    | receive all information of a customer and all product that customer bought
    | save information of customer to databse
    | creat bill, bill detail and save to database
    | and send success message 
    |
    */
    public function postCheckout(Request $req){
        $cart = Session::get('cart');

        $customer = new Customer();
        $customer->name = $req->name;
        $customer->gender = $req->gender;
        $customer->email = $req->email;
        $customer->address = $req->address;
        $customer->phone_number = $req->phone;
        if($req->notes)            
            $customer->note = $req->notes;
        else
            $customer->note = "";
        $customer->save();

        $bill = new Bill();
        $bill->id_customer = $customer->id;
        $bill->date_order = date('Y-m-d');
        $bill->total = $cart->totalPrice;
        $bill->payment = $req->payment_method;
        $bill->note = $req->notes;
        $bill->status = 0;
        $bill->save();

        foreach ($cart->items as $key => $value) {
            $bill_detail = new BillDetail;
            $bill_detail->id_bill = $bill->id;
            $bill_detail->id_product = $key;
            $bill_detail->quantity = $value['qty'];
            $bill_detail->unit_price = ($value['price']/$value['qty']);
            $bill_detail->save();
        }
        Session::forget('cart');

        return redirect()->back()->with('success','Đặt hàng thành công!');
    }
}

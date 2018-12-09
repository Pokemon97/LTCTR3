<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\BillDetail;
use App\Bill;
use App\Product;

class ChiTietConTroller extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | get view to display all information about bill detail list
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getDanhSach() {
        $chitiet = BillDetail::get();
    	return view('admin.chitiet.danhsach', ['chitiet'=>$chitiet]);
    }

    /*
    |--------------------------------------------------------------------------
    | get view to fix a bill detail 
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getSua($id) {
    	$sanpham = Product::all();
    	$hoadon = Bill::all();
    	$chitiet = BillDetail::find($id);
        return view('admin.chitiet.sua', ['sanpham'=>$sanpham, 'hoadon'=>$hoadon, 'chitiet'=>$chitiet]);
    }

    /*
    |--------------------------------------------------------------------------
    | update all information of a bill detail 
    |-------------------------------------------------------------------------- 
    | receive new information of a bill detail
    | check all information is true or false
    | if true update to database and send success message
    | else send error message 
    |
    */
    public function postSua(Request $request, $id) {
        $chitiet = BillDetail::find($id);

        $this->validate($request,
            [
                'SanPham'=>'required',
                'HoaDon'=>'required',
                'quantity'=>'required',
            ],
            [
                'SanPham.required'=>'Bạn chưa chọn san phẩm.',
                'HoaDon.required'=>'Bạn chưa chọn hóa đơn.',
                'quantity.required'=>'Bạn chưa nhập số lượng.',
            ]);

       	$chitiet->id_product = $request->SanPham;
        $chitiet->id_bill = $request->HoaDon;
        $chitiet->quantity = $request->quantity;
        $sp = Product::find($request->SanPham);
        if($sp->promotion_price)
            $chitiet->unit_price = $sp->promotion_price;
        else
            $chitiet->unit_price = $sp->unit_price;

        $chitiet->save();

        $hoadon = $chitiet->bill;
        $hoadon->total = 0;
        foreach ($hoadon->billDetail as $ct) {
         	$hoadon->total = $hoadon->total + $ct->unit_price * $ct->quantity;
        } 
        $hoadon->save();

        return redirect('admin/chitiet/sua/'.$id)->with('thongbao','Sửa thành công.');
    }

    /*
    |--------------------------------------------------------------------------
    | delete a bill detail from database 
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getXoa($id) {
        $chitiet = BillDetail::find($id);

        $hoadon = $chitiet->bill;

        $chitiet->delete();

        $hoadon->total = 0;
        foreach ($hoadon->billDetail as $ct) {
         	$hoadon->total = $hoadon->total + $ct->unit_price * $ct->quantity;
        } 
        $hoadon->save();
        
        return redirect('admin/chitiet/danhsach')->with('thongbao', 'Xóa thành công.');
    }

}

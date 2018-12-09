<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Customer;
use App\Bill;
use App\BillDetail;

class KhachHangController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | get view to display all information about customer 
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getDanhSach() {
        $khachhang = Customer::get();
    	return view('admin.khachhang.danhsach', ['khachhang'=>$khachhang]);
    }

    /*
    |--------------------------------------------------------------------------
    | get view to fix information of customer 
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getSua($id) {
    	$khachhang = Customer::find($id);
        return view('admin.khachhang.sua', ['khachhang'=>$khachhang]);
    }

    /*
    |--------------------------------------------------------------------------
    | update information of a customer
    |-------------------------------------------------------------------------- 
    | receive all information of customer
    | and check it
    | if information wrong send error message
    | else save to database and send success message
    |
    */
    public function postSua(Request $request, $id) {
        $khachhang = Customer::find($id);
        $this->validate($request,
            [
                'name'=>'required',
                'email'=>'required',
                'address'=>'required',
                'phone_number'=>'required',
            ],
            [
                'name.required'=>'Bạn chưa điền tên.',
                'email.required'=>'Bạn chưa điền email.',
                'address.required'=>'Bạn chưa điền địa chỉ.',
                'phone_number.required'=>'Bạn chưa ghi số điện thoại.',
            ]);

        $khachhang->name = $request->name;
        $khachhang->gender = $request->gender;
        $khachhang->email = $request->email;
        $khachhang->address = $request->address;
        $khachhang->phone_number = $request->phone_number;
        if($request->note)
            $khachhang->note = $request->note;

        $khachhang->save();

        return redirect('admin/khachhang/sua/'.$id)->with('thongbao','Sửa thành công.');
    }

    /*
    |--------------------------------------------------------------------------
    | delete a customer from database
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getXoa($id) {
        $khachhang = Customer::find($id);

        if($khachhang->bill){
        	foreach ($khachhang->bill as $hd) {
                if($hd->billDetail)
                {
                    $chitiet = $hd->billDetail;
                    foreach ($chitiet as $ct) {
                        $ct->delete();
                    }
                    $hd->delete();
                }
                else
                    $hd->delete();
        	}
        	$khachhang->delete();
        	
        }
        else{
        	$khachhang->delete();
        }
        
        return redirect('admin/khachhang/danhsach')->with('thongbao', 'Xóa thành công.');
    }
}

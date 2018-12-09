<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Bill;
use App\Customer;

class HoaDonController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | get view to display all information of list bill 
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getDanhSach() {
        $hoadon = Bill::get();
    	return view('admin.hoadon.danhsach', ['hoadon'=>$hoadon]);
    }

    /*
    |--------------------------------------------------------------------------
    | set bill status from 0 to 1 
    |-------------------------------------------------------------------------- 
    | set bill status is 1
    |
    */
    public function getFixStatus($id){
        $bill = Bill::find($id);

        $bill->status = 1;
        $bill->save();
        return redirect('admin/hoadon/danhsach')->with('thongbao', 'Sửa thành công.');
    }

    /*
    |--------------------------------------------------------------------------
    | delete bill from database 
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getXoa($id) {
        $hoadon = Bill::find($id);

        if($hoadon->billDetail){
        	foreach ($hoadon->billDetail as $ct) {
                $ct->delete();
        	}
        	$hoadon->delete();
        	
        }
        else{
        	$hoadon->delete();
        }
        
        return redirect('admin/hoadon/danhsach')->with('thongbao', 'Xóa thành công.');
    }
}

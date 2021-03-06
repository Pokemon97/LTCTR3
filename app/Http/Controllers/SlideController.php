<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Slide;

class SlideController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | get view to display all slide 
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getDanhSach(){
    	$slide = Slide::all();
    	return view('admin.slide.danhsach', ['slide' => $slide]);
    }

    /*
    |--------------------------------------------------------------------------
    | get view to add a slide  
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getThem(){
    	return view('admin.slide.them');
    }

    /*
    |--------------------------------------------------------------------------
    | add a slide to list of slide
    |-------------------------------------------------------------------------- 
    | receive all information of a slide (link of slide and slide) 
    | check link of slide and kind of image file of slide
    | if fit save to the database and send success message
    | else send error message
    |
    */
    public function postThem(Request $request){
    	$this->validate($request,
            [
                'link'=>'required',
                'Hinh'=>'required',
            ],
            [
                'link.required'=>'Bạn chưa nhập link.',
                'Hinh.required'=>'Bạn chưa nhập hình ảnh',
            ]);
    	$slide = new Slide();
    	if($request->has('link'))
    		$slide->link = $request->link;

    	if($request->hasFile('Hinh')){
            $file = $request->file('Hinh');

            $duoi = $file->getClientOriginalExtension();
            if($duoi != 'jpg' && $duoi != 'png' && $duoi != 'jpeg'){
               return redirect('admin/slide/them')->with('loi', 'Chỉ được chọn file jpg, png, jpeg'); 
            }

            $name = $file->getClientOriginalName();
            $Hinh = str_random(4)."_".$name;
            while (file_exists("source/image/banner/".$Hinh)) {
                $Hinh = str_random(4)."_".$name;
            }
            $file->move('source/image/banner', $Hinh);
            $slide->image = $Hinh;
        }
        else{
            $slide->image = "";
        }
        $slide->save();
        return redirect('admin/slide/them')->with('thongbao', 'Thêm thành công');
    }

    /*
    |--------------------------------------------------------------------------
    | get view to fix a slide
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getSua($id) {
    	$slide = Slide::find($id);
    	return view('admin.slide.sua', ['slide'=>$slide]);
    }

    /*
    |--------------------------------------------------------------------------
    | update a slide to database 
    |-------------------------------------------------------------------------- 
    | receive all information of a slide (link of slide and slide) 
    | check link of slide and kind of image file of slide
    | if fit save to the database and send success message
    | else send error message
    |
    */
    public function postSua(Request $request, $id){
    	$slide = Slide::find($id);
    	$this->validate($request,
            [
                'link'=>'required',
            ],
            [
                'link.required'=>'Bạn chưa nhập link.',
            ]);
    	if($request->has('link'))
    		$slide->link = $request->link;

    	if($request->hasFile('Hinh')){
            $file = $request->file('Hinh');

            $duoi = $file->getClientOriginalExtension();
            if($duoi != 'jpg' && $duoi != 'png' && $duoi != 'jpeg'){
               return redirect('admin/slide/sua/'.$id)->with('loi', 'Chỉ được chọn file jpg, png, jpeg'); 
            }

            $name = $file->getClientOriginalName();
            $Hinh = str_random(4)."_".$name;
            while (file_exists("source/image/banner/".$Hinh)) {
                $Hinh = str_random(4)."_".$name;
            }
            $file->move('source/image/banner', $Hinh);
            
            if($slide->image != "") 
                unlink("source/image/banner/".$slide->image);

            $slide->image = $Hinh;
        }
        $slide->save();

        return redirect('admin/slide/sua/'.$id)->with('thongbao', 'Sửa thành công');
    }

    /*
    |--------------------------------------------------------------------------
    | delete a slide from database 
    |-------------------------------------------------------------------------- 
    | 
    */
    public function getXoa($id){
    	$slide = Slide::find($id);
    	$slide->delete();

    	return redirect('admin/slide/danhsach')->with('thongbao', 'Xóa thành công');
    }

}


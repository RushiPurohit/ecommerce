<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Slider;
use App\Model\Products;
use App\Model\Category;
use DB;

class SliderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $slider = Slider::get();
        $products = Products::where('status', '1')->pluck('product_name', 'id');
        $category = Category::where('status', '1')->pluck('category_name', 'id');
        return view('Admin.Slider.index', compact('slider', 'products', 'category'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request->all());
        $this->validate($request, [
            'slider_image'  => 'required',
            'slider_image_arabic'  => 'required',
            'slider_option'        => 'required',
            // 'options'              => 'required',
        ]);

        try {
            DB::beginTransaction();
            if ($request->hasFile('slider_image') && $request->hasFile('slider_image_arabic')) {
                $imagePath = $this->uploadImage($request->file('slider_image'));
                $imageaPthArabic = $this->uploadImage($request->file('slider_image_arabic'));

                Slider::create([
                    'slider_image'          => $imagePath,
                    'slider_image_arabic'   => $imageaPthArabic,
                    'status'                => '1',
                    'slider_option'        => $request->get('slider_option'),
                    'options'              => $request->has('options') && $request->get('options') != null ? $request->get('options') : $request->get('options2'),
                    'created_by'            => \Auth::user()->id,
                ]);
            }
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            //throw $th;
            return redirect()->back()->with('error', __('language.alertMessage.internalServerError'))->withInput();
        }
        return redirect()->to('slider')->with('success', __('language.slider').' '.__('language.alertMessage.created'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        try {
            DB::beginTransaction();
            if ($request->hasFile('slider_image')) {
                
                $imagePath = $this->uploadImage($request->file('slider_image'));
                    
            }else { 
                
                $imagePath = $request->get('old_slider_img');
                                
            } 
            if($request->hasFile('slider_image_arabic')){
                $imageaPthArabic = $this->uploadImage($request->file('slider_image_arabic'));
            }else{
                $imageaPthArabic = $request->get('old_slider_arabic_img');
            }
            $value = [
                    'slider_image'          => $imagePath,
                    'slider_image_arabic'   => $imageaPthArabic,
                    'status'                => '1',
                    'slider_option'         => $request->get('slider_option'),
                    'options'              => $request->has('options') && $request->get('options') != null ? $request->get('options') : $request->get('options2'),
                    'created_by'            => \Auth::user()->id,
                
            ]; 
            
            Slider::where('id',$id)->update($value);    
            DB::commit();   
            return redirect()->to('slider')->with('success', __('language.slider').' '.__('language.alertMessage.created'));     
        } catch (\Throwable $th) {
            DB::rollBack();
            //throw $th;
            return redirect()->back()->with('error', __('language.alertMessage.internalServerError'))->withInput();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            Slider::destroy($id);
        } catch (\Exception $e) {
            return response()->json(['error' => __('language.alertMessage.internalServerError')]);
        }
        
        return response()->json(['success' =>  __('language.slider').' '.__('language.alertMessage.deleted')]);
    }

    public function uploadImage($image)
    {
        $tempname = explode('.', $image->getClientOriginalName());
        $tempname = str_replace(' ', '_', $tempname);
        $name = $tempname[0].'_'.time().'.'.$image->getClientOriginalExtension();
        // $path = 'uploads/book'.$request->get('bookId').'/'.$request->get('coverPage');
        $path = '/uploads/Slider';
        $destinationPath = public_path($path);
        $imagePath = $destinationPath. "/". $name;
        $image->move($destinationPath, $name);
        return $path.'/'.$name;
    }
}

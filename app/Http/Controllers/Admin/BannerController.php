<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Banners;
use App\Model\Products;
use App\Model\Category;
use DB;

class BannerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $banners = Banners::get();
        $products = Products::where('status', '1')->pluck('product_name', 'id');
        $category = Category::where('parent_category', '0')->where('status', '1')->pluck('category_name', 'id');
        return view('Admin.Banners.index', compact('banners', 'products', 'category'));
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
        $this->validate($request, [
            'banner_image'  => 'required',
            'banner_image_arabic'  => 'required',
            'banner_option'        => 'required',
            // 'options'              => 'required',
        ]);

        try {
            DB::beginTransaction();
            if ($request->hasFile('banner_image') && $request->hasFile('banner_image_arabic')) {
                $imagePath = $this->uploadImage($request->file('banner_image'));
                $imageaPthArabic = $this->uploadImage($request->file('banner_image_arabic'));

                Banners::create([
                    'banner_image'          => $imagePath,
                    'banner_image_arabic'   => $imageaPthArabic,
                    'status'                => '1',
                    'banner_option'         => $request->get('banner_option'),
                    'options'               => $request->has('options') && $request->get('options') != null ? $request->get('options') : $request->get('options2'),
                    'created_by'            => \Auth::user()->id,
                ]);
            }
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            //throw $th;
            return redirect()->back()->with('error', __('language.alertMessage.internalServerError'))->withInput();
        }
        return redirect()->to('banners')->with('success', __('language.banner').' '.__('language.alertMessage.created'));
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
    public function edit(Request $request, $id)
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
        //dd($request->get('banner_image'));
        //
        try {
            DB::beginTransaction();
            if ($request->hasFile('banner_image')) {
                
                $imagePath = $this->uploadImage($request->file('banner_image'));
                
            }else { 
                
                $imagePath = $request->get('old_banner_img');
                                
            } 
            if($request->hasFile('banner_image_arabic')){
                $imageaPthArabic = $this->uploadImage($request->file('banner_image_arabic'));    
            }else{
                $imageaPthArabic = $request->get('old_banner_arabic_img');
            }
            $value = [
                    'banner_image'          => $imagePath,
                    'banner_image_arabic'   => $imageaPthArabic,
                    'status'                => '1',
                    'banner_option'         => $request->get('banner_option'),
                    'options'               => $request->has('options') && $request->get('options') != null ? $request->get('options') : $request->get('options2'),
                    'created_by'            => \Auth::user()->id, 
                
            ]; 
            //dd($value);
            Banners::where('id',$id)->update($value);    
            DB::commit();   
            return redirect()->to('banners')->with('success', __('language.banner').' '.__('language.alertMessage.created'));     
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
            Banners::destroy($id);
        } catch (\Exception $e) {
            return response()->json(['error' => __('language.alertMessage.internalServerError')]);
        }
        
        return response()->json(['success' =>  __('language.banner').' '.__('language.alertMessage.deleted')]);
    }

    public function uploadImage($image)
    {        
        $tempname = explode('.', $image->getClientOriginalName());
        $tempname = str_replace(' ', '_', $tempname);
        $name = $tempname[0].'_'.time().'.'.$image->getClientOriginalExtension();
        // $path = 'uploads/book'.$request->get('bookId').'/'.$request->get('coverPage');
        $path = '/uploads/Banners';
        $destinationPath = public_path($path);
        $imagePath = $destinationPath. "/". $name;
        $image->move($destinationPath, $name);
        return $path.'/'.$name;
    }
}

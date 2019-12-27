<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
use App\User;
use App\Model\Tax;
use App\Model\Category;
use App\Model\Products;
use App\Model\Offers;
use App\Model\Slider;
use App\Model\Banners;
use Auth;

class GeneralSettingController extends Controller
{
    public function changeStatus($table, $id, $value)
    {
        try {
            if ($table == 'taxes')
                $data = new Tax();
            if ($table == 'categories')
                $data = new Category();
            if ($table == 'products')
                $data = new Products();
            if ($table == 'offers')
                $data = new Offers();
            if ($table == 'sliders')
                $data = new Slider();
            if ($table == 'banners')
                $data = new Banners();
            
            DB::beginTransaction();
            $getData = DB::table($table)->where('id', $id)->first();
            $status = '1';
            if ($getData->status == '1')
                $status = '0';
            
			$data->whereId($id)->update([
				'status' => $status,
			]);
            $language = 'language.'.$table;
            if ($table == 'categories') {
               Slider::where('slider_option', 'category')->where('options', $id)->update(['status'=> $status]);
               Banners::where('banner_option', 'category')->where('options', $id)->update(['status'=> $status]);
               Products::where('category_id', $id)->update(['status' => $status]);
            }
            if ($table == 'products') {
                Slider::where('slider_option', 'product')->where('options', $id)->update(['status'=> $status]);
             }
			DB::commit();

		} catch (Exception $e) {
			DB::rollBack();
            dd($e);
			return redirect()->back()->with('error', __('language.alertMessage.internalServerError'));
		}

		return response()->json([
			'success' => __($language) . ' ' . __('language.alertMessage.statusChange'),
		]);
    }
}

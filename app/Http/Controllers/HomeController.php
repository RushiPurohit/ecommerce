<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Model\Orders;
use App\Model\Products;
use App\User;
use DB;
use Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $orderChart = DB::table('orders')->select(DB::raw('sum(grand_total) as `grand_total`'), DB::raw('count(id) as `total_order`'), DB::raw("DATE_FORMAT(created_at, '%m-%Y') new_date"),  DB::raw('YEAR(created_at) year, MONTH(created_at) month'))
        ->groupBy('year','month')
        ->get();
    
        $productSale = DB::table('order_details')
                ->join('child_products', 'order_details.product_child_id', '=', 'child_products.id')
                ->join('products', 'child_products.product_id', '=', 'products.id')
                ->select(DB::raw('count(order_details.id) as `total_product`'), DB::raw("DATE_FORMAT(order_details.created_at, '%m-%Y') new_date"),  DB::raw('YEAR(order_details.created_at) year, MONTH(order_details.created_at) month'))
                ->groupBy('year','month');
                // ->groupBy('products.id')
        if (Auth::user()->role_id != 1) {
            $productSale = $productSale->where('products.created_by', Auth::user()->id);
        }
        $productSale = $productSale->get();
        
        $panymentChart = DB::table('orders')->select( DB::raw('COUNT( ( CASE WHEN payment_method = 1 THEN payment_method END ) ) AS `cash`'), DB::raw('COUNT( ( CASE WHEN payment_method = 2 THEN payment_method END ) ) AS `card`'))
        // ->groupBy('cash','card')
        ->get();
        
        $productCount = Products::count();
        $orderCount = Orders::count();
        $userCount = User::where('role_id', 3)->count();
        $sellerCount = User::where('role_id', 2)->count();

        // dd($productCount);
        return view('home', compact('orderChart', 'productSale', 'panymentChart', 'productCount', 'orderCount', 'userCount', 'sellerCount'));
    }
    public function changeLocale($locale)
    {
        \Session::put('locale', $locale);
        // dd($locale);
        app()->setLocale($locale);
        // dd(\App::getLocale());
        return redirect()->back();
    }
    /**
     * Clear css cache.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public static function fileVersion($uri){
        $file = $_SERVER['DOCUMENT_ROOT'].'/'.$uri;
        if (!file_exists($file)) return $file;

        return $uri.'?v='.filemtime ( $file );
    }
}

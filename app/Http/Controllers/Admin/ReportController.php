<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Orders;
use App\Model\Category;
use DB;
use Auth;

class ReportController extends Controller
{
	/**
	* Display a listing of the resource.
	*
	* @return \Illuminate\Http\Response
	*/
    public function index()
    {
       
    }

    public function totalAmount(Request $request)
    {
    	//Here Get Product Sale and Amount Report [Start]
        $category = $request->has('category') ? $request->get('category') : null;
        $product = $request->has('product') ? $request->get('product') : null;
        $start_date = $request->has('start_date') ? $request->get('start_date') : null;
        $end_date = $request->has('end_date') ? $request->get('end_date') : null;
        $user = $request->has('user') ? $request->get('user') : null;
        $totalAmount = DB::table('orders')
            ->join('order_details', 'order_details.order_id', '=', 'orders.id')
            ->join('child_products', 'order_details.product_child_id', '=', 'child_products.id')
            ->join('products', 'child_products.product_id', '=', 'products.id')
            ->join('categories', 'categories.id', '=', 'products.category_id')
            ->select(DB::raw('orders.created_at,count(order_details.id) as `total_product`,sum(order_details.grand_total) as `grand_total`,products.product_name,categories.category_name'))
            ->groupBy('products.id');  

            //Here Session for admin          
            if(Auth::user()->role_id != 1){
                $totalAmount = $totalAmount->where('products.created_by',Auth::user()->id);
            }

            //Here searching area [Start]
            if($request->get('product')) { 
                $totalAmount = $totalAmount->where('products.id',$request->get('product'));
            }
            if($request->get('user')) { 
                $totalAmount = $totalAmount->where('products.created_by',$request->get('user'));
            } 
            if($request->get('category')) { 
                $totalAmount = $totalAmount->where('categories.id',$request->get('category'));
            } 
            if($request->get('start_date')) { 
                $totalAmount = $totalAmount->whereDate('orders.created_at', '>=', $request->get('start_date'));
            } 
            if($request->get('end_date')) { 
                $totalAmount = $totalAmount->whereDate('orders.created_at', '<=', $request->get('end_date'));
            } 
            //Here searching area [End]


            $totalAmount=$totalAmount->groupBy('products.id')->get();
        //Here Session for admin for products    
        if(Auth::user()->id != 1){
            $products = DB::table('products')->where('products.created_by',Auth::user()->id)->where('products.status','1')->pluck('product_name', 'id');            
        }else{
            $products = DB::table('products')->pluck('product_name', 'id');  
        }
        $categories = DB::table('categories')->pluck('category_name', 'id');

        $users = DB::table('users')->where('id','!=','1')->pluck('first_name', 'id');
        //dd($users);
                
        return view('Admin.reports.totalAmountReport.index', compact('totalAmount','products','categories','users', 'product','category','start_date','end_date','user'));
        //Here Get Product Sale and Amount Report [End]

    } 
    public function totalTransaction(Request $request)
    {
    	//dd($request->all());
        //Here Get Product Sale and Amount Report [Start]
        $category = $request->has('category') ? $request->get('category') : null;
        $product = $request->has('product') ? $request->get('product') : null;
        $start_date = $request->has('start_date') ? $request->get('start_date') : null;
        $end_date = $request->has('end_date') ? $request->get('end_date') : null;
        $user = $request->has('user') ? $request->get('user') : null;
        $paymentMethod = $request->has('paymentMethod') ? $request->get('paymentMethod') : null;
        $totalAmount = DB::table('orders')
            ->join('order_details', 'order_details.order_id', '=', 'orders.id')
            ->join('child_products', 'order_details.product_child_id', '=', 'child_products.id')
            ->join('products', 'child_products.product_id', '=', 'products.id')
            ->join('categories', 'categories.id', '=', 'products.category_id')
            ->select(DB::raw('orders.created_at,orders.payment_method,count(order_details.id) as `total_product`,sum(order_details.grand_total) as `grand_total`,products.product_name,categories.category_name'))
            ->groupBy('products.id');  

            //Here Session for admin          
            if(Auth::user()->id != 1){
                $totalAmount = $totalAmount->where('products.created_by',Auth::user()->id);
            }

            //Here searching area [Start]
            if($request->get('product')) { 
                $totalAmount = $totalAmount->where('products.id',$request->get('product'));
            }
            if($request->get('user')) { 
                $totalAmount = $totalAmount->where('products.created_by',$request->get('user'));
            } 
            if($request->get('category')) { 
                $totalAmount = $totalAmount->where('categories.id',$request->get('category'));
            } 
            if($request->get('paymentMethod')) { 
                $totalAmount = $totalAmount->where('orders.payment_method', $request->get('paymentMethod'));
               
            }
            if($request->get('start_date')) { 
                $totalAmount = $totalAmount->whereDate('orders.created_at', '>=', $request->get('start_date'));
            } 
            if($request->get('end_date')) { 
                $totalAmount = $totalAmount->whereDate('orders.created_at', '<=', $request->get('end_date'));
            }
             
            //Here searching area [End]


            $totalAmount=$totalAmount->groupBy('products.id')->get();
        //Here Session for admin for products    
        if(Auth::user()->id != 1){
            $products = DB::table('products')->where('products.created_by',Auth::user()->id)->where('products.status','1')->pluck('product_name', 'id');            
        }else{
            $products = DB::table('products')->pluck('product_name', 'id');  
        }
        $categories = DB::table('categories')->pluck('category_name', 'id');

        $users = DB::table('users')->where('id','!=','1')->pluck('first_name', 'id');
        //dd($users);
                
        return view('Admin.reports.totalTransactionReport.index', compact('totalAmount','products','categories','users', 'product','category','start_date','end_date','user','paymentMethod'));
        //Here Get Product Sale and Amount Report [End]
    }
    

}

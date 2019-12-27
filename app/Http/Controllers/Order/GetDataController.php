<?php

namespace App\Http\Controllers\Order;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Products;
use App\Model\ChildProducts;
use App\Model\ChildAttribute;
use App\Model\Attributes;
use App\Model\ProductSpecification;
use App\Model\ShippingAddress;
use App\Model\Offers;
use App\Model\Category;
use App\Model\Slider;
use App\Model\Banners;
use App\Model\Orders;
use App\Model\OrderDetails;
use DB;
use Auth;

class GetDataController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    
    public function products()
    {
        $product = Products::where('status', '1')->get();
        $latest = [];
        $futured = [];
        foreach ($product as $key => $value) {
            $expProd = explode(',', $value->product_other_image);
            $value->product_other_image = $expProd;
            $value->getChildProduct = $value->getChildProduct;
            $value->getSeller = $value->getSeller;
            // $value->getChildProduct;
            if($value->is_futured == 1) {
                $futured[] = $value;
            }
            if($value->is_latest == 1) {
                $latest[] = $value;
            }
        }
        // most selled product
        $most = OrderDetails::select('product_child_id', DB::raw('COUNT("quantity") as quantity'))->groupBy('product_child_id')->orderBy('quantity', 'DESC')->take(10)->get();
        foreach ($most as $key => $value) {
            $childProduct = ChildProducts::where('id', $value->product_child_id)->first();
            $productMost = Products::whereId($childProduct->product_id)->first();
            $expProd = explode(',', $productMost->product_other_image);
            $productMost->product_other_image = $expProd;
            $productMost->getChildProduct = $productMost->getChildProduct;
            $productMost->getSeller = $productMost->getSeller;
            $value->product = $productMost;

        }
        // dd($most);

        return response()->json([
            'success'           => true,
            'message'           => 'Data found',
            'arabic_message' => 'تم العثور على البيانات',
            'data'              => $product,
            'latestProduct'     => $latest,
            'futuredProduct'    => $futured,
            'bestSeller'        => $most,
        ], 200);
    }

    /**
     * Retrun coupon code value.
     *
     * @return \Illuminate\Contracts\Support\Response
     */

    public function getCoupon(Request $request)
    {
        $this->validate($request, [
            'couponCode' => 'required'
        ]);        
        $couponCode = Offers::where('coupon_code', $request->get('couponCode'))->where('status', '1')->first();
        if($couponCode) {
            return response()->json([
                'success'   => true,
                'message'   => 'Data found',
                'arabic_message' => 'تم العثور على البيانات',
                'data'      => $couponCode,
            ], 200);
        } else {
            return response()->json([
                'success'   => false,
                'message'   => 'Coupon not found.',
                'arabic_message' => 'القسيمة غير موجودة.',
                'data'      => [],
            ], 500);
        }
    }
    
    /**
     * Retrun country code.
     *
     * @return \Illuminate\Contracts\Support\Response
     */
    public function getCountryCode()
    {
        return response()->json([
            'success'   => true,
            'message'   => 'Data found',
            'arabic_message' => 'تم العثور على البيانات',
            'data'      => DB::table('countries')->get(),
        ], 200);
    }

    /**
     * Retrun Category data.
     *
     * @return \Illuminate\Contracts\Support\Response
     */
    public function categories()
    {
        $category = Category::where('parent_category', 0)->where('status', '1')->get();
        foreach ($category as $key => $value) {
            $value->childCategory = Category::where('parent_category', $value->id)->where('status', '1')->get();
            $value->parent = $value->parent;
            foreach ($value->getPorduct as $keyP => $valueP) {
                $valueP->product_other_image = explode(',', $valueP->product_other_image);
                $valueP->getChildProduct;
            }
            foreach ($value->childCategory as $key => $value) {
                foreach ($value->getPorduct as $keyP => $valueP) {
                    $valueP->product_other_image = explode(',', $valueP->product_other_image);
                    $valueP->getChildProduct;
                }
            }
        }
        $allCategory = Category::where('status', '1')->get();
        foreach ($allCategory as $key => $value) {
            foreach ($value->getPorduct as $keyP => $valueP) {
                $valueP->product_other_image = explode(',', $valueP->product_other_image);
                $valueP->getChildProduct;
            }
        }
        return response()->json([
            'success'   => true,
            'data'      => $category,
            'allcategory'=> $allCategory,
            'message'   => 'category found',
            'arabic_message' => 'الفئة وجدت',
        ], 200);
    }

    public function allCategories()
    {
        $category = Category::where('status', '1')->get();
        // foreach ($category as $key => $value) {
        //     $value->childCategory = Category::where('parent_category', $value->id)->get();
        //     $value->parent = $value->parent;
        //     foreach ($value->getPorduct as $keyP => $valueP) {
        //         $valueP->getChildProduct;
        //     }
        // }
        return response()->json([
            'success'   => true,
            'data'      => $category,
            'message'   => 'category found',
            'arabic_message' => 'الفئة وجدت',
        ], 200);
    }


    /**
     * Retrun elastic search.
     *
     * @return \Illuminate\Contracts\Support\Response
     */
    public function search(Request $request)
    {
        $search = $request->get('search');
        $product = Products::join('categories', 'products.category_id', '=', 'categories.id')
                    ->join('product_specifications', 'products.id', '=', 'product_specifications.product_id')
                    // ->join('child_products', 'products.id', '=', 'child_products.product_id')
                    ->where('products.product_name', 'LIKE', '%' . $search . '%')
                    ->orWhere('products.product_name_arabic', 'LIKE', '%' . $search . '%')
                    ->orWhere('products.product_code', 'LIKE', '%' . $search . '%')
                    ->orWhere('products.product_description', 'LIKE', '%' . $search . '%')
                    ->orWhere('products.product_description_arabic', 'LIKE', '%' . $search . '%')
                    ->orWhere('categories.category_name', 'LIKE', '%' . $search . '%')
                    ->orWhere('categories.category_name_arabic', 'LIKE', '%' . $search . '%')
                    ->orWhere('product_specifications.key', 'LIKE', '%' . $search . '%')
                    ->orWhere('product_specifications.value', 'LIKE', '%' . $search . '%')
                    ->select('products.*', 'categories.category_name', 'categories.category_name_arabic', 'categories.status as cat_status')
                    ->groupBy('products.id')
                    ->get();
        foreach ($product as $key => $value) {
            $expProd = explode(',', $value->product_other_image);
            $value->product_other_image = $expProd;
            $child = ChildProducts::where('product_id', $value->id)->first();
            $value->sale_price = $child->sale_price;
            $value->price = $child->price;
            $value->childProductId = $child->id;
            $value->getChildProduct;
            // dd(!$value->cat_status || !$value->status, $value->cat_status, $value->status);
            if (!$value->cat_status || !$value->status) {
                unset($product[$key]);
            }
            // $value->getChildProduct;
        }
        if (count($product) > 0) {
            return response()->json([
                'success'   => true,
                'data'      => $product,
                'message'   => 'Search found',
                'arabic_message' => 'البحث وجدت',
            ], 200);
        } else {
            return response()->json([
                'success'   => false,
                'data'      => $product,
                'message'   => 'No Product found',
                'arabic_message' => 'لم يتم العثور على المنتج',
            ], 200);
        }
        
    }


    public function productsDetails($id)
    {
        $product = ChildProducts::where('product_id', $id)->get();
        
        $withAttribute = [];
        $noAttribute = [];
        $isExist = [];
        $i = 0;
        foreach ($product as $key => $value) {
            if ($value->child_attribute_ids) {
                $cEx = explode(',', $value->child_attribute_ids);
            } else {
                $cEx = [];
            }
            if(count($cEx) > 0) {
                foreach ($cEx as $keyE => $valueE) {
                    $childAttribute = ChildAttribute::where('id', $valueE)->first();                    
                        $withAttribute[] = [
                            'key'   => $childAttribute->getParentAttribute->attribute,
                            'key_arabic'   => $childAttribute->getParentAttribute->attribute_arabic,
                            'id' => $value->id,
                            'price' => $value->price,
                            'sale_price' => $value->sale_price,
                            'attribute' => $childAttribute->value,
                        ];
                        // $withAttribute[$childAttribute->getParentAttribute->attribute][] = [
                        //     'id' => $value->id,
                        //     'price' => $value->price,
                        //     'sale_price' => $value->sale_price,
                        //     'attribute' => $childAttribute->value,
                        // ];
                        // $withAttribute[$childAttribute->getParentAttribute->attribute_arabic][] = [
                        //     'id' => $value->id,
                        //     'price' => $value->price,
                        //     'sale_price' => $value->sale_price,
                        //     'attribute' => $childAttribute->value,
                        // ];
                        
                    
                }
            } else {
                $noAttribute[$i]['price'] = $value->price;
                $noAttribute[$i]['id'] = $value->id;
                $noAttribute[$i]['sale_price'] = $value->sale_price;
                // $parent[$childAttribute->getParentAttribute->attribute][$i]['attribute'] = $childAttribute->value;
                // array_push($isExist, $childAttribute->getParentAttribute->attribute);
                $i++;
            }
        }

        $tmpArr = array();
        foreach($withAttribute as $key=>$value)  {
            $tmpArr[$value['key']][] = $value; 
        }
        // $items = DB::table('child_products')
        //         ->select("child_products.id"
        //             ,DB::raw("(GROUP_CONCAT(child_attributes.id SEPARATOR ',')) as `child_attributes_id`"))
        //         ->leftjoin("child_attributes","child_attributes.id","=","child_products.child_attribute_ids")
        //         ->groupBy('child_products.id')
        //         ->get();
        //         dd($items);
        
        // For attributes
        $data = \DB::table("child_products")
                ->select("child_products.id", "child_products.price", "child_products.sale_price", "child_products.product_id", "child_products.child_attribute_ids",\DB::raw("GROUP_CONCAT(child_attributes.value) as child_attributes"))
                ->leftjoin("child_attributes",\DB::raw("FIND_IN_SET(child_attributes.id,child_products.child_attribute_ids)"),">",\DB::raw("'0'"))
                ->leftjoin("attributes",'child_attributes.attribute_id', '=', 'attributes.id')
                ->groupBy("child_products.id")
                ->groupBy("child_products.price")
                ->groupBy("child_products.sale_price")
                ->groupBy("child_products.product_id")
                ->groupBy("child_products.child_attribute_ids")
                ->where('child_products.product_id', $id)
                ->get();
        foreach ($data as $key => $value) {
            if ($value->child_attribute_ids) {                
                $child = explode(',', $value->child_attribute_ids);
                if (count($child) > 0) {
                    $array = [];
                    $array2 = [];
                    $array3 = [];
                    foreach ($child as $keyC => $valueC) {
                        $att = ChildAttribute::where('id', $valueC)->first();
                        $array[] = $att->getParentAttribute->attribute;
                        $array3[] = $att->getParentAttribute->attribute_arabic;
                        $array2[] = $att->getParentAttribute->id;
                    }
                    $value->attribute = implode(',', $array);
                    $value->attribute_arabic = implode(',', $array3);
                    $value->attributeId = implode(',', $array2);
                }
            }   
        }
        // dd($data);
        $newAr = [];
        // get specification
        $specification = ProductSpecification::where('product_id', $id)->get();
        $mainProduct = Products::where('id', $id)->first();
        $mainProduct->getSeller = $mainProduct->getSeller;
        return response()->json([
            'success'       => true,
            'message'       => 'Data found',
            'arabic_message' => 'تم العثور على البيانات',
            'data'          => $product,
            'child'         => $data,
            'product'       => $mainProduct,
            'specification' => $specification,
            'attributes'    => $tmpArr,
            'noAttribute'   => $noAttribute,
        ], 200);
    }

    public function getCategory($id)
    {
        $category = Category::where('id', $id)->first();
        
        $category->childCategory = Category::where('parent_category', $category->id)->get();
        $category->parent = $category->parent;
        foreach ($category->getPorduct as $keyP => $valueP) {
            $valueP->getChildProduct;
        }
        return response()->json([
            'success'   => true,
            'data'      => $category,
            'message'   => 'category found',
            'arabic_message' => 'الفئة وجدت',
        ], 200);
    }

    public function slider()
    {
        $sliders = Slider::where('status', '1')->get();
        return response()->json([
            'success'   => true,
            'data'      => $sliders,
            'message'   => 'slider found',
            'arabic_message' => 'تم العثور على شريط التمرير',
        ], 200);
    }

    public function getBanner()
    {
        $banner = Banners::where('status', '1')->get();
        $data = [];
        foreach ($banner as $key => $value) {
            if ($value->banner_option == 'category') {
                $category = Category::where('parent_category', $value->options)->get();
                // dd(count($category), $value->options);
                // foreach ($category as $keyC => $valueC) {
                //     foreach ($valueC->getPorduct as $keyP => $valueP) {
                //         $valueP->product_other_image = explode(',', $valueP->product_other_image);
                //         $valueP->product_other_image_arabic = explode(',', $valueP->product_other_image_arabic);
                //         $valueP->getChildProduct;
                //     }
                // }
                $categoryAll = Category::where('parent_category', $value->options)->orWhere('id', $value->options)->pluck('id');
                $product = Products::whereIn('category_id', $categoryAll)->where('status', '1')->get();
                foreach ($product as $keyP => $valueP) {
                    $valueP->product_other_image = explode(',', $valueP->product_other_image);
                    $valueP->getChildProduct = $valueP->getChildProduct;
                    $valueP->getSeller = $valueP->getSeller;
                }
                $categoryName = Category::where('id', $value->options)->first();
                $value->category_name = $categoryName->category_name;
                $value->category_name_arabic = $categoryName->category_name_arabic;
                $value->category = $category;
                $value->product = $product;
            }
        }
        return response()->json([
            'success'   => true,
            'data'      => $banner, 
        ]);
    }

    public function homePage()
    {
        $sliders = Slider::where('status', '1')->get();

        $banner = Banners::where('status', '1')->get();
        $data = [];
        foreach ($banner as $key => $value) {
            if ($value->banner_option == 'category') {
                $category = Category::where('parent_category', $value->options)->where('status', '1')->get();
                $categoryAll = Category::where('status', '1')->where('parent_category', $value->options)->orWhere('id', $value->options)->pluck('id');
                $product = Products::whereIn('category_id', $categoryAll)->where('status', '1')->get();
                foreach ($product as $keyP => $valueP) {
                    $valueP->product_other_image = explode(',', $valueP->product_other_image);
                    $valueP->getChildProduct = $valueP->getChildProduct;
                    $valueP->getSeller = $valueP->getSeller;
                }
                $categoryName = Category::where('status', '1')->where('id', $value->options)->first();

                $value->category_name = $categoryName ? $categoryName->category_name : '';
                $value->category_name_arabic = $categoryName ? $categoryName->category_name_arabic : '';
                $value->category = $category;
                $value->product = $product;
            }
        }
        $product = Products::where('status', '1')->get();
        $latest = [];
        $futured = [];
        foreach ($product as $key => $value) {
            $expProd = explode(',', $value->product_other_image);
            $value->product_other_image = $expProd;
            $value->getChildProduct = $value->getChildProduct;
            $value->getSeller = $value->getSeller;
            // $value->getChildProduct;
            if($value->is_futured == 1) {
                $futured[] = $value;
            }
            if($value->is_latest == 1) {
                $latest[] = $value;
            }
        }
        // most selled product
        $most = OrderDetails::select('product_child_id', DB::raw('COUNT("quantity") as quantity'))->groupBy('product_child_id')->orderBy('quantity', 'DESC')->take(10)->get();
        foreach ($most as $key => $value) {
            $childProduct = ChildProducts::where('id', $value->product_child_id)->first();
            $productMost = Products::whereId($childProduct->product_id)->where('status', '1')->first();
            if ($productMost) {
                $expProd = explode(',', $productMost->product_other_image);
                $productMost->product_other_image = $expProd;
                $productMost->quantity = $value->quantity;
                $productMost->getChildProduct = $productMost->getChildProduct;
                $productMost->getSeller = $productMost->getSeller;
                $most[$key] = $productMost;
            }

        }
        // dd($most);

        return response()->json([
            'success'   => true,
            'banner'      => $banner, 
            'slider'      => $sliders, 
            'data'              => $product,
            'latestProduct'     => $latest,
            'futuredProduct'    => $futured,
            'bestSeller'        => $most,
        ]);

    }
    
    public function categoriesItem($id)
    {
        $category = Category::where('id', $id)->where('status', '1')->first();
        if ($category) {
            
            $category->childCategory = Category::where('status', '1')->where('parent_category', $category->id)->get();
            $category->parent = $category->parent;
            foreach ($category->getPorduct as $keyP => $valueP) {
                $valueP->product_other_image = explode(',', $valueP->product_other_image);
                $valueP->getChildProduct;
            }
            foreach ($category->childCategory as $key => $value) {
                foreach ($value->getPorduct as $keyP => $valueP) {
                    $valueP->product_other_image = explode(',', $valueP->product_other_image);
                    $valueP->getChildProduct;
                }
            }
            
        }
        return response()->json([
            'success'   => true,
            'message'   => 'Data found',
            'arabic_message'   => 'تم العثور على البيانات',
            'data'      => $category,
        ], 200);
    }
    
}

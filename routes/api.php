<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


// Route::middleware('auth:api')->get('/user', function (Request $request) {
    //     return $request->user();
    // });

Route::group(['middleware' => 'auth:api'], function(){
    Route::resource('shippingAddress', 'Order\ShippingAddressController');
    Route::resource('orders', 'Order\OrderController');
    Route::post('cart/storage', 'Order\CartController@storage');
    Route::get('cart/getCart', 'Order\CartController@getCart');
    Route::resource('cart', 'Order\CartController');
    Route::post('myProfileUpdate','Api\UserController@myProfileUpdate');
    Route::get('userData','Api\UserController@userData');
    Route::post('changePassword', 'Api\UserController@changePassword');
});


Route::post('login', 'Api\LoginController@login');

Route::get('products', 'Order\GetDataController@products');

Route::get('products/{id}', 'Order\GetDataController@productsDetails');

Route::post('getCoupon', 'Order\GetDataController@getCoupon');

Route::get('getCountryCode', 'Order\GetDataController@getCountryCode'); //get Countries data

Route::resource('users', 'Api\UserController');

Route::get('categories', 'Order\GetDataController@categories');

Route::get('categories/{id}', 'Order\GetDataController@categoriesItem');

Route::get('getCategory/{id}', 'Order\GetDataController@getCategory');

Route::get('allCategories', 'Order\GetDataController@allCategories');

Route::post('search', 'Order\GetDataController@search');

Route::get('slider', 'Order\GetDataController@slider');

Route::get('banners', 'Order\GetDataController@getBanner');

Route::get('homePage', 'Order\GetDataController@homePage');

//for password reset
Route::group([
    'middleware' => 'api',
    'prefix' => 'password'
], function () {
    Route::post('create', 'PasswordResetController@create');
    Route::get('find/{token}', 'PasswordResetController@find');
    Route::post('reset', 'PasswordResetController@reset');
});



/*
Encryption keys generated successfully.
Personal access client created successfully.
Client ID: 1
Client secret: lSvtUgrM5XZLjz9hFoeXGApgRvGrw1q9P68Kr2Wm
Password grant client created successfully.
Client ID: 2
Client secret: ksr9ENsSIg9pKFwdfmJfhIq76C2ygXKSF6lerBva

 > Ecommerce

Personal access client created successfully.
Client ID: 1
Client secret: Tqbsem7dsBKOPbLkx8BXzIKgGZvi6weX6t9DhXPP


*/
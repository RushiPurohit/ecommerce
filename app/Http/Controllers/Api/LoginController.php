<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Auth;
use DB;

class LoginController extends Controller
{
    /**
     * Login User.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        // Form validation
        $this->validate($request, [
            'email' => 'required',
            'password'  => 'required',
        ]);
        if (Auth::attempt(['email' => $request->get('email'), 'password' => $request->get('password'), 'status' => '1'])) {
            // Authentication passed...
            $users = DB::table('users')
                    ->where('users.email',$request->get('email'))
                    ->first();        
            $user = Auth::user();
            return response()->json([
                'message'     => 'Authenticated!',
                'arebic_message' => 'مصادقة!',
                'data'      => $users,
                'accessToken'   => $user->createToken('Ecommerce')->accessToken,
                'success'   => true,
            ], 200);
        }else{
            $user = User::where('email', $request->get('email'))->first();
            if ($user) {
                // if status is incative
                if ($user->status == '0') {
                    return response()->json([
                        'message'     => 'Your are inactivated by admin!',
                        'arebic_message' => 'يتم تعطيل الخاص بك من قبل المشرف!',
                        'data'      => '',
                        'success'   => false,
                    ], 500);    
                }
                return response()->json([
                    'message'     => 'Password wrong!',
                    'arebic_message' => 'كلمة المرور خاطئة!',
                    'data'      => '',
                    'success'   => false,
                ], 200);    
            }
            // return response with error message
            return response()->json([
                'message'     => 'بيانات الاعتماد غير موجودة!',
                'arebic_message' => '',
                'data'      => '',
                'success'   => false,
            ], 500);
        }
        
    }
}

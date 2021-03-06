<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Notifications\PasswordResetRequest;
use App\Notifications\PasswordResetSuccess;
use App\User;
use App\PasswordReset;

class PasswordResetController extends Controller
{
    /**
    * Create password reset token
    * @param  [string] email
    * @return [string] message
    */
    public function create(Request $request){
    	$request->validate([
    		'email' => 'Required|string|email',
    	]);

    	$user = User::where('email', $request->email)->first();

    	if(!$user){
    		return response()->json([
                'message' => "We can't find a user with that e-mail address.",
                'arabic_message' => "لا يمكننا العثور على مستخدم يحمل عنوان البريد الإلكتروني هذا.",
                'success' => false,
    		],404);
    	}

    	$passwordReset = PasswordReset::updateOrCreate(
    		[	'email' => $user->email ],
    		[
    			'email' => $user->email,
    			'token' => str_random(60)
    		]
    	);

    	if($user && $passwordReset)
    		$user->notify(
    			new PasswordResetRequest($passwordReset->token)
    			);

    	return response()->json([
            'message' => 'We have e-mailed your password reset link!',
            'arabic_message' => 'لقد أرسلنا رابط إعادة تعيين كلمة المرور عبر البريد الإلكتروني!',
            'success' => true,
    	]);
    }
    /**
     * Find token password reset
     *
     * @param  [string] $token
     * @return [string] message
     * @return [json] passwordReset object
     */
    public function find($token){
    	$passwordReset = PasswordReset::where('token', $token)->first();

    	if(!$passwordReset){
    		return response()->json([
                    'message' => 'This password reset token is invalid',
                    'arabic_message' => 'الرمز المميز لإعادة تعيين كلمة المرور غير صالح',
                    'success' => false,
    		],404);
    	}
    	if(Carbon::parse($passwordReset->updated_at)->addMinutes(720)->isPast()){
    		$passwordReset->delete();

    		return response()->json([
                'message' => 'This password reset token is invalid.',
                'arabic_message' => 'الرمز المميز لإعادة تعيين كلمة المرور غير صالح.',
                'success' => false,
    		],404);
    	}
        return view('resetPassword', compact('passwordReset','errors'));
    	// return response()->json($passwordReset);
    }

    /**
     * Reset password
     *
     * @param  [string] email
     * @param  [string] password
     * @param  [string] password_confirmation
     * @param  [string] token
     * @return [string] message
     * @return [json] user object
     */

    public function reset(Request $request){
       // $this->validate($request, [
            //     'email' => 'required',
            //     'password' => 'required',
            //     'token' => 'required'
            // ]);
        $passwordReset = PasswordReset::where('token', $request->token)->where('email', $request->email)->first();

        if (!$passwordReset)
            return response()->json([
                'message' => 'This password reset token is invalid.',
                'arabic_message' => 'الرمز المميز لإعادة تعيين كلمة المرور غير صالح.',
                'success' => false,
                ]);

        $user = User::where('email', $passwordReset->email)->first();

        if (!$user)
            return response()->json([
                'message' => 'This password reset token is invalid.',
                'arabic_message' => 'الرمز المميز لإعادة تعيين كلمة المرور غير صالح.',
                'success' => false,
                ]);

        $user->password = \Hash::make($request->password);
        $user->save();

        $passwordReset->delete();

        $user->notify(new PasswordResetSuccess($passwordReset));

    	 return redirect()->to('/#');
    }

}

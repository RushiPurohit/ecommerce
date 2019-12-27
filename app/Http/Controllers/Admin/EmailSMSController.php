<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Mail;
use Auth;
use App\Mail\Order_Create;

class EmailSMSController extends Controller
{
    //when new user create 
    public function send_email($body,$data){
        try{
            //sender name get from env file
            $name = env('MAIL_FROM_NAME', ' Example');
            //initilize mail send
            $subject = $data['subject'];
            $email = $data['to'];
            Mail::send('emails.registration',['name' => $name, 'body' => $body],function($message) use ($email,$name,$subject) {
                $message->to($email,$name)->subject($subject);
            });
            // Mail::send('emails.registration',array('name' => $name, 'body' => $body),function($message) use ($body,$data){
            //     //email subject and email sender mail id
            //     $message->to($data['to'])->subject($data['subject']);
            //     //send a email body get from template.
            //     $message->setBody($body,'text/html');
            // });
        }catch(\Throwable $th){
            return response()->json([
                'success'   => false,
                'message'   => $th->getMessage(),
                'data'      => [],
            ], 500);
        }
    }
    //order mail when create the order
    public function order_email($data,$email,$subject){
        try{
            $name = env('MAIL_FROM_NAME', ' Example');
            
            Mail::send('emails.order',['values'=>$data],function($message) use ($name,$subject) {
                $message->to('amit.d9ithub@gmail.com',$name)->subject($subject);
            });
        

        }catch(\Throwable $th){
            return response()->json([
                'success'   => false,
                'message'   => $th->getMessage(),
                'data'      => [],
            ], 500);
        }
    }
    //order status mail when change the status
    public function order_status($status,$email,$subject){
        
        try{
            $name = env('MAIL_FROM_NAME', ' Example');
            Mail::send('emails.order_status',['values'=>$status],function($message) use ($email,$name,$subject) {
                $message->to($email,$name)->subject($subject);
            });
        

        }catch(\Throwable $th){
            return response()->json([
                'success'   => false,
                'message'   => $th->getMessage(),
                'data'      => [],
            ], 500);    
        }
    }
}

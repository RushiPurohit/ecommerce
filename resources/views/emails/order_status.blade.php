<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Order Status</title>
    <!-- <link rel="stylesheet" href="{{URL::asset('/ecommerce/css/bootstrap.min.css')}}"> -->

    
<!-- Font Awesome -->
<!-- <link rel="stylesheet" href="{{URL::asset('/ecommerce/css/font-awesome.min.css')}}">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"> -->

<!-- Custom CSS -->
<!-- <link href="{{ \App\Http\Controllers\HomeController::fileVersion('/ecommerce/style.css') }}" rel="stylesheet">
<link href="{{ \App\Http\Controllers\HomeController::fileVersion('/ecommerce/rtl_style.css') }}" rel="stylesheet"> -->

<style>


.imgcircle.dispatch  
{
    background-color: #98d091;
}
.imgcircle {
	height:75px;
	width:75px; margin:0 auto;
	border-radius:50%;
	background-color:#F5998E;
}
.imgcircle  img {padding-top: 14px;}
</style>

</head>
<body>
   <!-- header Email -->
        
   <table  style="width:1000px; margin-left:50px; margin: 0 auto;    border-collapse: collapse;box-shadow: 0 3px 5px -1px rgba(0,0,0,.2), 0 6px 10px 0 rgba(0,0,0,.14), 0 1px 18px 0 rgba(0,0,0,.12); background-color:#079e6d3d; ">
            <thead style=" text-align:center; color:#008258; border-bottom:2px solid #FFBA00;">
                <tr>
                    <th  style="text-align:left" ><img src="http://127.0.0.1:8000/ecommerce/img/logo.png" alt="" title=""  style="width:150px; "></th>
                
                    <th style="padding:20px; text-align:right;">Email US AT : abc@gmail.com</th>
                    <th style="padding:10px; text-align:right;">CONTACT US AT : 2121212112</th>
                </tr>
                
                    
                
            </thead>
        </table>
        <!-- End header Email -->
       <!-- <div class="feature_product">
            <h2 class="fs-title"><img src="http://127.0.0.1:8000/ecommerce/img/title_icon1.png" alt="" title=""> Shipping Details
            <img src="http://127.0.0.1:8000/ecommerce/img/title_icon_mirror1.png" alt="" title=""></h2> 
        </div>    -->
        <table  style="width:1000px; margin-left:50px; margin: 0 auto;    border-collapse: collapse;">
                <thead style=" text-align:center; color:#008258; ">
                 <tr>
                 <th style="padding:20px; text-align:center;"> Shipping Details</th> 
                </tr>
                </thead>
        </table>
            <!-- <div class="status_container">
                <h3>ORDER TRACKING : ORDER NUMBER</h3>
            </div>
                <div class="status_details">
                    <div class="three_row">
                        <h3>Shipped Via : Ipsum Dolor</h3>
                    </div>  
                    <div class="three_row">
                        <h3>Status : Checking Quality</h3>
                    </div> 
                    <div class="three_row">
                        <h3>Expected Date : 7-NOV-2015</h3>
                    </div>   
                </div> 
                        <div class="content3">
                            <div class="shipment">
                                <div class="confirm">
                                    <div class="imgcircle">
                                    <i class="fas fa-check-circle"></i>
                                    </div>
                                    <span class="line"></span>
                                    <p>Confirmed Order</p>
                                </div>
                                <div class="process">
                                    <div class="imgcircle">
                                    <i class="fas fa-chalkboard-teacher"></i>
                                    </div>
                                    <span class="line"></span>
                                    <p>Processing Order</p>
                                </div>
                                <div class="quality">
                                    <div class="imgcircle">
                                    <i class="fas fa-truck"></i>
                                    </div>
                                    <span class="line"></span>
                                    <p>Shipped product</p>
                                </div>
                                <div class="dispatch">
                                    <div class="imgcircle">
                                    <i class="fas fa-handshake"></i>
                                    </div>
                                    <span class="line"></span>
                                    <p>Product Recived </p>
                                </div>
                                <div class="delivery">
                                    <div class="imgcircle">
                                    <i class="far fa-window-close"></i>
                                    </div>
                                    <p>Product Cancel</p>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div> -->
                        <table  style="width:1000px; margin-left:50px; margin: 0 auto;    border-collapse: collapse;">
                            <thead style="background-color:#98d091; text-align:center; color:#fff; ">
                                <tr>
                                    <th style="padding:20px; text-align:center;">ORDER TRACKING : ORDER NUMBER</th>
                                </tr>
                            </thead>
                        </table>

                        <table  cellpadding="0" cellspacing="0"  style="width:1000px; margin-left:50px;  margin: 0 auto;    border-collapse: collapse;">
                            <thead style="color:#4e7d48;background-color:#b5e6ae; text-align:center;">
                                <tr style="padding:20px; text-align:center;">
                                    <th  style="padding:20px;">Shipped Via : Ipsum Dolor</th>
                                    <th style="padding:20px;">Status : Checking Quality</th>
                                    <th >Expected Date : 7-NOV-2015</th>
                                </tr>
                            </thead>
                        </table>

                        <table  cellpadding="0" cellspacing="0"  style="width:1000px; margin-left:50px;  margin: 0 auto;     border-collapse: collapse;">
                            <thead style="color:#4e7d48;background-color:#F5F5F5; text-align:center;">
                                <tr>
                                  <td style="text-align:center; padding:20px;"> 
                                  <div class="confirm" style="text-align: center;">
                                    <div class="imgcircle">
                                    <img src="{{asset('/ecommerce/img/check.png')}}" alt="" title="" height="50px">
                                    </div>
                                    <p>Confirmed Order</p>
                                </div>
                                </td>
                                  <td style="text-align:center; padding:20px;">
                                  <div class="confirm" style="text-align: center;">
                                    <div class="imgcircle">
                                    <img src="{{asset('/ecommerce/img/processing.png')}}" alt="" title="">
                                    </div>
                                    <p>Processing Order</p>
                                </div>
                                </td>
                                  <td style="text-align:center; padding:20px;"> 
                                  <div class="confirm" style="text-align: center;">
                                  <div class="imgcircle dispatch">
                                  <img src="{{asset('/ecommerce/img/shipping.png')}}" alt="" title="">
                                  </div>
                                  <p>Shipped product</p>
                                </div>
                                </td>
                                  <td style="text-align:center; padding:20px;">
                                  <div class="confirm" style="text-align: center;">
                                  <div class="imgcircle">
                                  <img src="{{asset('/ecommerce/img/handshake.png')}}" alt="" title="">
                                    </div><p> Product Recived</p>
                                </div>
                                </td>
                                  <td style="text-align:center; padding:20px;"> 
                                  <div class="confirm" style="text-align: center;">
                                  <div class="imgcircle">
                                  <img src="{{asset('/ecommerce/img/cancel.png')}}" alt="" title="">
                                    </div>
                                    <p> Order Cancel</p>
                                    </div>
                                </td>
                                </tr>
                            </thead>
                        </table>
                      <!-- footer Email-->
         <table  style="width:1000px; margin-left:50px; margin: 0 auto;    border-collapse: collapse;box-shadow: 0 3px 5px -1px rgba(0,0,0,.2), 0 6px 10px 0 rgba(0,0,0,.14), 0 1px 18px 0 rgba(0,0,0,.12); background-color:#079e6d; ">
            <thead style=" text-align:center; background-color:#079e6d;  color:#fff; border-bottom:4px solid #FFBA00 ">
                <tr >
                    <th  style="text-align:left" ></th>
                
                    <th style="padding:20px; text-align:left;">Copyright © 2019. All Rights Reserved.</th>
                    <th style="padding:20px; text-align:right;">Design & Development by:<a style="color:#FFBA00;" href="http://www.d9ithub.com" target="_blank">D9ithub Software Solutions</a></th>
                    
                </tr>
                
                    
                
            </thead>
        </table>
        <!--End footer Email-->   

</body>
</html>
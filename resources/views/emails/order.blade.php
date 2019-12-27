<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Order</title>
    <link rel="stylesheet" href="{{URL::asset('/ecommerce/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{URL::asset('/ecommerce/css/responsive.css')}}">
    
<!-- Font Awesome -->
<link rel="stylesheet" href="{{URL::asset('/ecommerce/css/font-awesome.min.css')}}">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

<!-- Custom CSS -->
 <!-- <link href="{{ \App\Http\Controllers\HomeController::fileVersion('/ecommerce/style.css') }}" rel="stylesheet">
<link href="{{ \App\Http\Controllers\HomeController::fileVersion('/ecommerce/rtl_style.css') }}" rel="stylesheet">  -->
<style>
    

.feature_product h2{font-family: 'Raleway';margin-bottom: 40px;color: #008258;font-weight: 500;}
.feature_product { text-align: center;padding: 45px 0; }

.feature_product h2 
{
    font-family: 'Raleway';
    margin-bottom: 40px;
    color: #008258;
    font-weight: 500;
}

.fs-title {
    font-size: 23px;
    font-family: 'Raleway';
    text-transform: uppercase;
    color: #ffba00;
    margin-bottom: 10px;
    letter-spacing: 2px;
    font-weight: bold;
}

.item_container 
{
    font-size: 16px;
    font-family: 'Raleway';
}
.content_ship_address {
    overflow: hidden;
    padding: 20px;
    width: 100%;
    text-align: left;
}

.item_container {
    font-size: 16px;
    font-family: 'Raleway';
}

.order_summary_container.email_template 
{
    width: 100%;
}

.coupon{width: fit-content;}
.order_summary_container p
{
  text-align: left;
}

.coupon_code h2{text-align: center;
    font-size: 23px;
    font-family: 'Raleway';
    text-decoration: none;
    font-weight: 500;
    margin: 0px 0 30px 0px;
    color: #000;
    padding: 11px 3px;}
.coupon_code p span{
  float: right;
  font-size: 16px;
  color: #008258;
}
.coupon_code p{font-size: 17px;}


.header_email_data
{
    width:100%;
  background-color:  #008459;
  margin: 10px;
  padding:5px
  
}

.header_email_data h1, .header_email_data h3
{
  text-align: center !important;
  color: #fff;
 
}

.table-responsive
{
    margin-bottom:40px;
    
}

.order_summary_container.email_template{
    text-align:center;
}
.coupon_code.internal
{
    width: 70%;
   float:right;
   margin-right:70px;
}
.coupon_code.internal p

{
    text-align: left;
}

.text_internal
{
    text-align:center;
}
.table_1
{
    margin-left:20px;
}
</style>


</head>

<body>
    <div class="container">
    
        <div class="header_email_data">
            <!-- <div><img src="" alt=""></div> -->
        <h1> Your Order has been placed Sucessfully </h1>
        <h3>  Order comformation from Ecommerce.d9ithub </h3>
        </div>
    <fieldset class="feature_product">
    <h2 class="fs-title"><img src="/ecommerce/img/title_icon1.png" alt="" title=""> Thank You
    <img src="/ecommerce/img/title_icon_mirror1.png" alt="" title=""></h2>
    <div>
        <div class="item_container">
            <h4></h4>
            <p> Lorem ipsum dolor sit amet, nostrud nominati vis ex, essent conceptam eam ad. Cu etiam comprehensam nec. Cibo delicata mei an, eum porro legere no. Te usu decore omnium, quem brute vis at, ius esse officiis legendos cu. Dicunt voluptatum at cum. Vel et facete equidem deterruisset, mei graeco cetero labores et. Accusamus inciderint eu mea.</p>
            <div class="content_ship_address">
                <div class="form_title">
                    <h4><img src="{{asset('/ecommerce/img/title_icon1.png')}}" alt="" title=""> Shipping Address <img src="{{asset('/ecommerce/img/title_icon_mirror1.png')}}" alt="" title=""></h4></div>
            </div>
            <div class="table-responsive table_1">
                <table  border="1" class="table table-striped confirm text-left">
                    <tbody class="text_internal">
                        <tr>
                            <td style="width: 30%;">Name</td>
                            <td>Kandarp Pandya</td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td>faredi</td>
                        </tr>
                        <tr>
                            <td>City</td>
                            <td>Ahmedabad</td>
                        </tr>
                        <tr>
                            <td>Phone Number</td>
                            <td>9427986091</td>
                        </tr>
                        <tr>
                            <td>Address Type</td>
                            <td>office</td>
                        </tr>
                        <tr>
                            <td>Landmark</td>
                            <td>Alabama</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table-responsive">
                <table border="1" class="table table-hover order_place">
                    <thead>
                        <tr>
                            <th style="width: 15%;">Product</th>
                            <th>Name</th>
                            <th style="width: 10%;">Quantity</th>
                            <th class="text-center" style="width: 10%;">Price</th>
                            <th class="text-center" style="width: 10%;">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 15%;">
                                <div class="media">
                                    <a class="thumbnail pull-left"><img src="{{asset('/uploads/Products/Naked_Dates_Organic_Medjool_Dates_Jumbo3-e1479234922744_1554118631.jpg')}}" class="media-object" alt="Naked_Dates_Organic_Medjool_Dates_Jumbo3-e1479234922744_1554118631" title="Naked_Dates_Organic_Medjool_Dates_Jumbo3-e1479234922744_1554118631"></a>
                                </div>
                            </td>
                            <td class="table_order">
                                <h4><a>little Hearts</a></h4></td>
                            <td class="Quanity" style="text-align: center; width: 10%;">
                                1
                            </td>
                            <td class=" text-center" style="width: 10%;"><strong>AED 24</strong></td>
                            <td class=" text-center" style="width: 10%;"><strong>AED 24</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="order_summary_container email_template">
                <div class="coupon_code">
                    <h2><img src="{{asset('/ecommerce/img/title_icon1.png')}}" alt="" title=""> Order summary <img src="{{asset('/ecommerce/img/title_icon_mirror1.png')}}" alt="" title=""></h2></div>
                <div class="coupon_code internal">
                    <p>Sub-Total
                        <span class="amount">AED 24 </span></p>
                    <p>Shipping Charge
                        <span>Free Shipping</span></p>
                    <p>Discount
                        <span class="amount"> AED 0</span></p>
                    <p>Payment Method
                        <span> COD</span></p>
                    <p>Total
                        <span class="amount">AED 24</span></p>
                </div>
            </div>
        </div>
    </div>
</fieldset>
    </div>
</body>
</html>
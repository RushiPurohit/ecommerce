<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Registration</title>
    <link rel="stylesheet" href="{{URL::asset('/ecommerce/css/bootstrap.min.css')}}">

    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{URL::asset('/ecommerce/css/font-awesome.min.css')}}">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
   
    <!-- Custom CSS -->
	<link href="{{ \App\Http\Controllers\HomeController::fileVersion('/ecommerce/style.css') }}" rel="stylesheet">
  <link href="{{ \App\Http\Controllers\HomeController::fileVersion('/ecommerce/rtl_style.css') }}" rel="stylesheet">
</head>
<body>
<div class="container">
<fieldset class="feature_product">
        <div class="item_container">
            <h4></h4>
            <div class="table-responsive">
            {!! $body !!}
                <!-- <table class="table table-striped confirm text-left">
                    <tbody>
                        <tr>
                            <td style="width: 30%;">Name</td>
                            <td>Kandarp Pandya</td>
                        </tr>
                        <tr>
                            <td> Email</td>
                            <td>abc@gmail.com</td>
                        </tr>
                        <tr>
                            <td>Phone Number</td>
                            <td>9427986091</td>
                        </tr>
                    </tbody>
                </table> -->
            </div>
        </div>
    </div>
</fieldset>
</div>
</body>
</html>
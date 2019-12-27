<!doctype html>
<html dir="ltr">
<head>
<meta charset="utf-8">
<title><?php echo app('translator')->getFromJson('language.appName'); ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
  <!-- start css -->
  <!-- <link href="<?php echo e(URL::asset('ecommerce/css/bootstrap.css')); ?>" rel="stylesheet"> -->
        
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,400i,500,600,700" rel="stylesheet">    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<?php echo e(URL::asset('/ecommerce/css/bootstrap.min.css')); ?>">

    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?php echo e(URL::asset('/ecommerce/css/font-awesome.min.css')); ?>">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
   
    <!-- Custom CSS -->
	<link href="<?php echo e(\App\Http\Controllers\HomeController::fileVersion('/ecommerce/style.css')); ?>" rel="stylesheet">
  <link href="<?php echo e(\App\Http\Controllers\HomeController::fileVersion('/ecommerce/rtl_style.css')); ?>" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo e(URL::asset('/ecommerce/css/responsive.css')); ?>">
    <link rel="icon" href="<?php echo e(URL::asset('favicon.png')); ?>" type="image/x-icon">
    <script src="https://www.2checkout.com/static/checkout/javascript/direct.min.js"></script>
	<!-- <link href="magazine/css/font_style.css" rel="stylesheet">
	<link href="magazine/css/responsive.css" rel="stylesheet"> -->
  <!-- end css -->
  
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->

  <!-- start js -->
	  <!-- <script src="<?php echo e(URL::asset('js/jquery.min.js')); ?>"></script> -->
	  <!-- <script src="<?php echo e(URL::asset('ecommerce/js/bootstrap.js')); ?>"></script> -->
</head>

<body>
	<div id="app">
		<router-view></router-view>
	</div>
	
	<script src="<?php echo e(\App\Http\Controllers\HomeController::fileVersion('/js/app.js')); ?>"></script>
	 <!-- Latest jQuery form server -->
	 <script src="<?php echo e(URL::asset('adminLTE/plugins/jquery/jquery.min.js')); ?>"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="<?php echo e(URL::asset('/ecommerce/js/jquery.sticky.js')); ?>"></script>
    
    <!-- jQuery easing -->
    <script src="<?php echo e(URL::asset('/ecommerce/js/jquery.easing.1.3.min.js')); ?>"></script>
    
    <!-- Main Script -->
    <script src="<?php echo e(URL::asset('/ecommerce/js/main.js')); ?>"></script>
    
    <!-- Slider -->
    <script type="text/javascript" src="<?php echo e(URL::asset('/ecommerce/js/bxslider.min.js')); ?>"></script>
	<script type="text/javascript" src="<?php echo e(URL::asset('/ecommerce/js/script.slider.js')); ?>"></script>
</body>
</html>

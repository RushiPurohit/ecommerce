@extends('layouts.app')

@section('content')
<script type="text/javascript">
    $( document ).ready(function() {
        $('input').attr('autocomplete','off');
    });
</script>
<?php

?>
<div class="container-fluid">            
    <div class="row clearfix">       
        {!! Form::open(['url' => 'total_transaction_report',  'id' => 'frm_totalAmount', 'name' => 'frm_totalAmount', 'method' => 'GET']) !!}      
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
            <div class="card" style="float: left;width: 100%"> 
                <div class="body">  
                    <div class="col-sm-2">
                        <div class="">
                            <div class="form-line">
                                {!! Form::select('category', $categories, !empty($category) ? $category : null, ['class' => 'form-control show-tick', 'placeholder' => __('language.selectCategory')]) !!}                                
                            </div>                            
                        </div>
                    </div>                       
                    <div class="col-sm-2">
                        <div class="">
                            <div class="form-line">
                                {!! Form::select('product', $products, !empty($product) ? $product : null, ['class' => 'form-control show-tick', 'placeholder' => __('language.selectProduct')]) !!}                            
                            </div>                        
                        </div>
                    </div>
                                
                    <div class="col-sm-2">
                        <div class="">
                            <div class="form-line">
                                {!! Form::text('start_date', !empty($start_date) ? $start_date : null ,['class'=>'form-control datepicker3', 'placeholder' => __('language.startDate'), 'data-provide'=> 'datepicker']) !!}
                            </div>                            
                        </div>
                    </div>
                    <div class="col-sm-2">    
                        <div class="">
                            <div class="form-line">
                                 {!! Form::text('end_date', !empty($end_date) ? $end_date : null ,['class'=>'form-control datepicker2', 'placeholder' => __('language.endDate'), 'data-provide'=> 'datepicker']) !!}
                            </div>                            
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="">
                            <div class="form-line">
                                {!! Form::select('user', $users, !empty($user) ? $user : null, ['class' => 'form-control show-tick', 'placeholder' => __('language.selectSaller')]) !!}
                                
                            </div>
                            
                        </div>
                    </div> 
                    <div class="col-sm-2">
                        <div class="">
                            <div class="form-line">
                                {!! Form::select('paymentMethod', [ 1 => __('language.cash'), 2 => __('language.card')], !empty($paymentMethod) ? $paymentMethod : null ,['class'=>'form-control', 'placeholder' => __('language.paymentMethod')]) !!}                                
                            </div>                            
                        </div>
                    </div> 
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                        
                        <a href="{{ url('total_transaction_report') }}"   onclick="" class="btn btn-primary pull-right btn_save">@lang('language.reset')</a>  
                        <button style="margin-right:10px; " type="submit" class="btn btn-primary pull-right btn_save ">@lang('language.search')</button> 
                    </div>
                </div>    
            </div> 
            
            
        </div>        
        
            
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                          
            <div class="card">
                <div class="body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                            <thead>
                                <tr>
                                    <th>@lang('language.id')</th>
                                    <th>@lang('language.categoryName')</th>
                                    <th>@lang('language.productName')</th>
                                    <th>@lang('language.quantity')</th>
                                    <th>@lang('language.paymentMethod')</th>                 
                                    <th>@lang('language.grandTotal')</th>    
                                </tr>
                            </thead>
                            <tbody>
                                <?php $getTotal = 0; ?>
                                @foreach ($totalAmount as $key => $totalAmountReport)
                                    <tr>
                                        <td>{{ $key + 1 }} </td>
                                        <td>{{ $totalAmountReport->category_name }}</td>
                                        <td>{{ $totalAmountReport->product_name }}</td>
                                        <td>{{ $totalAmountReport->total_product }}</td>
                                        <td><?php if($totalAmountReport->payment_method == 1){ ?>Cash<?php }else { ?>Card<?php } ?></td>
                                        <td>{{ $totalAmountReport->grand_total }}</td>
                                    </tr>
                                    <?php $getTotal = $getTotal + $totalAmountReport->grand_total;?>
                                @endforeach   
                                <tr>                                    
                                    <td style="color: #fff;user-select: none;">asas</td>
                                    <td style="color: #fff;user-select: none;">asas</td>
                                    <td style="color: #fff;user-select: none;">asas</td>
                                    <td style="color: #fff;user-select: none;">asas</td>
                                    <th>@lang('language.total')</th>
                                    <td>{{ $getTotal }}</td>
                                </tr>                            
                            </tbody>
                        </table>
                    </div>
                </div>     
            </div>            
        </div>     
    </div>    
</div> 
<script>

    $(function () {
        $('.datepicker2').datepicker({
            dateFormat: 'yy-mm-dd'
        });
        $('.datepicker3').datepicker({
            dateFormat: 'yy-mm-dd'
        });
    });
</script>

@endsection

@extends('layouts.app')

@section('content')
<div class="container-fluid">
            <!-- <div class="block-header">
                <h2>@lang('language.tax')</h2>
            </div> -->
            @include('Admin.errors.errorMessage')
            <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                
                <div class="header">
                    <h2>@lang('language.banner') <a data-target="#defaultModal" data-toggle="modal" class="pull-right btn btn-primary" onclick="hideCategoryList()">@lang('language.addValue') @lang('language.banner')</a>
                    </h2>
                </div>
                <div class="body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                            <thead>
                                <tr>
                                    <th>@lang('language.no')</th>
                                    <th>@lang('language.banner')</th>
                                    <th>@lang('language.bannerArabic')</th>
                                    <th>@lang('language.status')</th>
                                    <th>@lang('language.action')</th>
                                </tr>
                            </thead>
                            <tbody>
                            @if(isset($banners) and (count($banners) > 0))
                                @php 
                                    $i =1;
                                @endphp
                                @foreach($banners as $key => $bann)
                                    <tr>
                                        <!-- <td>{{ $key+1 }} </td> -->
                                        <td>{{ $i }} </td>
                                        <td><img src="{{$bann->banner_image}}" style="heigth: 100px; width: 200px;" /></td>
                                        <td><img src="{{$bann->banner_image_arabic}}" style="heigth: 100px; width: 200px;" /></td>
                                        <td><div class="switch">
                                        <label><input type="checkbox" onclick="customChangeStatus(this.value, <?php echo $bann->id; ?>, 'banners' )" value="{{$bann->status}}" <?php if ($bann->status == '1') {echo 'checked';}?> ><span class="lever" ></span></label>
                                </div></td>
                                        <td width="15%" style="text-align: center;">
                                           <a data-target="#editModal_{{ $bann->id }}" data-toggle="modal"
                                            class="tool_tip" onclick="showCategoryList()"><i data-original-title="{{ __('language.edit')}}" data-toggle="tooltip" data-placement="top" class="material-icons">edit</i></a>

                                            @if($bann->id)
                                            <?php $route = URL::to('banners/'.$bann->id);
                                                        $token = csrf_token();
                                                    ?>
                                                    <a href="#"  class="tool_tip"><i class="material-icons" onclick="deleteValue('<?php echo $route; ?>', this)"><i class="material-icons iconDelete"  data-toggle="tooltip" data-placement="top" data-original-title="{{ __('language.delete')}}">delete_forever</i></i></a>
                                            @endif
                                        </td>
                                    </tr>
                                @php 
                                    $i++;
                                @endphp    
                                @endforeach
                            @else
                                <!-- <tr><td colspan="3" align="center">record not found</td></tr> -->
                            @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        //Here Form validation [Start]
        $(document).ready(function()
        {
            $('#frm_banner').formValidation({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                        <?php //if($banners == null) { ?>	
                        'banner_image': 
                        {
                            message: '<?php echo __('language.bannerImage_required'); ?>',
                            validators: 
                                {
                                    notEmpty:{message: '<?php echo __('language.bannerImage_required'); ?>'},
                                }
                        },
                        'banner_image_arabic':
                        {
                            message: '<?php echo __('language.bannerImage_arabic_required'); ?>',
                            validators: 
                                {
                                    notEmpty:{message: '<?php echo __('language.bannerImage_arabic_required'); ?>'},
                                }
                        },
                        'banner_option':
                        {
                            message: '<?php echo __('language.banner_option_required'); ?>',
                            validators: 
                                {
                                    notEmpty:{message: '<?php echo __('language.banner_option_required'); ?>'},
                                }
                        },
                    <?php //} ?> 
                            
                            
                            
                }
            });
        });
        //Here Form validation [End]
        </script>
    <!-- #END# Basic Examples -->
    <div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            {!! Form::open(['route' => 'banners.store', 'files'=> true, 'id' => 'frm_banner', 'name' =>'frm_banner']) !!}
                <div class="modal-header bottom_line">
                    <h4 class="modal-title" id="defaultModalLabel">@lang('language.banner')</h4>
                </div>
                <div class="modal-body table_data">
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        
                            <div class="">
                                <div class="">
                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <div class="form-group{{ $errors->has('banner_image') ? ' has-error' : '' }}">
                                                <div class="">
                                                    <label>@lang('language.bannerImage')</label>
                                                    <input type="file" required name='banner_image' id="banner_image" accept=".gif, .jpg, .png">
                                                    <div class="gallery" id="gallery"></div>
                                                </div>
                                                <small class="text-danger">{{ $errors->first('banner_image') }}</small>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group{{ $errors->has('banner_image_arabic') ? ' has-error' : '' }}">
                                                <div class="">
                                                    <label>@lang('language.bannerImageArabic')</label>
                                                    <input type="file" required name='banner_image_arabic' id="banner_image_arabic" accept=".gif, .jpg, .png">
                                                    <div class="gallery2" id="gallery2"></div>
                                                </div>
                                                <small class="text-danger">{{ $errors->first('banner_image_arabic') }}</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <div class="form-group{{ $errors->has('banner_option') ? ' has-error' : '' }}">
                                                <div class="form-line">
                                                    {!! Form::select('banner_option', [ 'category' => __('language.category')], null ,['class'=>'form-control', 'placeholder' => __('language.bannerOption'), 'id' => 'banner_option']) !!}
                                                    <!-- {!! Form::select('banner_option', [ 'category' => __('language.category'), 'product' => __('language.product')], null ,['class'=>'form-control', 'placeholder' => __('language.bannerOption'), 'id' => 'banner_option']) !!} -->
                                                </div>
                                                <small class="text-danger">{{ $errors->first('banner_option') }}</small>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group{{ $errors->has('options') ? ' has-error' : '' }}">
                                                <div class="form-line">
                                                    {!! Form::select('options', $products, null,['class'=>'form-control products', 'placeholder' => __('language.products'), 'id' => 'products']) !!}

                                                    {!! Form::select('options2', $category, null,['class'=>'form-control category', 'placeholder' => __('language.category'), 'id' => 'category']) !!}
                                                </div>
                                                <small class="text-danger">{{ $errors->first('options') }}</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                       
                    </div>
                </div>
                </div>
                <div class="modal-footer table_btn">
                <button type="submit" class="btn btn-link waves-effect btn_save">@lang('language.upload')</button>
                    <button type="button" class="btn btn-link waves-effect" data-dismiss="modal" id="modal_close">@lang('language.close')</button>
                </div>
                {!! Form::close() !!}
            </div>
        </div>
    </div>
    @foreach($banners as $key => $bann)
    <div class="modal fade" id="editModal_{{ $bann->id }}" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content"> 
            {!! Form::model($bann, ['route' => ['banners.update', $bann->id], 'method' => 'put', 'name' => 'frm_banner', 'id' => 'frm_banner','enctype' => 'multipart/form-data']) !!}
            <input type="hidden" name="id" value="{{ $bann->id }}">
            <input type="hidden" name="old_banner_img" value="{{ $bann->banner_image }}">
            <input type="hidden" name="old_banner_arabic_img" value="{{ $bann->banner_image_arabic }}">
                <div class="modal-header bottom_line">
                    <h4 class="modal-title" id="defaultModalLabel">@lang('language.banner')</h4>
                </div>
                <div class="modal-body table_data">
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                        
                            <div class="">
                                <div class="">
                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <div class="form-group{{ $errors->has('banner_image') ? ' has-error' : '' }}">
                                                <div class="">
                                                    <label>@lang('language.bannerImage')</label>
                                                    <input type="file" name='banner_image' id="banner_image" accept=".gif, .jpg, .png">
                                                    <div class="gallery" id="gallery"></div>
                                                    <img src="{{$bann->banner_image}}" style="heigth: 100px; width: 200px;" /></td>
                                                </div>
                                                <small class="text-danger">{{ $errors->first('banner_image') }}</small>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group{{ $errors->has('banner_image_arabic') ? ' has-error' : '' }}">
                                                <div class="">
                                                    <label>@lang('language.bannerImageArabic')</label>
                                                    <input type="file" name='banner_image_arabic' id="banner_image_arabic" accept=".gif, .jpg, .png">
                                                    <div class="gallery2" id="gallery2"></div>
                                                    <img src="{{$bann->banner_image_arabic}}" style="heigth: 100px; width: 200px;" /></td>
                                                </div>
                                                <small class="text-danger">{{ $errors->first('banner_image_arabic') }}</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <div class="form-group{{ $errors->has('banner_option') ? ' has-error' : '' }}">
                                                <div class="form-line">
                                                    {!! Form::select('banner_option', [ 'category' => __('language.category')], !empty($bann->banner_option) ? $bann->banner_option : null ,['class'=>'form-control', 'placeholder' => __('language.bannerOption'), 'id' => 'banner_option']) !!}
                                                </div>
                                                <small class="text-danger">{{ $errors->first('banner_option') }}</small>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group{{ $errors->has('options') ? ' has-error' : '' }}">
                                                <div class="form-line">
                                                    <!-- {!! Form::select('options', $products, null,['class'=>'form-control products', 'placeholder' => __('language.products'), 'id' => 'products']) !!} -->

                                                    {!! Form::select('options2', $category, !empty($bann->options) ? $bann->options : null,['class'=>'form-control category', 'placeholder' => __('language.category'), 'id' => 'category']) !!}
                                                </div>
                                                <small class="text-danger">{{ $errors->first('options') }}</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                       
                    </div>
                </div>
                </div>
                <div class="modal-footer table_btn">
                <button type="submit" class="btn btn-link waves-effect btn_save">@lang('language.upload')</button>
                    <button type="button" class="btn btn-link waves-effect" data-dismiss="modal" id="modal_close">@lang('language.close')</button>
                </div>
                {!! Form::close() !!}
            </div>
        </div>
    </div>
    @endforeach
</div>

<script>
function showCategoryList () {
        $('.category').show();
    }
    function hideCategoryList () {
        $('.category').hide();
    } 
    $( document ).ready(function() {
        $('.products').hide();
        $('.category').hide();
        
        $('#banner_option').on( "change", function(e) {
            console.log(e.target.value)
            if (e.target.value == 'category') {
                $('.products').hide();
                $('.category').show();
            } else if (e.target.value == 'product') {
                $('.products').show();
                $('.category').hide();
            } else {
                $('.products').hide();
                $('.category').hide();
            }
        });
    });
    $(function() {
    // Multiple images preview in browser
    var imagesPreview = function(input, placeToInsertImagePreview) {
        if (input.files) {
            var filesAmount = input.files.length;

            for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();

                reader.onload = function(event) {
                    $($.parseHTML('<img style="width: 20%;">')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
                }

                reader.readAsDataURL(input.files[i]);
            }
        }
    };

    $('#banner_image').on('change', function() {
        imagesPreview(this, 'div.gallery');
    });
    $('#banner_image_arabic').on('change', function() {
        imagesPreview(this, 'div.gallery2');
    });
    
});
</script>
@endsection

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
                    <h2>@lang('language.slider') <a data-target="#defaultModal" data-toggle="modal" class="pull-right btn btn-primary" onclick="hideCategoryList()">@lang('language.addValue') @lang('language.slider')</a>
                    </h2>
                </div> 
                <div class="body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                            <thead>
                                <tr>
                                    <th>@lang('language.no')</th>
                                    <th>@lang('language.slider')</th>
                                    <th>@lang('language.sliderArabic')</th>
                                    <th>@lang('language.status')</th>
                                    <th>@lang('language.action')</th>
                                </tr>
                            </thead>
                            <tbody>
                            @if(isset($slider) and (count($slider) > 0))
                                @php 
                                    $i =1;
                                @endphp
                                @foreach($slider as $key => $slide)
                                    <tr>
                                        <!-- <td>{{ $key+1 }} </td> -->
                                        <td>{{ $i }} </td>
                                        <td><img src="{{$slide->slider_image}}" style="heigth: 100px; width: 200px;" /></td>
                                        <td><img src="{{$slide->slider_image_arabic}}" style="heigth: 100px; width: 200px;" /></td>
                                        <td><div class="switch">
                                        <label><input type="checkbox" onclick="customChangeStatus(this.value, <?php echo $slide->id; ?>, 'sliders' )" value="{{$slide->status}}" <?php if ($slide->status == '1') {echo 'checked';}?> ><span class="lever" ></span></label>
                                </div></td>
                                        <td width="15%" style="text-align: center;">
                                            <a data-target="#editModal_{{ $slide->id }}" data-toggle="modal"
                                            class="tool_tip" onclick="showCategoryList('<?php echo $slide->slider_option; ?>')"><i data-original-title="{{ __('language.edit')}}" data-toggle="tooltip" data-placement="top" class="material-icons">edit</i></a>
                                            @if($slide->id)
                                            <?php $route = URL::to('slider/'.$slide->id);
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
            $('#frm_slider').formValidation({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {	
                        'slider_image': 
                        {
                            message: '<?php echo __('language.sliderImage_required'); ?>',
                            validators: 
                                {
                                    notEmpty:{message: '<?php echo __('language.sliderImage_required'); ?>'},
                                }
                        },
                        'slider_image_arabic':
                        {
                            message: '<?php echo __('language.sliderImage_arabic_required'); ?>',
                            validators: 
                                {
                                    notEmpty:{message: '<?php echo __('language.sliderImage_arabic_required'); ?>'},
                                }
                        },
                        'slider_option':
                        {
                            message: '<?php echo __('language.slider_option_required'); ?>',
                            validators: 
                                {
                                    notEmpty:{message: '<?php echo __('language.slider_option_required'); ?>'},
                                }
                        },
                        
                            
                            
                            
                }
            });
        });
        //Here Form validation [End]
        </script>
    <!-- #END# Basic Examples -->
    <div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            {!! Form::open(['route' => 'slider.store', 'files'=> true, 'id' => 'frm_slider', 'name' =>'frm_slider']) !!}
                <div class="modal-header bottom_line">
                    <h4 class="modal-title" id="defaultModalLabel">@lang('language.slider')</h4>
                </div>
                <div class="modal-body table_data">
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        
                            <div class="">
                                <div class="">
                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <div class="form-group{{ $errors->has('slider_image') ? ' has-error' : '' }}">
                                                <div class="">
                                                    <label>@lang('language.sliderImage')</label>
                                                    <input type="file" required name='slider_image' id="slider_image" accept=".gif, .jpg, .png">
                                                    <div class="gallery" id="gallery"></div>
                                                </div>
                                                <small class="text-danger">{{ $errors->first('slider_image') }}</small>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group{{ $errors->has('slider_image_arabic') ? ' has-error' : '' }}">
                                                <div class="">
                                                    <label>@lang('language.sliderImageArabic')</label>
                                                    <input type="file" required name='slider_image_arabic' id="slider_image_arabic" accept=".gif, .jpg, .png">
                                                    <div class="gallery2" id="gallery2"></div>
                                                </div>
                                                <small class="text-danger">{{ $errors->first('slider_image_arabic') }}</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-sm-6">
                                            <div class="form-group{{ $errors->has('slider_option') ? ' has-error' : '' }}">
                                                <div class="form-line">
                                                    {!! Form::select('slider_option', [ 'category' => __('language.category'), 'product' => __('language.product')], null ,['class'=>'form-control', 'placeholder' => __('language.sliderOption'), 'id' => 'slider_option']) !!}
                                                </div>
                                                <small class="text-danger">{{ $errors->first('slider_option') }}</small>
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
    @foreach($slider as $key => $slide)
        <div class="modal fade" id="editModal_{{ $slide->id }}" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                {!! Form::model($slide, ['route' => ['slider.update', $slide->id], 'method' => 'put', 'name' => 'frm_banner', 'id' => 'frm_banner','enctype' => 'multipart/form-data']) !!}
                <input type="hidden" name="id" value="{{ $slide->id }}">
                <input type="hidden" name="old_slider_img" value="{{ $slide->slider_image }}">
                <input type="hidden" name="old_slider_arabic_img" value="{{ $slide->slider_image_arabic }}">
                    <div class="modal-header bottom_line">
                        <h4 class="modal-title" id="defaultModalLabel">@lang('language.slider')</h4>
                    </div>
                    <div class="modal-body table_data">
                    <div class="row clearfix">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            
                                <div class="">
                                    <div class="">
                                        <div class="row clearfix">
                                            <div class="col-sm-6">
                                                <div class="form-group{{ $errors->has('slider_image') ? ' has-error' : '' }}">
                                                    <div class="">
                                                        <label>@lang('language.sliderImage')</label>
                                                        <input type="file" name='slider_image' id="slider_image" accept=".gif, .jpg, .png">
                                                        <div class="gallery" id="gallery"></div>
                                                    </div>
                                                    <img src="{{$slide->slider_image}}" style="heigth: 100px; width: 200px;" /></td>
                                                    <small class="text-danger">{{ $errors->first('slider_image') }}</small>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group{{ $errors->has('slider_image_arabic') ? ' has-error' : '' }}">
                                                    <div class="">
                                                        <label>@lang('language.sliderImageArabic')</label>
                                                        <input type="file" name='slider_image_arabic' id="slider_image_arabic" accept=".gif, .jpg, .png">
                                                        <div class="gallery2" id="gallery2"></div>
                                                    </div>
                                                    <img src="{{$slide->slider_image_arabic}}" style="heigth: 100px; width: 200px;" /></td>
                                                    <small class="text-danger">{{ $errors->first('slider_image_arabic') }}</small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row clearfix">
                                            <div class="col-sm-6">
                                                <div class="form-group{{ $errors->has('slider_option') ? ' has-error' : '' }}">
                                                    <div class="form-line">
                                                        {!! Form::select('slider_option', [ 'category' => __('language.category'), 'product' => __('language.product')], !empty($slide->slider_option) ? $slide->slider_option : null ,['class'=>'form-control', 'placeholder' => __('language.sliderOption'), 'id' => 'slider_option']) !!}
                                                    </div>
                                                    <small class="text-danger">{{ $errors->first('slider_option') }}</small>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group{{ $errors->has('options') ? ' has-error' : '' }}">
                                                    <div class="form-line">
                                                        {!! Form::select('options', $products, !empty($slide->options) ? $slide->options : null,['class'=>'form-control products', 'placeholder' => __('language.products'), 'id' => 'products']) !!}

                                                        {!! Form::select('options2', $category, !empty($slide->options) ? $slide->options : null,['class'=>'form-control category', 'placeholder' => __('language.category'), 'id' => 'category']) !!}
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
    function showCategoryList (type) {
        $('.products').hide();
        $('.category').hide();
        if (type == 'category')
            $('.category').show();
        else
            $('.products').show();
    }
    function hideCategoryList () {
        $('.products').hide();
        $('.category').hide();
    } 
    $( document ).ready(function() {
        $('.products').hide();
        $('.category').hide();
        
        $('#slider_option').on( "change", function(e) {
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

        $('#slider_image').on('change', function() {
            imagesPreview(this, 'div.gallery');
        });
        $('#slider_image_arabic').on('change', function() {
            imagesPreview(this, 'div.gallery2');
        });
        
    });
</script>
@endsection

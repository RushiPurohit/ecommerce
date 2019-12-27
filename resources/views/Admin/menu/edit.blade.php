@extends('layouts.app')

@section('content')
<script>
//Here Form validation [Start]
$(document).ready(function()
{
    $('#frm_menu').formValidation({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
		fields: {	
            role_name: 
            {
                message: '<?php echo __('language.roleName_required'); ?>',
                validators: 
                    {
                        notEmpty:{message: '<?php echo __('language.roleName_required'); ?>'},
                    }
            },
            role_name_arabic: 
            {
                message: '<?php echo __('language.roleName_arabic_required'); ?>',
                validators: 
                    {
                        notEmpty:{message: '<?php echo __('language.roleName_arabic_required'); ?>'},
                    }
            },
					
					
					
		}
    });
});
//Here Form validation [End]
</script>

<div class="container-fluid">
            <!-- <div class="block-header">
                <h2>@lang('language.roles')</h2>
            </div> -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>@lang('language.edit') @lang('language.menu') </h2>
                </div>
                <div class="body">
                @include('Admin.errors.errorMessage')
                    {!! Form::model($menus, array('route' => array('menus.update', $menus->id), 'method' => 'PUT', 'name' => 'frm_menu', 'id' => 'frm_menu')) !!}
                    <div class="row clearfix">
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('menu') ? ' has-error' : '' }}">
                                <div class="form-line">
                                {!! Form::text('menu', null ,['class'=>'form-control', 'placeholder' => __('language.menuName')]) !!}
                                </div>
                                <small class="text-danger">{{ $errors->first('menu') }}</small>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('menu_ar') ? ' has-error' : '' }}">
                                <div class="form-line">
                                {!! Form::text('menu_ar', null ,['class'=>'form-control', 'placeholder' => __('language.menuNameArabic')]) !!}
                                </div>
                                <small class="text-danger">{{ $errors->first('menu_ar') }}</small>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('routes') ? ' has-error' : '' }}">
                                <div class="form-line">
                                {!! Form::text('routes', null ,['class'=>'form-control', 'placeholder' => __('language.routes')]) !!}
                                </div>
                                <small class="text-danger">{{ $errors->first('routes') }}</small>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('icon') ? ' has-error' : '' }}">
                                <div class="form-line">
                                {!! Form::text('icon', null ,['class'=>'form-control', 'placeholder' => __('language.icon')]) !!}
                                </div>
                                <small class="text-danger">{{ $errors->first('icon') }}</small>
                            </div>
                        </div>
                    </div>
                        <div class="row clearfix">
                            <div class="col-sm-6">
                                <div class="form-group{{ $errors->has('routes') ? ' has-error' : '' }}">
                                    <div class="form-line">
                                     {!! Form::text('parent_id', null ,['class'=>'form-control', 'placeholder' => 'parent_id']) !!}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix">
                            <div class="col-sm-12">
                            <button type="submit" class="btn btn-primary pull-right btn_save ">@lang('language.update')</button>
                            <!-- <button type="reset" class="btn blue_btn">@lang('language.reset')</button> -->
                            </div>
                        </div>
                    {!! Form::close() !!}
                    </div>
            </div>
        </div>
    </div>
</div>
@endsection

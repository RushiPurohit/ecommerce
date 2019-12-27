@extends('layouts.app')
@section('content')
<script>
//Here Form validation [Start]
$(document).ready(function()
{
    $('#frm_user').formValidation({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
		fields: {	
                first_name: 
                {
                    message: '<?php echo __('language.firstName_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.firstName_required'); ?>'},
                        }
                },
                first_name_arabic: 
                {
                    message: '<?php echo __('language.firstName_arabic_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.firstName_arabic_required'); ?>'},
                        }
                },
                last_name: 
                {
                    message: '<?php echo __('language.lasrName_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.lasrName_required'); ?>'},
                        }
                },
                last_name_arabic: 
                {
                    message: '<?php echo __('language.lasrName_arabic_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.lasrName_arabic_required'); ?>'},
                        }
                },
                email: 
                {
                    message: '<?php echo __('language.email_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.email_required'); ?>'},
                            emailAddress: {message: '<?php echo __('language.email_valid_required'); ?>'},
                        }
                },
                password: 
                {
                    message: '<?php echo __('language.password_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.password_required'); ?>'},
                           
                        }
                },
                password_confirmation: 
                {
                    message: '<?php echo __('language.confirm_password_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.confirm_password_required'); ?>'},
                           
                        }
                },
                mobile_number: 
                {
                    message: '<?php echo __('language.mobile_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.mobile_required'); ?>'},
                           
                        }
                },
					
					
					
		}
    });
});
//Here Form validation [End]
</script>
<div class="container-fluid">
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>@lang('language.add') @lang('language.user')
                        <a href="/users" class="btn btn-primary btn_save pull-right">@lang('language.back')</a> 
                    </h2>
                </div>
                <div class="body">
                    @include('Admin.errors.errorMessage')
                    {!! Form::open(['route' => 'users.store','name' => 'frm_user','id' => 'frm_user']) !!}
                    <div class="row clearfix">
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('first_name') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::text('first_name' , null ,['class' => 'form-control', 'placeholder' =>
                                    __('language.firstName'),'id' => 'first_name']) !!}
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('first_name_arabic') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::text('first_name_arabic' , null ,['class' => 'form-control', 'placeholder' =>
                                    __('language.firstName') . '  ' .  __('language.InArabic'),'required' => 'required']) !!}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('last_name') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::text('last_name' , null ,['class' => 'form-control', 'placeholder' =>
                                    __('language.lastName'),'required' => 'required']) !!}
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('last_name_arabic') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::text('last_name_arabic' , null ,['class' => 'form-control', 'placeholder' =>
                                    __('language.lastName') . '  ' .  __('language.InArabic'),'required' => 'required']) !!}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('email') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::email('email' , null ,['class' => 'form-control', 'placeholder' =>
                                    __('language.email'),'required' => 'required']) !!}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('password') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::input('password','password' , null ,['class' => 'form-control', 'placeholder' =>
                                    __('language.password'),'required' => 'required']) !!}
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('password_confirmation') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::input('password', 'password_confirmation' , null ,['class' => 'form-control', 'placeholder' =>
                                    __('language.RePassword'),'required' => 'required']) !!}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-3">
                            <div class="form-group{{ $errors->has('country_code') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::select('country_code',$country_code,966, ['class' => 'form-control','required' => 'required']); !!}
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('mobile_number') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::number('mobile_number' , null ,['class' => 'form-control', 'placeholder' =>
                                    __('language.userMobile'),'required' => 'required']) !!}
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group{{ $errors->has('role_id') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::select('role_id', $roles, 2); !!}
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <input type="hidden" name="status" value="1">
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <button type="submit" class="btn btn-primary btn_save pull-right">@lang('language.save')</button>
                            <button type="reset"
                                class="btn blue_btn  spacebetween btn_edit pull-right">@lang('language.reset')</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
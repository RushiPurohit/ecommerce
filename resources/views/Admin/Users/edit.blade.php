@extends('layouts.app')
@section('content')
<script>
/*Here open popup of view all Faq detail*/
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
                    message: 'Please enter first name.',
                    validators: 
                        {
                            notEmpty:{message: 'Please enter first name.'},
                        }
                },
                first_name_arabic: 
                {
                    message: 'Please enter first name arabic.',
                    validators: 
                        {
                            notEmpty:{message: 'Please enter first name arabic.'},
                        }
                },
                last_name: 
                {
                    message: 'Please enter last name.',
                    validators: 
                        {
                            notEmpty:{message: 'Please enter last name.'},
                        }
                },
                last_name_arabic: 
                {
                    message: 'Please enter last name arabic.',
                    validators: 
                        {
                            notEmpty:{message: 'Please enter last name arabic.'},
                        }
                },
                email: 
                {
                    message: 'Please enter email.',
                    validators: 
                        {
                            notEmpty:{message: 'Please enter email.'},
                            emailAddress: {message: 'Please enter valid email.'},
                        }
                },
                password: 
                {
                    message: 'Please enter password.',
                    validators: 
                        {
                            notEmpty:{message: 'Please enter password.'},
                           
                        }
                },
                password_confirmation: 
                {
                    message: 'Please enter confirm password.',
                    validators: 
                        {
                            notEmpty:{message: 'Please enter confirm password.'},
                           
                        }
                },
                mobile_number: 
                {
                    message: 'Please enter mobile number.',
                    validators: 
                        {
                            notEmpty:{message: 'Please enter mobile number.'},
                           
                        }
                },
					
					
					
		}
    });
});
</script>
<div class="container-fluid">
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>@lang('language.edit') @lang('language.user')
                        <a href="/users" class="btn btn-primary btn_save pull-right">@lang('language.back')</a>
                    </h2>
                </div>
                <div class="body">
                    @include('Admin.errors.errorMessage')
                    {!! Form::model($users , ['route' => ['users.update', $users->id,],'name' => 'frm_user','id' => 'frm_user', 'method' => 'put']) !!}
                    <div class="row clearfix">
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('first_name') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::text('first_name' , null ,['class' => 'form-control', 'placeholder' =>
                                    __('language.firstName'),'required' => 'required']) !!}
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
                                    __('language.email'), 'readonly' => 'true']) !!}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('password') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::input('password','password' , null ,['class' => 'form-control', 'placeholder' =>
                                    __('language.password')]) !!}
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('password_confirmation') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::input('password', 'password_confirmation' , null ,['class' => 'form-control', 'placeholder' =>
                                    __('language.RePassword')]) !!}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-3">
                            <div class="form-group{{ $errors->has('country_code') ? 'has-error' : '' }}">
                                <div class="form-line">
                                {!! Form::select('country_code', $country_code,null, ['class' => 'form-control']); !!}
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
                                    {!! Form::select('role_id',$roles); !!}
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="status" value="1">
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <button type="submit" class="btn btn-primary btn_save pull-right">@lang('language.save')</button>
                            <button type="reset"
                                class="btn blue_btn btn_edit spacebetween pull-right">@lang('language.reset')</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
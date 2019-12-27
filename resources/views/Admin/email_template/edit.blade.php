@extends('layouts.app')
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
@section('content')
<script>
//Here Form validation [Start]
$(document).ready(function()
{
    $('#frm_emailTemplate').formValidation({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
		fields: {	
                name: 
                {
                    message: '<?php echo __('language.templateName_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.templateName_required'); ?>'},
                        }
                },
                email_subject: 
                {
                    message: '<?php echo __('language.emailSubject_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.emailSubject_required'); ?>'},
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
                {!! Form::model($emailtemplates, ['route' => ['email_template.update', $emailtemplates->id], 'files'=> true, 'method' => 'put','name' => 'frm_emailTemplate', 'id' => 'frm_emailTemplate']) !!}
            <div class="card">
                <div class="header">
                    <h2>@lang('language.add') @lang('language.emailtemplate')
                        <a href="/email_template" class="btn btn-primary btn_save pull-right">@lang('language.back')</a> 
                    </h2>
                </div>
                <div class="body">
                    @include('Admin.errors.errorMessage')
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <div class="form-group{{ $errors->has('name') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::text('name' , null ,['class' => 'form-control', 'placeholder' =>
                                    __('language.templateName'),'required' => 'required']) !!}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-12 table-responsive">
                            <table class="table table-bordered">
                            <tr>
                                    <th colspan="4" style="text-align:center;">@lang('language.listOfVariable')</th>
                                </tr>
                                <tr>
                                    <th>@lang('language.name')</th>
                                    <th>@lang('language.variable')</th>
                                    <th>@lang('language.name')</th>
                                    <th>@lang('language.variable')</th>
                                </tr>
                                <tr>
                                    <td>@lang('language.firstName')</td>
                                    <td>{var_first_name}</td>
                                    <td>@lang('language.lastName')</td>
                                    <td>{var_last_name}</td>
                                </tr>
                                <tr>
                                    <td>@lang('language.email')</td>
                                    <td>{var_email}</td>
                                    <td>@lang('language.userMobile')</td>
                                    <td>{var_mobile_number}</td>
                                </tr>
                                <tr>
                                    <td>@lang('language.address')</td>
                                    <td>{var_address}</td>
                                    <td>@lang('language.rewardCode')</td>
                                    <td>{var_reward_code}</td>
                                </tr>
                                <tr>
                                    <td>@lang('language.rewardPointBalance')</td>
                                    <td>{var_point_balance}</td>
                                    <td>@lang('language.link')</td>
                                    <td>{var_link}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <div class="form-group{{ $errors->has('email_subject') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::text('email_subject' , null ,['class' => 'form-control', 'placeholder'
                                    => __('language.emailSubject'),'required' => 'required']) !!}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <div class="form-group{{ $errors->has('email_body') ? 'has-error' : '' }}">
                                <div class="form-line">
                                    {!! Form::textarea('email_body' , null ,['class' => 'form-control', 'placeholder'
                                    => __('language.emailBody'),'id' => 'article-ckeditor']) !!}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <button type="submit" class="btn btn-primary pull-right btn_save">@lang('language.save')</button>
                            <button type="reset"
                                class="btn blue_btn pull-right spacebetween btn_edit">@lang('language.reset')</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
CKEDITOR.replace('article-ckeditor');
</script>
@endsection
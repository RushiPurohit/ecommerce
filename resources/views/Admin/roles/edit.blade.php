@extends('layouts.app')

@section('content')
<script>
//Here Form validation [Start]
$(document).ready(function()
{
    $('#frm_role').formValidation({
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
                    <h2>@lang('language.edit') @lang('language.user') @lang('language.role')
                        <a href="/roles" class="btn btn-primary btn_save pull-right">@lang('language.back')</a> 
                    </h2>
                </div>
                <div class="body">
                @include('Admin.errors.errorMessage')
                    {!! Form::model($rolesDetails, array('route' => array('roles.update', $rolesDetails->id), 'method' => 'PUT', 'name' => 'frm_role', 'id' => 'frm_role')) !!}
                    <div class="row clearfix">
                        <div class="col-sm-6">
                            <div class="form-group{{ $errors->has('role_name') ? ' has-error' : '' }}">
                                <div class="form-line">
                                {!! Form::text('role_name', null ,['class'=>'form-control', 'placeholder' => 'Role Name']) !!}
                                </div>
                                <small class="text-danger">{{ $errors->first('role_name') }}</small>
                            </div>
                        </div>
                            <div class="col-sm-6">
                                <div class="form-group{{ $errors->has('role_name_arabic') ? ' has-error' : '' }}">
                                    <div class="form-line">
                                    {!! Form::text('role_name_arabic', null ,['class'=>'form-control', 'placeholder' => __('language.roleNameArabic')]) !!}
                                    </div>
                                    <small class="text-danger">{{ $errors->first('role_name_arabic') }}</small>
                                </div>
                            </div>
                            @foreach($menus as $key=>$value)
                        <div>
                            <div class="col-sm-12">
                            <?php
                            $id = 'basic_checkbox_ '.($key+1) ;
                                // dd($value->id);
                                ?>
                                <!-- <input type="checkbox" value="permissions[]" id="{{ $id }}"> -->
                            {{  Form::checkbox('permissions[]',$value->id, $permission, array('id' =>$id)) }}  
                            @if($value->parent_id == null)
                            <label for="{{ $id }}"><strong>
                                @if(Session::get('locale') == 'en')
                                    {{ $value->menu }}
                                @else
                                    {{ $value->menu_ar }}
                                @endif
                            </strong></label>
                            @else
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="{{ $id }}">
                                @if(Session::get('locale') == 'en')
                                    {{ $value->menu }}
                                @else
                                    {{ $value->menu_ar }}
                                @endif
                            </label>
                            @endif
                            </div>
                        </div>
                        @endforeach
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
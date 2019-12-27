@extends('layouts.app')

@section('content')
<div class="container-fluid">
            <!-- <div class="block-header">
                <h2>@lang('language.roles')</h2>
            </div> -->
 <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            @include('Admin.errors.errorMessage')
            <div class="card">
                <div class="header">
                    <h2>@lang('language.menu')<a href="{{URL::to('menus/create')}}" class="pull-right btn btn-primary">@lang('language.addValue') @lang('language.menu')</a>
                    </h2>
                </div>
                <div class="body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                            <thead>
                                <tr>
                                    <th>@lang('language.id')</th>
                                    <th>@lang('language.roleName')</th>
                                    <th>@lang('language.action')</th>
                                </tr>
                            </thead>
                            <tbody>
                            @if(isset($menus) and (count($menus) > 0))
                               
                                @foreach($menus as $key => $menu)
                                    <tr>
                                        <td>{{ $key + 1 }}</td>
                                        <td>{{ app()->getLocale() == 'ar' ? $menu->menu_ar : $menu->menu }}</td>
                                        <td width="15%" style="text-align: center;">
                                            <a href="{{ route('menus.edit', ['id' => $menu->id]) }}"
                                            class="tool_tip"><i class="material-icons" data-toggle="tooltip" data-placement="top" data-original-title="{{ __('language.edit')}}">edit</i></a>
                                            
                                        </td>
                                    </tr>
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
    <!-- #END# Basic Examples -->
</div>

@endsection

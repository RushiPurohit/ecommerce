<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Slider extends Model
{
    use SoftDeletes;
    
    protected $fillable = ['slider_image', 'slider_image_arabic', 'slider_order', 'slider_option', 'options', 'status', 'created_by', 'updated_by'];

    protected $dates = ['deleted_at'];
}

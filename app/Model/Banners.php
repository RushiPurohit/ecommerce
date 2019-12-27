<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Banners extends Model
{
    use SoftDeletes;

    protected $fillable = ['banner_image', 'banner_image_arabic', 'banner_order', 'banner_option', 'options', 'status', 'created_by', 'updated_by'];

    protected $dates = ['deleted_at'];
}

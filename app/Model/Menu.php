<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{   
    Protected $table = "menus";

    protected $fillable = ['menu', 'parent_id','menu_ar','routes','icon'];
}

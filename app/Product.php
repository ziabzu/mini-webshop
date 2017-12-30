<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    //

    public function getThumbnail()
    {

    	return url('/') . "/public/images/" . $this->image;
    	
    }
}

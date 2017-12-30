<?php

use App\Currency;

/**
* Helper is a General class
*
* Helper is a class that is just used for some custom functions one of them is 
* numberToMoney and will be extended as we need some more helper functions
*
* Example usage:
* if (Helper::numberToMoney()) {
*    returnr formatted amount in currenct format
* }
*
* @package  Helper
* @author   Zia Ur-Rehman <ziabzu@gmail.com>
* @version  $Revision: 1.0 $
* @access   public
* 
*/

class Helper {
    
    public static $defaultImage = "public/photos/avatars/default.jpeg";
    public static $defaultAvatar = "public/photos/avatars/default.jpeg";

    /**
    * Convert a simple float price value to a currency slected by the user
    * to use it php_intl.dll must be enalbed as it uses NumberFormatter object 
    *
    * @param  number  $price in float
    * @return string  formatted number with currency sign and format
    * @access public, static
    */

    public static function numberToMoney($value) {

        $currency = isset($_COOKIE['currency']) ? $_COOKIE['currency'] : 'DKK';
        
        $selectedCurrency = Currency::where('iso_alpha', '=', $currency)->first();

        // money_format does not exists for windows
        /*if (function_exists('money_format')) 
            return money_format('%.' . $selectedCurrency->display_decimal . 'n', $value);
        */

        $fmt = new NumberFormatter($selectedCurrency->locale_code, NumberFormatter::CURRENCY);
        
        $fmt->setPattern( str_replace('¤','', $fmt->getPattern()) . " " . $selectedCurrency->iso_alpha);
 
        return $fmt->formatCurrency($value, $selectedCurrency->iso_alpha);

    }

}
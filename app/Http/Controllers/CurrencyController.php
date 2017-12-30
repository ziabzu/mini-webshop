<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Currency;
use Cache;

class CurrencyController extends Controller
{
     //
    function index() {

    }

    /**
    * Its a sub-view controller that sends currency dropdown where user can select currency he/she wants
    *
    * @return View Object
    * @access public, static
    */

    public static function getCurrenciesDropdown() {

    	//Get cookie of currency
		$currency = isset($_COOKIE['currency']) ? $_COOKIE['currency'] : 'DKK';

 		$currencies = Cache::remember('header_curriencies', 1, function () {
            return $currencies = Currency::where('active', '=', '1')
            ->get();
        });

		//$currencies = Currency::where('active', '=', '1')->get();

        $selectedCurrency = Currency::where('iso_alpha', '=', $currency)->first();

    	return View('currencies.list', ['currencies' => $currencies, 'selectedCurrency' => $selectedCurrency]);

    }


    /**
    * Set currency by setting cookie for 1 hour
    *
    * @param View Object
    * @return 
    * @access public, static
    */

    function setCurrency(Request $request)
    {

    	$currency = $request->input('currency') ? $request->input('currency') : 'DKK';
    	setcookie("currency", $currency, time() + 60 * 60 * 3600); // set for 1  hour

    	return back();

    }

}

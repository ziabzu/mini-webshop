Here it is github source code
https://github.com/ziabzu/mini-webshop

Database is from scratch but its minimal database so just to run it for test. I think you were asking for that.

Uses cookies to save user prefrences. No forex APi has been used for conversion just simple change the currency format when its selected by user.
By default Currency is DKK.


Tools:
Framework Laravel 5.4
PHP 5.6 For currency I used NumberFormatter object as it money_format does not work on Windows. 
So to use NumberFormatter Object php_intl extension must be enabled
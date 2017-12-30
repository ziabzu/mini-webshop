<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="{{ url('/') }}">Tiny Webshop (Beta)</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="{{ url('/') }}">Home</a></li>
    </ul>

      <?php use App\Http\Controllers\CurrencyController;
          echo CurrencyController::getCurrenciesDropdown(); ?>              

  </div>
</nav>
<ul class="nav navbar-nav navbar-right">

	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">{{ $selectedCurrency->iso_alpha }} <span class="caret"></span></a>

		<ul class="dropdown-menu">

			@foreach($currencies as $currency)

			    <li><a href="{{ url('/setCurrency') }}?currency={{$currency->iso_alpha}}">{{ $currency->iso_alpha }}</a></li>

			@endforeach

		</ul>

	</li>    

</ul>

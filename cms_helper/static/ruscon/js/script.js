$(document).ready(function() {
	$(".entry-image-link").colorbox({
		rel : 'entry-image-link'
	});

	$('#press-release').vTicker({
		speed : 500,
		pause : 3000,
		showItems : 5,
		animation : 'fade',
		mousePause : true,
		height : 0,
		direction : 'up'
	});

});

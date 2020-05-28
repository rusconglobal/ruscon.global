$('.collapse2').click(function(event) {
	event.preventDefault();
	collapse2(this, 800);
})

$('.collapse2').each(function() {
	collapse2(this, 0);
})

function collapse2(elem, delay) {
	$(elem).parent().next().each(function() {
		$(this).slideToggle(800);
		$(this).next().slideToggle(800);
	})
} 
	

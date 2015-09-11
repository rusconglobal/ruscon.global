$('.freight-title').click(function () {
	if (window.state != 'mobile' && window.state != '1100')
	{
		$('.freight-el.is_active').removeClass('is_active');
		$(this).parents('.freight-el').addClass('is_active');
		$(this).parents('.freight-el').find('.is-js-animate:visible').trigger('js-animate', ['reset']);
	    $(this).parents('.freight-el').find('.is-js-animate:visible').trigger('js-animate', ['start']);
	}
});
$('.warehouses-map-el-dot').hover(function () {
	$(this).parent().toggleClass('is-active');
});
$('.warehouses-map').hover(function () {
	$(this).find('.warehouses-map-el').toggleClass('is-active');
	$(this).find('.warehouses-map-el-img').fadeIn();

}, function  () {
	$(this).find('.warehouses-map-el-img').hide();
	$(this).find('.warehouses-map-el').toggleClass('is-active');
});
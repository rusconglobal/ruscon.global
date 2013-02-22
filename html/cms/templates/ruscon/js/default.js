//
//
//
function dummy() { }
function no_progress_bar_dummy() { }

function init_idle () {
jQuery.fn.idle = function(time){
return this.each(function(){
var i = $(this);
i.queue(function(){
setTimeout(function(){
i.dequeue();
}, time);
});
});
};
}

//
//
//
function please_register () {
//	Shadowbox.open({
//		content:    '<center><img src="/cms/templates/tehnabor/pics/icon_no.png" /><br />Авторизуйтесь или зарегистрируйтесь</center>', 
//		player:     "html", 
//		height:     80, 
//		width:      300
//	});
}

//
//
//
$(document).ready(function(){
	init_animation();
//	init_idle();
	init_forms();
	init_corners();
//	Shadowbox.init({ overlayColor: "#ffffff", overlayOpacity: "0.5" });
//	Shadowbox.init({ overlayColor: "#999999", overlayOpacity: "0.5", onClose: function() { update_cart(); }, onFinish: function () { setTimeout( function(){ Shadowbox.close(); }, 1000 ) } });
//	init_carousel();
//	init_slider();
});

//
//
//
function update_cart () { 
	$.ajax({
		url: '/ajax/show_cart/',
		success: function(data) {
			if( data.length > 0 ) { 
				$("#small_cart .text").html(data);
				$("#slogan_big").hide();
				$("#slogan_small").hide();
				$("#small_cart").show();
				$("#small_cart .text").animate({ opacity: 0 });
				$("#small_cart .text").animate({ opacity: 1 });
				$("#small_cart .text").animate({ opacity: 0 });
				$("#small_cart .text").animate({ opacity: 1 });
			}
		}
	});
}

//
//
//
function init_corners () {
	$(".cornered_bottom").each(function(){ $(this).corner("bottom 10px"); });
	$(".cornered").each(function(){ $(this).corner("10px"); });
}

//
//
//
function init_lightbox () {
	if ( $('a[rel=lightbox]').attr('rel') == 'lightbox' ){
		$('a[rel=lightbox]').lightBox();
	}
}


//
//
//
function init_slider () {
	if ( $('#slider').attr('id') == 'slider' ) {
	$("#slider").easySlider({
		loop: true,                           // Looping
		orientation: 'fade',                  // Fading
		autoplayDuration: 5000,               // Autoplay with 1 second intervals
		autogeneratePagination: false,         // Automatically generate pagination links
		restartDuration: 5000,                // In case of user interaction, restart the autoplay after 2.5 seconds
		pauseable: true                       // Pause by hovering over the image!  Then restart after 2.5 seconds (see above)
	});
	}
}

//
//
//
function init_carousel () {
	if ( $('#cat_promo').attr('id') == 'cat_promo' ) {
		jQuery('#cat_promo').jcarousel({
			auto: 4,
			wrap: 'circular',
			initCallback: init_carousel_config
		});
	}
	if ( $('#cat_promo2').attr('id') == 'cat_promo2' ) {
		jQuery('#cat_promo2').jcarousel({
			auto: 4,
			wrap: 'circular',
			initCallback: init_carousel_config
		});
	}
}
function init_carousel_config ( carousel ) {
    // Disable autoscrolling if the user clicks the prev or next button.
    carousel.buttonNext.bind('click', function() {
        carousel.startAuto(0);
    });

    carousel.buttonPrev.bind('click', function() {
        carousel.startAuto(0);
    });

    // Pause autoscrolling if the user moves with the cursor over the clip.
    carousel.clip.hover(function() {
        carousel.stopAuto();
    }, function() {
        carousel.startAuto();
    });

	carousel.options.scroll = 1;

	$(".arrow").each(function(){
		$(this).mouseover( function() { 
			$(this).attr('src', $(this).attr('src').replace('.gif','_hover.gif') );
		});
		$(this).mouseout( function() { 
			$(this).attr('src', $(this).attr('src').replace('_hover.gif','.gif') );
		});
		$(this).mousedown( function() { 
			if( $(this).attr('src').indexOf('right') > 0) { 
				carousel.next();
			} else { 
				carousel.prev();
			}
		});
	});
}

//
//
//
function submit_form ( form_name ) {
	var is_correct = "1";
	$(".required,.required_").each(function (i) {
		if( $(this).attr("value") == "") {
			if( $(this).attr("class").indexOf("required_") == -1) { 
				$(this).attr("class", $(this).attr("class").replace("required", "required_") );
			}
			$(this).focus();
			is_correct = "0";
			return false;

		} else {
			if( $(this).attr("class").indexOf("required_") >= 0) { 
				$(this).attr("class", $(this).attr("class").replace("required_", "required") );
			}
		}
	});
	if( is_correct == "1" && $("#form_verify").val() == "0" ) {
		$("#form_verify").val("1");
		$("form#"+form_name+"").submit();
	}
}

//
//
//
function init_forms () {
	if( $("#form_verify").val() >= "0" ) {
		$("#form_verify").val("0");
		$("#current_action").val("0");
	} else {
		$("form:last").append("<input type=hidden id=form_verify name=form_verify value=0 />");
		$("form:last").append("<input type=hidden id=current_action name=current_action value=0 />");
	}
}

//
//
//
function init_animation () {

	$(".clients_animation_change").each(function(i){
		$(this).ulslide({
			width: 260,
			height: 'auto',
			axis: 'x',
			autoslide: 4000
		});
	});
	$(".clients_animation_slide").each(function(i){
		$(this).ulslide({
			width: 190,
			height: 80,
			axis: 'y',
			autoslide: 4000
		});
	});
	$(".clients_animation_fade").each(function(i){
		$(this).ulslide({
			width: 900,
			height: 400,
			affect: 'fade', 
			autoslide: 5000,
			duration: 300 
		});
	});

}

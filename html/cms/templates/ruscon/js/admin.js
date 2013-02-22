//
//
//
function dummy() { }
function no_progress_bar_dummy() { }

//
//
//
$(document).ready(function(){
	init_all();

	$.ajaxSetup ({
	// Disable caching of AJAX responses */
		cache: false
	});

});

//
//
//
//function change_color('$cat.id', '^pics.name.left(^pics.name.pos[sm])') { 
function change_color( cat_id, image_name ) {
	$("#cat_pic").attr("src", "/files/cat/" + cat_id + "/" + image_name + "sm.jpg");
}


//
//
//
function hide_modals () { 
	$("#modal_dialog_confirm").dialog("destroy");
	$("#modal_dialog_loading").dialog("destroy");
}
function hide_modals_with_init () { 
//	hide_modals();
	window.location = window.location;
}

//
//
//
function init_all() {
	hide_modals ();

	init_main_menu();
	init_lightbox();
	init_animation_menu();
	init_colorpicker();
	init_datepicker();
	init_sortable();
	init_animation();
	init_forms();
//	init_tabs();
	init_editor();
//	init_wait_link();
}


//
//
//
function init_lightbox () {
	if( $("#gallery").attr("id") == "gallery" ) {
		$("#gallery a").lightBox();
	}
}

//
//
//
function init_main_menu () {
	$("#menu ul li").mouseover(function(){
		$(this).attr("className","hover");
	});
	$("#menu ul li").mouseout(function(){
		$(this).attr("className","");
	});
}

//
//
//
function init_animation_menu () {
	var current_button = '0';

	$(".promo_button").mouseover(function(){
		if( current_button != $(this).attr('id').replace('button','') ) {

			current_button = $(this).attr('id').replace('button','');

			$(".promo_block").each(function(){
				if( $(this).attr('id') != current_button ){
					$(this).animate({
						width: '345px'
					}, 0);
				}
			});

			$("#promo" + $(this).attr('id').replace('button','') + "").animate({
				width: '+=50'
			}, 500);

		}
	});

	$(".promo_block").mouseover(function(){
		if( current_button != $(this).attr('id').replace('promo','') ) {

			current_button = $(this).attr('id').replace('promo','');

			$(".promo_block").each(function(){
				if( $(this).attr('id') != current_button ){
					$(this).animate({
						width: '345px'
					}, 0);
				}
			});

			$("#promo" + $(this).attr('id').replace('promo','') + "").animate({
				width: '+=50'
			}, 500);

		}
	});

}

//
//
//
function show_modal (dialog_uri, dialog_title, dialog_width, dialog_height) {
	$("#modal_dialog_loading").dialog({ modal: true });
	$("#modal_dialog").dialog("destroy");
	$.get( dialog_uri,  
		function(data){
			if(!dialog_title){ dialog_title = "Администрирование" }
			if(!dialog_width){ dialog_width = "850" }
			if(!dialog_height){ dialog_height = "500" }

			$("#modal_dialog").html(data);
			$("#modal_dialog").attr("title", dialog_title);
			$("#modal_dialog").dialog({
				width: "" + dialog_width + "px", 
				height: "" + dialog_height + "" ,
//				,modal: true
				close: function(ev, ui) {
					$('.jquery_ckeditor').ckeditor( function(){ this.destroy() } );
					$('.jquery_ckeditor_basic').ckeditor( function(){ this.destroy() } );
				}

			});
			init_all();
		}
	);
}
function update_modal (dialog_uri) {
	$("#modal_dialog_loading").dialog({ modal: true });
	$.get( dialog_uri,  
		function(data){
			$("#modal_dialog").html(data);
			init_all();
		}
	);
}

//
//
//
function init_editor () {
	$(".editor___").each(function(i){
//		alert( $(this).attr("id") );
		var oFCKeditor = new FCKeditor( $(this).attr("id") ) ;
		oFCKeditor.BasePath	= "/js/editor/" ;
		oFCKeditor.ToolbarSet = $(this).attr("toolbarset") ;
		oFCKeditor.Width = "730" ;
		oFCKeditor.Height = $(this).attr("height") ;
		oFCKeditor.ReplaceTextarea() ;
	});
}

//
//
//
function submit_form_ajax ( form_name, on_script_end ) {
	var is_correct = "1";
	$("#" + form_name + " .required,#" + form_name + " .required_").each(function (i) {
		if( $(this).attr("value") == "") {
			if( $(this).attr("className").indexOf("required_") == "-1") { $(this).attr("className", $(this).attr("className").replace("required", "required_") ); }
			$(this).focus();
			is_correct = "0";
			return false;
		} else {
			$(this).attr("className", $(this).attr("className").replace("required_", "required") );
		}
	});

	if( is_correct == "1" ) {
		$("#modal_dialog_loading").dialog({ modal: true, height: "100" });
		$("body").append("<iframe src='/admin/submit_form_ajax/' name='ajax_file_upload' id='ajax_file_upload' style='display: none'></iframe>");
		$("form#"+form_name+"").attr("target","ajax_file_upload");
		$("form#"+form_name+"").attr("action","/admin/submit_form_ajax/");
		$("form#"+form_name+"").submit();
		var timeout    = 3000;
		var closetimer = 0;
		if ( on_script_end ) {
			var myFunction = new Function( on_script_end );
			closetimer = window.setTimeout( myFunction , timeout);
		} else {
			closetimer = window.setTimeout( hide_modals_with_init , timeout);
		}
	}
}


//
//
//
function init_sortable () {
	$(".sortable").each(function(i){
		$(this).sortable({
			placeholder: 'ui-state-highlight',
			update: function (event, ui) {
				$.get( '/admin/edit_serialize/?string=' + $(this).sortable('serialize').replace(/&/gi, 'amp;'), 
					function(data){
//						alert(data);
					}
				);
			}
		});
		$(this).disableSelection();
	});
}
//
//
//
function init_datepicker () {
	$(".datapicker").each(function(i){
		$(this).datepicker($.datepicker.regional['ru']);
		$(this).datepicker('option', {dateFormat: 'yy-mm-dd'});
		if( $(this).attr("value_") ){
			$(this).val( $(this).attr("value_") );
		} else {
			var myDate = new Date();
			var prettyDate = myDate.getFullYear() + '-' + eval(myDate.getMonth() + 1) + '-' + myDate.getDate();
			$(this).val(prettyDate);
		}
	});
}

//
//
//
function init_wait_link () {
//	$("a").each(function(i){
//	$(this).click(function(){
//		if( $(this).attr("href").substr(0,1) == "#" || $(this).attr("href").substr(0,34) == "javascript:no_progress_bar_dummy()" ){
//		} else {
//			$("#modal_dialog_loading").dialog({ modal: true });
//		}
//	});
//	});

//	$(":button").each(function(i){
//	$(this).click(function(){
//		if( $(this).attr("onClick").indexOf("toggle") >= "0" ||  $(this).attr("onClick").indexOf("hide_modal") >= "0" || $(this).attr("onClick").indexOf("no_progress_bar_dummy()") >= "0" ) {
//		} else {
//			$("#modal_dialog_loading").dialog({ modal: true });
//		}
//	});
//	});
}

//
//
//
function please_confirm ( message_text, on_script_end ) {

	$("#modal_dialog_confirm").html( message_text );
	$("#modal_dialog_confirm").attr( "title",  $("#please_confirm_text").html() );
	$("#modal_dialog_confirm").dialog({
		resizable: false,
		height:140,
		modal: true,
		buttons: {
			'OK': function() {
				var myFunction = new Function( on_script_end );
				myFunction();
				$(this).dialog('close');
			},
			Cancel: function() {
				$(this).dialog('close');
			}
		}
	});

}

//
//
//
function delete_element ( table_name, key_id, key_value, element_id ) {
	$.get( '/admin/delete_element/?table_name=' + table_name + '&key_id=' + key_id + '&key_value=' + key_value, 
		function(data){
			$("#" + element_id + "").hide("slow");
//			alert(data);
		}
	);
}

//
//
//
function submit_form ( form_name, is_ajax, on_script_end ) {
	$("#form_verify").val("1");
	$("#" + form_name + " .required,#" + form_name + " .required_").each(function (i) {
		if( $(this).attr("value") == "") {
			if( $(this).attr("className").indexOf("required_") == "-1") { $(this).attr("className", $(this).attr("className").replace("required", "required_") ); }
			$(this).focus();
			$("#form_verify").val("0");
			return false;
		} else {
			$(this).attr("className", $(this).attr("className").replace("required_", "required") );
		}
	});

	if( $("#form_verify").val() == "1" ) {
		$("form#"+form_name+"").attr("onsubmit", "return false()");
		$("form#"+form_name+"").submit();
	}
}

//
//
//
function change_menu ( menu_id ) {
	var open_id = menu_id.substring( menu_id.indexOf('_') + 1 );
	var class_name = menu_id.split('_');

	$('.' + class_name[0] + '').each(function (i) {
		if ( $(this).attr('id') == menu_id) {
			if( $(this).attr('value_') == '1' ) {
				$(this).attr('value_', '0');
			} else {
				$(this).attr('value_', '1');
			}
		} else {
			$(this).attr('value_', '0');
			$(this).hide();
		}
	});

	if( $('#' + class_name[0] + '_' + open_id + '').attr('value_') == '1' ) { 
		$('#' + class_name[0] + '_' + open_id + '').show();
	} else {
		$('#' + class_name[0] + '_' + open_id + '').hide();
	}
}

//
//
//
function submit_email ( email ) {
	if ( CheckEmailFormat ( email ) == false ) {
		alert ( 'Неверный формат e-mail');
	} else {
		$.get( '/admin/subscribe_email/?email=' + email + '', 
			function(data){
				$("#subscribe_form_div").html("Ваша заявка успешно отправлена");
//				alert(data);
			}
		);
	}
}

//
//
//
function CheckEmailFormat( email ) {
	var s = '[A-Za-z0-9][-\\w]*(\\.[A-Za-z0-9][-\\w]*)*'
	var re = new RegExp( '^'+s+'@'+s+'\\.[a-zA-Z]{2,4}$')
	email = email.replace( new RegExp('/\(.*?\)/'), '' )
	return re.test(email)
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

//
//
//
function init_colorpicker () {
	$(".colorpicker_").each(function(i){
		$(this).jPicker();
	});
}

//
//
//
function init_forms () {
	if( $("#form_verify").val() >= "0" ) {
		$("#form_verify").val("0");
		$("#current_action").val("0");
	} else {
		$("body").append("<input type=hidden id=form_verify name=form_verify value=0 />");
		$("body").append("<input type=hidden id=current_action name=current_action value=0 />");
	}
}

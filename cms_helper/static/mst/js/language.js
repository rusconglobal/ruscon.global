$(document).ready(function() {
    $('#language').on('click','.language-btn', function() {
        $(this).parent().addClass('is_active');
        $('#language').on('click','a', function() {
            $(this).addClass('is_active').siblings().removeClass('is_active');
            $(this).parent().removeClass('is_active');
        });
    });
    $('#btn-menu').click(function () {
    	$(this).parent().toggleClass('is_active');
    	$('.popup-additionalBlock').toggleClass('is_show');
        $("#header").toggleClass('is_open-additionBlock');
        $('.popup-additionalBlock-btn.is_active').removeClass('is_active').addClass('is_close');
        $('.popup-additionalBlock.is_active').removeClass('is_active');
        $('.popup-additionalBlock-content > div').removeClass('is_show');
        $( ".popup-bg" ).fadeOut();
        $('#btn-search').removeClass('is_active');
        $('#search').removeClass('is_open');
    });

    $('.popup-additionalBlock').on('click', '.popup-additionalBlock-btn.is_close a', function () {
        $('.popup-additionalBlock-btn.is_active').removeClass('is_active').addClass('is_close');
        $('.popup-additionalBlock.is_active').removeClass('is_active');
        $('.popup-additionalBlock-content > div').removeClass('is_show');
        $(this).parent().addClass('is_active');
        $(this).parent().removeClass('is_close');
        $(this).parents('.popup-additionalBlock').removeClass('is_close').addClass('is_active');
        var hrefClass = $(this).attr('href');
        $(hrefClass).addClass('is_show');
        $( ".popup-bg" ).fadeIn();
    });

    $('.popup-additionalBlock').on('click', '.popup-additionalBlock-btn.is_active a', function () {
        $(this).parent().removeClass('is_active');
        $(this).parent().addClass('is_close');
        $(this).parents('.popup-additionalBlock').removeClass('is_active');
        var hrefClass = $(this).attr('href');
        $(hrefClass).removeClass('is_show');
        $( ".popup-bg" ).fadeOut();
    });

    $( ".popup-bg" ).click(function() {
        $('.popup-additionalBlock-btn.is_active').addClass('is_close').removeClass('is_active');
        $('.popup-additionalBlock.is_active').addClass('is_close');
        setTimeout(function(){
              $('.popup-additionalBlock.is_active').removeClass('is_close').removeClass('is_active');
              $('.popup-additionalBlock-content > div').removeClass('is_show');
              $( ".popup-bg" ).fadeOut();
              console.log('1');
        },900);
        return;
    });

    $('body').on('click','.city-title',function () {
        $('.city-el.is_active').removeClass('is_active');
        $(this).parent().addClass('is_active');
        var index = $(this).parent().attr('data-id');
        window.map.panTo(window.marker[index]);
    });

    $('#menu').on('click','#btn-search', function () {
        $(this).addClass('is_active');
        $('#search').addClass('is_open');
        $('#menu').removeClass('is_active');
    });
    $('#menu').on('click','#btn-search.is_active', function () {
        $(this).removeClass('is_active');
        $('#search').removeClass('is_open');
    });

    $(document).mouseup(function (e) {
        if ($(e.target).closest($(".language-btn")).length === 0){
            $('#language').removeClass('is_active');
        }
        if ($(e.target).closest($("#search")).length === 0 && $(e.target).closest($("#btn-search")).length === 0){
            $('#btn-search').removeClass('is_active');
            $('#search').removeClass('is_open');
        } else {
            return;
        }
        if ($(e.target).closest($("#menu")).length === 0 && $(e.target).closest('.popup-additionalBlock.is_show').length == 0){
            if ($('#menu').hasClass('is_active'))
                $('#btn-menu').click();
        } else {
            if ($(e.target).closest('.popup-additionalBlock.is_show').length && $(window).width() > 500)
            {
                if ($('#menu').hasClass('is_active'))
                    $('#btn-menu').click();
            }
        }
    });
    var is_animate = false;
    $('.popup-additionalBlock-btn').hover(function() {
        if (is_animate)
            return;
        $(this).parent().find('.popup-additionalBlock-btn-hover').hide();
        is_animate = true;
        $(this).find('.popup-additionalBlock-btn-hover').fadeIn(function(){
            is_animate = false;
        });
    }, function () {
        $(this).find('.popup-additionalBlock-btn-hover').hide();
    });

    $('.pagination-page').hover(function () {
        $(this).find('.pagination-page-hover').fadeIn();
    }, function () {
        $('.pagination-page').find('.pagination-page-hover').hide();
    });
});    



$(document).ready(function () {
	
	
	$("#search form").submit(function() {
		
		var url = "/helper/search/";
	    $.ajax({
	           type: "GET",
	           url: url,
	           data: $("#search form").serialize(),
	           success: function(data)
	           {	        	   
		        	 var result = "";
		        	 if (data.pages.length > 0) {      		   
		        		   result += "<ul>";
		        		   data.pages.forEach(function(item, i, arr) {
		        			   result += "<li><a href='" + item.url + "'>"  + item.title + "</a></li>";
		        		  });
		        		  result += "</ul>";
		        	  }      	 
		        	         	   
	        	   $('#modal1 .modal-content p').html(result);
	        	   $('#modal1').openModal();
	           },
	           error: function(data)
	           {
	        	   Materialize.toast('При отправке запроса произошла ошибка.', 3000, 'toast-error');
	           }        
	         });
		
		
		
		
		return false;
	});
	
	
	$("#write-to-us").submit(function() {		
	    var url = "/helper/writetous/";
	    $.ajax({
	           type: "POST",
	           url: url,
	           data: $("#write-to-us").serialize(),
	           success: function(data)
	           {
	        	   if (data.result == 1) {
	        		   Materialize.toast('Ваше сообщение успешно отправлено!', 3000, 'toast-success', function(){  $(".popup-bg").click(); });
	        	   } 
	        	   else {
	        		   Materialize.toast('Сообщение не отправлено, данные указаны некорректно!', 3000, 'toast-error');
	        	   }	        	   
	           },
	           error: function(data)
	           {
	        	   Materialize.toast('Произошла ошибка при отправке сообщения!', 3000, 'toast-error');
	           }        
	         });

	    return false; 
	});
});
String.prototype.replaceArray = function(find, replace) {
  var replaceString = this;
  var regex; 
  for (var i = 0; i < find.length; i++) {
    regex = new RegExp(find[i], "g");
    replaceString = replaceString.replace(regex, replace[i]);
  }
  return replaceString;
};

$(document).ready(function () {
    /**
     * Включаем событие централизованного отслеживания изменения экрана.
     */
    $.ajax({
        async:false,
        url: "/geo/offices/",
        //url: "/static/mst/content/server/office.json",
        dataType:"json",
        success:function(data){
            window.officeInfo = data;
            var templates = {
                'mobile':'<div class="offices-block-mobile">\
                                        <div class="offices-block-left">\
                                            <div class="valign-wrapper offices-address">\
                                                <div class="valign">\
                                                    <div class="offices-title">\
                                                        #CITY#\
                                                    </div>\
                                                    <div class="offices-desc">\
                                                        <a href="#">#ADDRESS#</a>\
                                                    </div>\
                                                </div>\
                                            </div>\
                                            <div class="offices-leadership">\
                                                <div class="offices-table-title">\
                                                    #LEADER_TITLE#\
                                                </div>\
                                                <div class="offices-table-desc">\
                                                    #LEADER#\
                                                </div>\
                                            </div>\
                                        </div>\
                                        <div class="offices-block-right">\
                                            <div class="offices-table">\
                                                <div class="offices-table-title">\
                                                    #PHONE_TITLE#:\
                                                </div>\
                                                <div class="offices-table-desc">\
                                                    #PHONE#\
                                                </div>\
                                            </div>\
                                            <div class="offices-table">\
                                                <div class="offices-table-title">\
                                                    #FAX_TITLE#:\
                                                </div>\
                                                <div class="offices-table-desc">\
                                                    #FAX#\
                                                </div>\
                                            </div>\
                                            <div class="offices-table">\
                                                <div class="offices-table-title">\
                                                    #EMAIL_TITLE#:\
                                                </div>\
                                                <div class="offices-table-desc">\
                                                    <a href="#EMAIL#">\
                                                        #EMAIL#\
                                                    </a>\
                                                </div>\
                                            </div>\
                                            <div class="offices-table">\
                                                <div class="offices-table-title">\
                                                    #OFFERS_TITLE#:\
                                                </div>\
                                                <div class="offices-table-desc">\
                                                    <a href="#OFFERS#">\
                                                        #OFFERS#\
                                                    </a>\
                                                </div>\
                                            </div>\
                                        </div>\
                                    </div>',
                'office':'<div class="offices-block #CLASS#" id="offices-#KEY#">\
                                        <div class="offices-block-left">\
                                            <div class="valign-wrapper offices-address">\
                                                <div class="valign">\
                                                    <div class="offices-title">\
                                                        #CITY#\
                                                    </div>\
                                                    <div class="offices-desc">\
                                                        <a href="#">#ADDRESS#</a>\
                                                    </div>\
                                                </div>\
                                            </div>\
                                            <div class="offices-leadership">\
                                                <div class="offices-table-title">\
                                                    #LEADER_TITLE#\
                                                </div>\
                                                <div class="offices-table-desc">\
                                                    #LEADER#\
                                                </div>\
                                            </div>\
                                        </div>\
                                        <div class="offices-block-right">\
                                            <div class="offices-table">\
                                                <div class="offices-table-title">\
                                                    #PHONE_TITLE#:\
                                                </div>\
                                                <div class="offices-table-desc">\
                                                    #PHONE#\
                                                </div>\
                                            </div>\
                                            <div class="offices-table">\
                                                <div class="offices-table-title">\
                                                    #FAX_TITLE#:\
                                                </div>\
                                                <div class="offices-table-desc">\
                                                    #FAX#\
                                                </div>\
                                            </div>\
                                            <div class="offices-table">\
                                                <div class="offices-table-title">\
                                                    #EMAIL_TITLE#:\
                                                </div>\
                                                <div class="offices-table-desc">\
                                                    <a href="#EMAIL#">\
                                                        #EMAIL#\
                                                    </a>\
                                                </div>\
                                            </div>\
                                            <div class="offices-table">\
                                                <div class="offices-table-title">\
                                                    #OFFERS_TITLE#:\
                                                </div>\
                                                <div class="offices-table-desc">\
                                                    <a href="#OFFERS#">\
                                                        #OFFERS#\
                                                    </a>\
                                                </div>\
                                            </div>\
                                        </div>\
                                    </div>',
                'pin':'<div data-img="#IMAGE#" data-id="offices-#KEY#" class="coordinates #CLASS#" style="top: #TOP#; left: #LEFT#;">\
                                    <div class="coordinates-name">\
                                        <span class="text-red">#COUNTRY#,</span> #CITY#\
                                    </div>\
                                    <div class="coordinates-img">\
                                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 86 86" enable-background="new 0 0 86 86" xml:space="preserve">\
                                            <g class="coordinates-img-red">\
                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M43.5,22.5c-11,0-20,9-20,20c0,11,9,20,20,20s20-9,20-20 C63.5,31.5,54.5,22.5,43.5,22.5z M43.5,60C33.8,60,26,52.2,26,42.5S33.8,25,43.5,25S61,32.8,61,42.5S53.2,60,43.5,60z"/>\
                                            </g>\
                                            <g class="coordinates-img-bg coordinates-cursor">\
                                                <circle fill-rule="evenodd" clip-rule="evenodd" cx="43.5" cy="42.5" r="17.5"/>\
                                            </g>\
                                            <g class="coordinates-img-dot coordinates-cursor">\
                                                <circle fill-rule="evenodd" clip-rule="evenodd" cx="43.5" cy="42.5" r="2.5"/>\
                                            </g>\
                                            <g class="coordinates-img-blue">\
                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M43.5,12.5c-16.6,0-30,13.4-30,30c0,16.6,13.4,30,30,30 s30-13.4,30-30C73.5,25.9,60.1,12.5,43.5,12.5z M43.5,70C28.3,70,16,57.7,16,42.5C16,27.3,28.3,15,43.5,15C58.7,15,71,27.3,71,42.5 C71,57.7,58.7,70,43.5,70z"/>\
                                            </g>\
                                            <g class="coordinates-img-white">\
                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M43.5,0C20,0,1,19,1,42.5C1,66,20,85,43.5,85S86,66,86,42.5 C86,19,67,0,43.5,0z M43.5,82.5c-22.1,0-40-17.9-40-40c0-22.1,17.9-40,40-40c22.1,0,40,17.9,40,40C83.5,64.6,65.6,82.5,43.5,82.5z"/>\
                                            </g>\
                                        </svg>\
                                    </div>\
                                </div>',
                'contact':'<div class="city-el #CLASS#" data-id="#KEY#">\
                                    <div class="city-title">\
                                        #CITY#\
                                    </div>\
                                    <div class="city-adress">\
                                        #ADDRESS#\
                                    </div>\
                                    <div class="city-btn">\
                                        <a class="modal-trigger" href="#google-map1">Показать на карте</a>\
                                    </div>\
                                    <div class="city-block">\
                                        <div class="city-desc">\
                                            <div class="city-desc-left">\
                                                #LEADER_TITLE#\
                                            </div>\
                                            <div class="city-desc-right">\
                                                #LEADER#\
                                            </div>\
                                        </div>\
                                        <div class="city-desc">\
                                            <div class="city-desc-left">\
                                                #PHONE_TITLE#:\
                                            </div>\
                                            <div class="city-desc-right">\
                                                #PHONE#\
                                            </div>\
                                        </div>\
                                        <div class="city-desc">\
                                            <div class="city-desc-left">\
                                                #FAX_TITLE#:\
                                            </div>\
                                            <div class="city-desc-right">\
                                                #FAX#\
                                            </div>\
                                        </div>\
                                        <div class="city-desc">\
                                            <div class="city-desc-left">\
                                                #EMAIL_TITLE#:\
                                            </div>\
                                            <div class="city-desc-right">\
                                                <a href="mailto:#EMAIL#">#EMAIL#</a>\
                                            </div>\
                                        </div>\
                                        <div class="city-desc">\
                                            <div class="city-desc-left">\
                                                #OFFERS_TITLE#:\
                                            </div>\
                                            <div class="city-desc-right">\
                                                <a href="mailto:#OFFERS#">#OFFERS#</a>\
                                            </div>\
                                        </div>\
                                    </div>\
                                </div>'
            }
            var mobileCompileHtml = '',
                pinCompileHtml = '',
                tableCompliceHtml = '',
                contactCompileHtml = '';
            $.each(data.items,function(key,value){
                mobileCompileHtml += templates.mobile.replaceArray(
                    ['#CITY#','#ADDRESS#','#LEADER#','#LEADER_TITLE#','#PHONE#','#PHONE_TITLE#','#FAX#','#FAX_TITLE#','#EMAIL#','#EMAIL_TITLE#','#OFFERS#','#OFFERS_TITLE#'],
                    [value.city,value.address,value.leader,value.leader_title,value.phone,value.phone_title,value.fax,value.fax_title,value.request,value.request_title,value.offers,value.offers_title]
                );
                tableCompliceHtml += templates.office.replaceArray(
                    ['#CLASS#','#KEY#','#CITY#','#ADDRESS#','#LEADER#','#LEADER_TITLE#','#PHONE#','#PHONE_TITLE#','#FAX#','#FAX_TITLE#','#EMAIL#','#EMAIL_TITLE#','#OFFERS#','#OFFERS_TITLE#'],
                    [(key == 0) ? 'is_active' : '',key,value.city,value.address,value.leader,value.leader_title,value.phone,value.phone_title,value.fax,value.fax_title,value.request,value.request_title,value.offers,value.offers_title]
                );
                contactCompileHtml += templates.contact.replaceArray(
                    ['#CLASS#','#KEY#','#CITY#','#ADDRESS#','#LEADER#','#LEADER_TITLE#','#PHONE#','#PHONE_TITLE#','#FAX#','#FAX_TITLE#','#EMAIL#','#EMAIL_TITLE#','#OFFERS#','#OFFERS_TITLE#'],
                    [(key == 0) ? 'is_active' : '',key,value.city,value.address,value.leader,value.leader_title,value.phone,value.phone_title,value.fax,value.fax_title,value.request,value.request_title,value.offers,value.offers_title]
                );
                pinCompileHtml += templates.pin.replaceArray(
                    ['#CITY#','#COUNTRY#','#CLASS#','#KEY#','#IMAGE#','#TOP#','#LEFT#'],
                    [value.city,value.country,(key == 0) ? 'is_active'+value.class : ''+value.class,key,value.image,value.position.top,value.position.left]
                );
            });
            $('#mobile_carusel').html(mobileCompileHtml);
            $('#map_load_info').append(pinCompileHtml);
            $('#map_load_info_table').html(tableCompliceHtml);
            $('#map_city').html(contactCompileHtml);
        }
    });
    window.Carusel = new OwlCarousel();
    window.PageSlider = new PageSlider();
    window.AnMap = new AnimationMap();
    window.slide = {
        3: new AnimationSlide3(),
        4: new AnimationSlide4(),
        5: new AnimationSlide5(),
        6: new AnimationSlide6()
    };
    $(".scroll, .scroll_page").mCustomScrollbar({
        theme: "ruscon",
        callbacks: {
            onInit: function () {
                if (!window.activeApp) {
                    window.activeApp = true;
                    $(window).resize();
                }
            },
        }
    });
    /* Проверяем скролл если он не активизировался то вызываем инициализацию приложения в противном случае выше ждём окончание инициализации*/
    if ($(".scroll_page").hasClass('mCS_no_scrollbar')) {
        window.activeApp = true;
        $(window).resize();
    }
    window.pages = {};
    $('#fullpage').children().each(function (key, value) {
        window.pages[$(value).attr('id')] = $(value).position().top + $(value).outerHeight();
    });
});

$(window).resize(function () {
    var widthWindow = $(this).width(),
        heightWindow = $(this).height(),
        oldState = window.state;
    if (widthWindow > 1300) {
        window.state = 'desctop';
    } else {
        if (widthWindow > 1100) {
            window.state = 'laptop';
        } else {
            if (widthWindow > 900) {
                window.state = '1100';
            } else {
                window.state = 'mobile';
            }
        }
    }
    if (heightWindow <= 800 && window.state != 'mobile') {
        window.state = '1100';
    }
    if (oldState != window.state) {
        $(this).unbind('scroll');
        $(this).trigger('change_state');
    }
    sameHeight();
});

/**
 * Отлавливаем события и решаем что нам делать с ними.
 */
$(window).bind('change_state', function () {
    if (!window.activeApp)
        return;
    PageSlider.control(window.state); /* Работаем с Page Slider */
    Carusel.control(window.state); /* Убивает карусель  > 1300 */
    AnMap.control(window.state);
    $.each(window.slide, function (key, value) {
        value.control(window.state);
    });
    setTimeout(function () {
        Carusel.update();
        AnMap.update();
        $.each(window.slide, function (key, value) {
            value.update();
        });
        sameHeight();
        $(".scroll, .scroll_page").mCustomScrollbar('destroy');
        $(".scroll, .scroll_page").mCustomScrollbar({
            theme: "ruscon",
        });
        $(".scroll, .scroll_page").not(':last').mCustomScrollbar("scrollTo","50%");
    }
    , 610);
});

/**
 * Определяем анимацию для мобильных устройств по нахождению позиции экрана при скролле.
 */
window.oldPageY = 0;
window.onscroll = function (event) {
    var scrolled = window.pageYOffset || document.documentElement.scrollTop;
    if (window.oldPageY < event.pageY) {
        scrolled += $(window).outerHeight();
    }
    window.oldPageY = event.pageY;
    $.each(window.pages, function (key, value) {
        if (scrolled <= value) {
            if (window.oldSlide != key) {
                window.oldSlide = key;
                $('#' + key).find('.is-js-animate:visible').trigger('js-animate', ['reset']);
                $('#' + key).find('.is-js-animate:visible').trigger('js-animate', ['start']);
                return false;
            }
            return false;
        }
    });
};
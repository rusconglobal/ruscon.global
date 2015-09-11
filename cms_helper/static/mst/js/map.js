function AnimationMap() {
    this.owlOfficesInside = $(".offices-block"),
        this.owlOfficesMobile = $(".mob-carousel-offices");
    this.bind();
};

AnimationMap.prototype.bind = function () {
    $('.coordinates-img').click(function () {
        var dataId = $(this).parent().attr('data-id');
        $('.coordinates.is_active').removeClass('is_active');
        $(this).parent().addClass('is_active');
        $('.offices-block.is_active').css('display', '');
        $('.offices-block.is_active').removeClass('is_active');
        $('#' + dataId).fadeIn("slow");
        $('#' + dataId).addClass('is_active');
        var dataImg = $(this).parent().attr('data-img');
        $('.coordinates-image img').attr('src', dataImg);
        $('.coordinates-image').show();
    });
};

AnimationMap.prototype.update = function(){
    if (this.owlOfficesMobile.data('owlCarousel'))
        this.owlOfficesMobile.data('owlCarousel').reload();
    if (this.owlOfficesInside.data('owlCarousel'))
        this.owlOfficesInside.data('owlCarousel').reload();
};

AnimationMap.prototype.control = function (state) {
    function desctroyCarusel(carusel){
        if (carusel.data('owlCarousel')) {
            carusel.data('owlCarousel').destroy();
            carusel.removeClass('owl-carousel');
        }
    }
    switch (state) {
        case 'desctop':
            desctroyCarusel(this.owlOfficesMobile);
            desctroyCarusel(this.owlOfficesInside);
            break;
        case 'laptop':
            desctroyCarusel(this.owlOfficesMobile);
            if (!this.owlOfficesInside.data('owlCarousel')) {
                this.owlOfficesInside.owlCarousel({
                    singleItem: true,
                    theme: 'owl-theme-ruscon owl-theme-ruscon-offices'
                });
            }
            break;
        case '1100':
        case 'mobile':
            desctroyCarusel(this.owlOfficesInside);
            this.owlOfficesMobile.owlCarousel({
                singleItem: true,
                theme: 'owl-theme-ruscon owl-theme-ruscon-offices-mobile'
            });
            break;
    }
};

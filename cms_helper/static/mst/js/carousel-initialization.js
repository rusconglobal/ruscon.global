/*
Класс работы с каруселями 
    this.owlSliders - массив с указанием элементов каруселей
*/
function OwlCarousel() {
    "use strict";
    this.owlSliders = [
        $(".table-services"),
        $(".warehouses-carousel"),
        $(".team-wrapper"),
    ];
}

/* Инициализация карусели */
OwlCarousel.prototype.init = function () {
    "use strict";
    var self = this;
    this.owlSliders.forEach(function (slider) {
        if (!slider.data('owlCarousel')) {
            slider.owlCarousel({
                singleItem: true,
                theme: 'owl-theme-ruscon',
                afterMove: self.startAnimate,
            });
        }
    });
};

OwlCarousel.prototype.startAnimate = function () {
    $(this.$owlItems[this.currentItem]).find('.is-js-animate:visible').trigger('js-animate', ['reset']);
    $(this.$owlItems[this.currentItem]).find('.is-js-animate:visible').trigger('js-animate', ['start']);
};

/* Уничтожение карусели */
OwlCarousel.prototype.destroy = function () {
    "use strict";
    this.owlSliders.forEach(function (slider) {
        if (slider.data('owlCarousel')) {
            slider.data('owlCarousel').destroy();
            slider.removeClass('owl-carousel');
        }
    });
};

/* Обновление карусели */
OwlCarousel.prototype.update = function () {
    "use strict";
    this.owlSliders.forEach(function (slider) {
        if (slider.data('owlCarousel')) {
            slider.data('owlCarousel').reload();
        }
    });
};

OwlCarousel.prototype.control = function (state) {
    "use strict";
    switch (state) {
        case 'desctop':
            this.destroy();
            break;
        default:
            this.init();
            break;
    }
};
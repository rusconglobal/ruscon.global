function AnimationSlide3() {
    var self = this;
    this.data = {};
    this.data.dataSliders = [];
    this.data.sliders = $(".transport-carousel-big");
    $(this.data.sliders).children().each(function (key, children) {
        self.data.dataSliders.push($(children));
    });
    this.data.owlSetting = {
        singleItem: true,
        theme: 'owl-theme-ruscon',
        afterMove: this.startAnimate,
    }

    this.data.circles = [
        {
            id: 'circles-1',
            percentage: 66,
            radius: 67,
            width: 3,
            number: 66,
            text: '',
            colors: ['transparent', '#e10000'],
            duration: 1000,
            value: 0,
            maxValue: 100,
            delay:2700,
        },
        {
            id: 'circles-2',
            percentage: 66,
            radius: 67,
            width: 3,
            number: 66,
            text: '',
            colors: ['transparent', '#e10000'],
            duration: 1000,
            value: 0,
            maxValue: 100,
            delay:2700,
        },
        {
            id: 'circles-3',
            percentage: 66,
            radius: 67,
            width: 3,
            number: 66,
            text: '',
            colors: ['transparent', '#e10000'],
            duration: 1000,
            value: 0,
            maxValue: 100,
            delay:2700,
        },
        {
            id: 'circles-4',
            percentage: 66,
            radius: 67,
            width: 3,
            number: 66,
            text: '',
            colors: ['transparent', '#e10000'],
            duration: 1000,
            value: 0,
            maxValue: 100,
            delay:2700,
        }
    ];
};

AnimationSlide3.prototype.reInit = function () {
    var self = this;
    if (this.data.circles) {
        this.data.circles.forEach(function (circle, key) {
            circle.link = Circles.create(circle);
            $('#' + circle.id).attr('data-circle-position', key).on('js-animate', {
                circle: self.data.circles
            }, self.circleAnimate);

        });
    }
    $(this.data.sliders).find('.odometer').on('js-animate', this.digitAnimate);
    $(this.data.sliders).find('[data-delay]').on('js-animate', function(event,state){
        switch (state) {
        case 'reset':
            $(this).removeClass('is-start-animate');
            break;
        case 'start':
            var self = $(this);
            setTimeout(function(){
                self.addClass('is-start-animate');
            }, ((window.state == '1100' || window.state == "mobile") ? 0 : $(this).attr('data-delay')));
            break;
        }
    });
};

AnimationSlide3.prototype.digitAnimate = function (event, state) {
    switch (state) {
    case 'reset':
        var number = parseInt(Math.random()*(10*$(this).attr('data-digit').length));
        this.innerHTML = number;
        break;
    case 'start':
        var self = this;
        setTimeout(function(){
        self.innerHTML = $(self).attr('data-digit');
        },((window.state == '1100' || window.state == "mobile" || window.state == "laptop") ? 0 : $(this).attr('data-delay')));
        break;
    }
}

/**
 * Анимация окружностей в слайде
 * @param {String} state Состояние принимает 2 значения: restore,start
 * @param {Link} element Элемент генерирующий событие
 */
AnimationSlide3.prototype.circleAnimate = function (event, state) {
    var data = event.data.circle,
        index = parseInt($(this).attr('data-circle-position'));
    if (!data[index]) {
        return;
    }
    switch (state) {
    case 'reset':
        data[index].link.update(0, 0);
        break;
    case 'start':
        if (data[index].delay && (window.state != '1100' && window.state != "mobile" && window.state != "laptop"))
        {
            setTimeout(function(){
                data[index].link.update(data[index].percentage, data[index].duration);
            },data[index].delay);
        } else {
            data[index].link.update(data[index].percentage, data[index].duration);
        }
        break;
    }
}

/**
 * События анимации. Генерируем (включаем саму анимацию)
 */
AnimationSlide3.prototype.startAnimate = function () {
    $(this.$owlItems[this.currentItem]).find('.is-js-animate:visible').trigger('js-animate', ['reset']);
    $(this.$owlItems[this.currentItem]).find('.is-js-animate:visible').trigger('js-animate', ['start']);
};

/**
 * Обновление данных (необходимо для карусели)
 */
AnimationSlide3.prototype.update = function () {
    if (this.data.sliders.data('owlCarousel')) {
        this.data.sliders.data('owlCarousel').reload();
    }
};

/**
 * Управление состояниями
 * @param {String} state - состояние
 */
AnimationSlide3.prototype.control = function (state) {
    try {
        switch (state) {
        case 'desctop':
            if (this.data.sliders.data('owlCarousel')) {
                this.data.sliders.data('owlCarousel').destroy();
                this.data.sliders.removeClass('owl-carousel');
            }
            break;
        case 'laptop':
            if (!this.data.sliders.data('owlCarousel')) {
                this.data.sliders.owlCarousel(this.data.owlSetting);
            }
            for (var i = 0, countSlide = this.data.sliders.data('owlCarousel').$owlItems.length; i < countSlide; i++) {
                this.data.sliders.data('owlCarousel').removeItem();
            }
            this.data.sliders.data('owlCarousel').addItem(this.data.dataSliders[0]);
            this.data.sliders.data('owlCarousel').addItem(this.data.dataSliders[2]);
            this.data.sliders.data('owlCarousel').reload();
            break;
        case '1100':
        case 'mobile':
            if (!this.data.sliders.data('owlCarousel')) {
                this.data.sliders.owlCarousel(this.data.owlSetting);
            }
            for (var i = 0, countSlide = this.data.sliders.data('owlCarousel').$owlItems.length; i < countSlide; i++) {
                this.data.sliders.data('owlCarousel').removeItem();
            }
            var self = this;
            this.data.dataSliders.forEach(function (value) {
                self.data.sliders.data('owlCarousel').addItem(value);
            });
            this.data.sliders.data('owlCarousel').reload();
            break;
        }
    } catch (err) {
        console.log(err);
    }
    this.reInit();
};

/* Инициализируем анимацию на 5 слайд */
function AnimationSlide5() {
    var self = this;
    this.data = {};
    this.data.sliders = $("#page_5");
    this.update = function () {};
    this.control = function () {
        this.reInit();
    };
}

/* Наследуем информацию о базовом классе */
AnimationSlide5.prototype = new AnimationSlide3();

/* Инициализируем анимацию на 6 слайд */
function AnimationSlide6() {
    var self = this;
    this.data = {};
    this.data.sliders = $("#page_6");
    this.data.circles = [
        {
            id: 'team-block-diagram-1',
            percentage: 80,
            radius: 64,
            width: 3,
            number: 8242,
            text: '',
            colors: ['transparent', '#fff'],
            duration: 600,
            value: 0,
            maxValue: 100,
            delay:3500,
        },
        {
            id: 'team-block-diagram-2',
            percentage: 40,
            radius: 57,
            width: 3,
            number: 8242,
            text: '',
            colors: ['transparent', '#e10000'],
            duration: 600,
            value: 0,
            maxValue: 100,
            delay:3500,
        },
        {
            id: 'team-block-diagram-3',
            percentage: 25,
            radius: 50,
            width: 3,
            number: 8242,
            text: '',
            colors: ['transparent', '#6476b5'],
            duration: 600,
            value: 0,
            maxValue: 100,
            delay:3500,
        },
        {
            id: 'team-block-diagram-4',
            percentage: 7,
            radius: 43,
            width: 3,
            number: 8242,
            text: '',
            colors: ['transparent', '#4b5a8f'],
            duration: 600,
            value: 0,
            maxValue: 100,
            delay:3500,
        }
    ];
    this.update = function () {

    }
    this.control = function () {
        this.reInit();
    };
}

/* Наследуем информацию о базовом классе */
AnimationSlide6.prototype = new AnimationSlide3();

/* Инициализируем анимацию на 4 слайд */
function AnimationSlide4() {
    var self = this;
    this.data = {};
    this.data.sliders = $("#page_4");
    this.data.tempLinkSlider = '';
    this.data.levelPosition = {};
    this.data.sliders.find('.freight-graph > .freight-graph-el').each(function (key, value) {
        self.data.levelPosition[key] = {
            'key': $(value).find('div.is-active').index(),
            'class': $(value).find('div.is-active').attr('class')
        };
    }).find('.is-active').removeAttr('class');
    this.data.sliders.find('.freight-graph').addClass('is-js-animate').on('js-animate', {
        level: self.data.levelPosition
    }, function (event, state) {
        var data = event.data.level;
        switch (state) {
        case 'reset':
            $(this).find('.freight-graph-el').each(function (key, value) {
                if (data[key]['interval'])
                    clearInterval(data[key]['interval']);
            });
            $(this).find('div.is-active').removeAttr('class');
            break;
        case 'start':
            $(this).find('.freight-graph-el').each(function (key, value) {
                var allCount = $(value).children().length;
                setTimeout(function(){
                    data[key]['interval'] = setInterval(function () {
                        var selectItem = $(value).find('div.is-active').index();
                        if (selectItem < 0) {
                            selectItem = allCount - 1;
                        } else {
                            selectItem--;
                        }
                        if (selectItem < data[key].key) {
                            clearInterval(data[key]['interval']);
                        }
                        $(value).find('div.is-active').removeAttr('class');
                        $(value).find('div').eq(selectItem).addClass(data[key].class);
                    }, 50);
                },100);
            });
            break;
        }
    });

    this.update = function () {};
    this.reInitWithProgressAnimate = function () {
        this.reInit();
    };
    
    this.initCarusel = function(){ 
        this.data.tempLinkSlider.owlCarousel({
            singleItem: true,
            theme: 'owl-theme-ruscon',
            afterMove: this.startAnimate,
        });
    };

    this.desctroyCarusel = function(){
        if (this.data.tempLinkSlider != "" && this.data.tempLinkSlider.data('owlCarousel')) {
            this.data.tempLinkSlider.data('owlCarousel').destroy();
            this.data.tempLinkSlider.removeClass('owl-carousel');
        }
    };

    this.control = function (state) {
        this.desctroyCarusel();
        switch (state) {
        case 'desctop':
            break;
        case 'laptop':
            this.data.tempLinkSlider = this.data.sliders.find('.freight');
            this.initCarusel();
            break;
        case '1100':
        case 'mobile':
            this.data.tempLinkSlider = this.data.sliders.find('.freight-carusel');
            this.initCarusel();
            break;
        }
        this.reInitWithProgressAnimate();
    };
}

AnimationSlide4.prototype = new AnimationSlide3();
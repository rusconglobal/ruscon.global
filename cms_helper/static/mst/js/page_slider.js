function PageSlider() {
    this.anchors = ['page__1', 'page__3', 'page__5', 'page__2', 'page__4', 'page__6', 'page__7'];
    this.init = false;
};

PageSlider.prototype.control = function (state) {
    var pager = this;
    switch (state) {
    case 'desctop':
    case 'laptop':
    case '1100':
        if (!this.init) {
            this.init = true;
            $('#fullpage').fullpage({
                anchors: this.anchors,
                afterLoad:function(){
                    var self = this;
                    setTimeout(function(){
                        self.find('.is-js-animate:visible').trigger('js-animate', ['reset']);
                        self.find('.is-js-animate:visible').trigger('js-animate', ['start']);
                    },100);
                },
                onLeave: function (index, new_index) {
                    var control = $('a[href="#' + pager.anchors[new_index-1] + '"]');
                    control.parent().find('.is_active').removeClass('is_active');
                    control.addClass('is_active');
                    var self = this;
                    self.find('.is-js-animate:visible').trigger('js-animate', ['reset']);
                }
            });
        }
        break;
    case 'mobile':
        if (this.init) {
            $('#fullpage').fullpage.destroy('all');
            this.init = false;
        }
        break;
    }
}

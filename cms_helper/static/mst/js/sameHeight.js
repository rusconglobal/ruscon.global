function sameHeight() {
    var heightElement, heightElementMax;
    heightElementMax = 0;
    $('.sameHeight').each(function (index, element) {
        $(element).find('.sameHeight-block').each(function (i, e) {
            $(e).outerHeight('auto');
            heightElement = $(e).outerHeight();
            if (heightElementMax < heightElement) {
                heightElementMax = heightElement;
            }
        });
        $(element).find('.sameHeight-block').each(function (i, e) {
            $(e).outerHeight(heightElementMax);
        });
        heightElementMax = 0;
    });
}
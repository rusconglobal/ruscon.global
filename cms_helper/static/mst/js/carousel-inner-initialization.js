$(document).ready(function () {
    $(".carusel").owlCarousel({
        items: 1,
        singleItem:true,
        pagination: false,
        mouseDrag: true,
        beforeInit:function(){
          this.$elem.after('<table><tbody><tr><td class="buttom buttonLeft"><img src="./img/leftButton.png" alt=""></td><td class="pagenavigation"></td><td class="buttom buttonRight"><img src="./img/rightButton.png" alt=""></td></tr></tbody></table>');
        },
        afterInit: function () {
            this.$elem.next().find("td.pagenavigation").html(this.currentItem + 1 + " / " + this.$owlItems.length);
            this.$elem.next().find("td.buttonLeft").click(function () {
                $(".carusel").trigger('owl.prev');
            });
            this.$elem.next().find("td.buttonRight").click(function () {
                $(".carusel").trigger('owl.next');
            });
        },
        afterMove: function () {
            this.$elem.next().find("td.pagenavigation").html(this.currentItem + 1 + " / " + this.$owlItems.length);
        }
    });
});

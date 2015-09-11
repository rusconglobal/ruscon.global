function initialize(nameBlock,index) {
    var myLatlng;
    if (index != undefined)
    {
        
    } else {
        index = $('#map_city > .is_active').attr('data-id');
    }
    myLatlng = new google.maps.LatLng(window.officeInfo.items[index].map.lat,window.officeInfo.items[index].map.lng);
    var styles = [{"stylers":[{"saturation":-100},{"gamma":1}]},{"featureType": "transit.line","elementType": "all","stylers": [{"visibility": "off"}]},{"elementType":"labels.text.stroke","stylers":[{"visibility":"off"}]},{"featureType":"poi.business","elementType":"labels.text","stylers":[{"visibility":"off"}]},{"featureType":"poi.business","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"poi.place_of_worship","elementType":"labels.text","stylers":[{"visibility":"off"}]},{"featureType":"poi.place_of_worship","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"geometry","stylers":[{"visibility":"simplified"}]},{"featureType":"water","stylers":[{"visibility":"on"},{"saturation":50},{"gamma":0},{"hue":"#50a5d1"}]},{"featureType":"administrative.neighborhood","elementType":"labels.text.fill","stylers":[{"color":"#333333"}]},{"featureType":"road.local","elementType":"labels.text","stylers":[{"weight":0.5},{"color":"#333333"}]},{"featureType":"transit.station","elementType":"labels.icon","stylers":[{"gamma":1},{"saturation":50}]}];
    var myOptions = {
        zoom: 16,
        center: myLatlng,
        styles: styles,
        disableDefaultUI: true,
        scrollwheel: true,
        zoomControl: true,
        zoomControlOptions: {
          style: google.maps.ZoomControlStyle.SMALL
        },
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    window.map = new google.maps.Map(document.getElementById(nameBlock), myOptions);

    var contentString = '<div class="map-contact-infoWindow"><p><b>Ruscon</b></p><p>ruscon</p></div>';

    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });
    $.each(window.officeInfo.items,function(key,value){

        var myLatlng = new google.maps.LatLng(value.map.lat,value.map.lng);
        var image = {
            url : 'img/google-map.png',
            size: new google.maps.Size(61,61),
            origin:new google.maps.Point(0,0),
            anchor: new google.maps.Point(30,30)
        };
        window.marker.push(myLatlng);
        new google.maps.Marker({
            position: myLatlng,
            animation: google.maps.Animation.DROP,
            map: map,
            title:"Ruscon",
            icon: image
        });
    });
    google.maps.event.addListener(marker, 'click', function() {
    });

}
window.marker = [];
function mapCreate() {
    google.maps.event.addDomListener(window, 'load', initialize("google-map"));
    $('.modal-trigger').leanModal({
         ready: function() {google.maps.event.addDomListener(window, 'load', initialize("modal-google-map",$('#map_city > .is_active').attr('data-id'))); }
    });
}

$(window).on('load',mapCreate);
$(window).bind('change_state', function () {
    initialize("google-map");
});
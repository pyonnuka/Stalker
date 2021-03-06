var message;
var you;
var map;
var directionsDisplay;
var directionsService;
var waypoints = [];

function start_func(){
    artistLatitude = $(".mydistance").data('latitude')
    artistLongitude = $(".mydistance").data('longitude')
    you = new google.maps.LatLng(artistLatitude, artistLongitude);
    directionsService = new google.maps.DirectionsService();
    get_location();
    initialize();
}

function get_location(){
    navigator.geolocation.watchPosition
    (function(pos) {
        var potitionLatitude = pos.coords.latitude;
        var potitionLongitude = pos.coords.longitude;
        var me = new google.maps.LatLng(potitionLatitude, potitionLongitude);

        var distance = google.maps.geometry.spherical.computeDistanceBetween(me, you);
        distance=distance|0

        $("#your_position").text("あなたの場所: " + potitionLatitude + "." + potitionLongitude)
        $("#area_name_tabmap").text(distance + "m")
        $("#area_name_tabranking").text(distance + "m")
        $(".input-distance").attr("value", distance)
        $(".input-latitude").attr("value", potitionLatitude)
        $(".input-longitude").attr("value", potitionLongitude)
    }, null, {
        enableHighAccuracy: true,
        maximumAge: 0
    });
}



function updatePosition() {
    navigator.geolocation.watchPosition
    (function(pos){
        var myPositionLatitude = pos.coords.latitude;
        var myPositionLongitude = pos.coords.longitude;
        var me = new google.maps.LatLng(myPositionLatitude, myPositionLongitude);

        $(".artistdistance").each(function(){
            latitude = $(this).data('latitude')
            longitude = $(this).data('longitude')

            you = new google.maps.LatLng(latitude, longitude);
            $(this).text(Math.round(google.maps.geometry.spherical.computeDistanceBetween(me, you)) + "m");
        })
    }, null, {
        enableHighAccuracy: true,
        maximumAge: 0
    });
}


function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    var latlng = new google.maps.LatLng(35.539001,134.228468);
    var opts = {
        zoom: 13,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("map_canvas"), opts);
    directionsDisplay.setMap(map);

    dispRoute();
}
function dispRoute() {
    if (gon.position.length == 1){
        var start = gon.position[0];
        var end = gon.position[0];
    }else if(gon.position.length == 2){
        var start = gon.position[0];
        var end = gon.position[1];
    }else{
        var start = gon.position[0];
        var end = gon.position[1];
    for( var i = 2;i < gon.position.length; i++){
            waypoints.push({location: gon.position[i]});
        }
    }

    if (gon.position.length < 3){
        var request = {
        origin:start,
        destination:end,
        travelMode: google.maps.TravelMode.DRIVING
        };
    }else{
        var request = {
        origin:start,
        destination:end,
        waypoints:waypoints,
        travelMode: google.maps.TravelMode.DRIVING
        };
    }
    directionsService.route(request, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(result);
        }
    });
}

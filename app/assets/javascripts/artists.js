var message;
var you;
var map;
var directionsDisplay;
var directionsService;

function start_func(){
    you = new google.maps.LatLng(35.681382, 139.76608399999998); // 東京駅
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

        $("#your_position").text("あなたの場所: " + potitionLatitude + "." + potitionLongitude)
        $("#area_name").text("あなたとの距離: " + distance + "m")
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
    var start = "渋谷"
    var end = "新宿"
    var request = {
        origin:start,
        destination:end,
        waypoints:[
        {
        location: "東京駅"
        },
        {
        location: "北海道"
        }
        ],
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(result);
        }
    });
}


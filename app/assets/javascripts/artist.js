var message;
var you;

function start_func(){
    you = new google.maps.LatLng(35.681382, 139.76608399999998); // 東京駅
    get_location();
}

function get_location(){
    if (navigator.geolocation) {
        navigator.geolocation.watchPosition
        (successCallback,errorCallback,{
            enableHighAccuracy: true,
            maximumAge: 0
        });
    } else {
        message = "本ブラウザではGeolocationが使えません";
        document.getElementById("area_name").innerHTML
            = message;
    }
}

function successCallback (pos){
    var potitionLatitude = pos.coords.latitude;
    var potitionLongitude = pos.coords.longitude;
    var me = new google.maps.LatLng(potitionLatitude, potitionLongitude);

    console.log(me)
    var distance = google.maps.geometry.spherical.computeDistanceBetween(me, you);

    $("#your_position").text("あなたの場所: " + potitionLatitude + "." + potitionLongitude)
    $("#area_name").text("あなたとの距離: " + distance + "m")

}

function errorCallback(error) {
    message = "位置情報が許可されていません";
    document.getElementById("area_name").innerHTML = message;

}


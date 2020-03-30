<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), { //지도 객체 생성
          zoom: 6, //기본 줌
          center: new google.maps.LatLng(13.7244416,100.3529128), //지도 센터 위도/경도(방콕)
          mapTypeId: 'terrain'
        });
        
        // mapTypeId
        //roadmap : 기본 로드맵보기를 표시합니다. 이것이 기본지도 유형입니다.
        //satellite Google : 어스 위성 이미지를 표시합니다.
        //hybrid : 일반 뷰와 위성 뷰가 혼합되어 표시됩니다.
        //terrain : 지형 정보를 기반으로 실제지도를 표시합니다.

        // map.data.loadGeoJson('data.json'); ----> 동일한 도메인의 json파일 가져오기

        // JSONP를 요청하는 방법 (JSONP : script태그를 생성해 다른 도메인을 요청할 시)
        // Create a <script> tag and set the USGS URL as the source.
        var script = document.createElement('script'); //스크립트 태그 생성
        // This example uses a local copy of the GeoJSON stored at
        // http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.geojsonp
        script.src = 'https://developers.google.com/maps/documentation/javascript/examples/json/earthquake_GeoJSONP.js'; //json 위치
        document.getElementsByTagName('head')[0].appendChild(script);
      }

      // JSONP를 사용할 때 사용???확실x
      // Loop through the results array and place a marker for each
      // set of coordinates.
      window.eqfeed_callback = function(results) { //json을 토대로 마커 찍기
        for (var i = 0; i < results.features.length; i++) {
          var coords = results.features[i].geometry.coordinates;
          var latLng = new google.maps.LatLng(coords[1],coords[0]);
          var marker = new google.maps.Marker({
            position: latLng,
            map: map
          });
        }
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiDE5HBue4mflsdkcsGvSZrUeEooX8gWQ&callback=initMap">
    </script>
  </body>
</html>
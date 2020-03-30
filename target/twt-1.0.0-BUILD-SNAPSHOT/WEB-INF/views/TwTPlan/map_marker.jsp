<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 600px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
    </style>
  </head>
  <body>
    <h3>My Google Maps Demo</h3>
    <!--The div element for the map -->
    <div id="map"></div>
    <script>
	// Initialize and add the map
	function initMap() {
	  // The location of Uluru
	  var bangkok = {lat: 13.7244416, lng: 100.3529128}; //방콕위치 위도/경도
/* 	  var uluru = {lat: -25.344, lng: 131.036}; */
	  // The map, centered at bangkok
	  var map = new google.maps.Map( //지도 객체 생성
	      document.getElementById('map'), {zoom: 6, center: bangkok}); //기본 줌,시작 센터 설정
	  // The marker, positioned at bangkok
	  var marker = new google.maps.Marker({position: bangkok, map: map}); //marker찍어주기
	}
    </script>
    <!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiDE5HBue4mflsdkcsGvSZrUeEooX8gWQ&callback=initMap">
    </script>
    <!-- 지역/언어 현지화 : src 끝에 &language=ko&region=KR -->
    <!-- 
    	  버전 관리 : src에서 js?뒤에 붙여줌 
    	 v=weekly : 일주일에 한번 업데이트
    	 v=quarterly : 분기당 한번 업데이트
    	 v=n.nn : 버전 선택
    	 ex) v=weekly&key=~~~~...
   	-->
  </body>
</html>
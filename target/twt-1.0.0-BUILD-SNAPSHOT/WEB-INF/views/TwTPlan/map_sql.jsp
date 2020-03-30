<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <title>Using MySQL and PHP with Google Maps</title>
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

<html>
  <body>
    <div id="map"></div>

    <script>
      var customLabel = {
        restaurant: { //식당 표시
          label: 'R'
        },
        bar: { //bar 표시
          label: 'B'
        }
      };

        function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), { //지도 객체 생성
          center: new google.maps.LatLng(13.7244416, 100.3529128), //지도 센터 위도/경도 (방콕)
          zoom: 6
        });
        var infoWindow = new google.maps.InfoWindow;

          // Change this depending on the name of your PHP or XML file
          downloadUrl('https://storage.googleapis.com/mapsdevsite/json/mapmarkers2.xml', function(data) { //xml로 정보가져오기
            var xml = data.responseXML;
            var markers = xml.documentElement.getElementsByTagName('marker');
            Array.prototype.forEach.call(markers, function(markerElem) { //한 곳의 정보들
              var id = markerElem.getAttribute('id');
              var name = markerElem.getAttribute('name');
              var address = markerElem.getAttribute('address');
              var type = markerElem.getAttribute('type');
              var point = new google.maps.LatLng(
                  parseFloat(markerElem.getAttribute('lat')),
                  parseFloat(markerElem.getAttribute('lng')));

              var infowincontent = document.createElement('div'); //div 생성 (marker클릭시 간단한 정보 표시해주는 div)
              var strong = document.createElement('strong'); //strong태그 생성
              strong.textContent = name // strong 태그에 marker의 이름추가 
              infowincontent.appendChild(strong); //div에 strong 추가
              infowincontent.appendChild(document.createElement('br')); //br태그 생성

              var text = document.createElement('text'); //text태그 추가
              text.textContent = address //text태그에 marker의 주소 추가
              infowincontent.appendChild(text); //div태그에 text태그 추가
              var icon = customLabel[type] || {}; //label
              var marker = new google.maps.Marker({ //marker생성
                map: map,
                position: point, //xml에서 가져온 marker 위치
                label: icon.label 
              });
              marker.addListener('click', function() { //marker 클릭시 간단한 정보 표시
                infoWindow.setContent(infowincontent);
                infoWindow.open(map, marker);
              });
            });
          });
        }


	  // xml 파일 가져오기
      function downloadUrl(url, callback) {
        var request = window.ActiveXObject ?
            new ActiveXObject('Microsoft.XMLHTTP') :
            new XMLHttpRequest;

        request.onreadystatechange = function() {
          if (request.readyState == 4) {
            request.onreadystatechange = doNothing;
            callback(request, request.status);
          }
        };

        request.open('GET', url, true);
        request.send(null);
      }

      function doNothing() {}
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiDE5HBue4mflsdkcsGvSZrUeEooX8gWQ&callback=initMap">
    </script>
  </body>
</html>
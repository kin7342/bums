<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Jquery Ui  Datepicker--> 
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" >
	
	<style>.gm-style .gm-style-mtc label,.gm-style .gm-style-mtc div{font-weight:400}</style>
	<style>.gm-control-active>img{box-sizing:content-box;display:none;left:50%;pointer-events:none;position:absolute;top:50%;transform:translate(-50%,-50%)}.gm-control-active>img:nth-child(1){display:block}.gm-control-active:hover>img:nth-child(1),.gm-control-active:active>img:nth-child(1){display:none}.gm-control-active:hover>img:nth-child(2),.gm-control-active:active>img:nth-child(3){display:block}</style>
	<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Google+Sans">
	<style>.gm-ui-hover-effect{opacity:.6}.gm-ui-hover-effect:hover{opacity:1}</style>
	<style>.gm-style .gm-style-cc span,.gm-style .gm-style-cc a,.gm-style .gm-style-mtc div{font-size:10px;box-sizing:border-box}</style>
	<style>@media print {  .gm-style .gmnoprint, .gmnoprint {    display:none  }}@media screen {  .gm-style .gmnoscreen, .gmnoscreen {    display:none  }}</style><style>.gm-style-pbc{transition:opacity ease-in-out;background-color:rgba(0,0,0,0.45);text-align:center}.gm-style-pbt{font-size:22px;color:white;font-family:Roboto,Arial,sans-serif;position:relative;margin:0;top:50%;-webkit-transform:translateY(-50%);-ms-transform:translateY(-50%);transform:translateY(-50%)}</style>
	<style>.gm-style img{max-width: none;}.gm-style {font: 400 11px Roboto, Arial, sans-serif; text-decoration: none;}</style>

   <meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
   <meta http-equiv="content-type" content="text/html; charset=utf-8">
   <meta name="google-site-verification" content="ipMgUnVX-SfjeuEkrb4h9kVsm7aKqjCDyEaCwb3EtlU">
   <title>TwT - 일정만들기</title>
         
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/default_ko.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/reset.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/default.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/gnb.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/tipsy.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/workspace.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/date_picker.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/detail_complete_modal.css">

<% String cd = request.getParameter("citycode"); %>
<!-- map script -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">

//전역 변수 선언
var map; // 맵
var marker = new Array(); // 마커
var myIcon; // 마커 아이콘
var spotname = new Array(); // 스팟 이름
var locations = new Array(); // 도시 위도/경도
var markers = new Array(); // 마커 배열
var citycode = new Array(); // 도시 코드
var imgname = new Array(); // 이미지 이름
var spottype = new Array(); // 스팟 타입
var citycodes = new Array(); //도시 코드
var B_TD; // 랜드마크 마커 아이콘(Before)
var B_RS; // 식당 마커 아이콘(Before)
var B_SP; // 쇼핑 마커 아이콘(Before)
var B_TD_H; // 랜드마크 마커 아이콘(Before hover)
var B_RS_H; // 식당 마커 아이콘(Before hover)
var B_SP_H; // 쇼핑 마커 아이콘(Before hover)
var A_TD; // 랜드마크 마커 아이콘(After)
var A_RS; // 식당 마커 아이콘(After)
var A_SP; // 쇼핑 마커 아이콘(After)
var A_TD_H; // 랜드마크 마커 아이콘(After hover)
var A_RS_H; // 식당 마커 아이콘(After hover)
var A_SP_H; // 쇼핑 마커 아이콘(After hover)
var tooltipcontent; // infobox content
var infowindow; // 마커 클릭시 infobox
var spotaddr = new Array(); // 스팟 주소
var spotcontent = new Array(); // 스팟 설명
var pathpoly = new Array(); // 폴리라인 위도,경도 생성
var arrlat = new Array(); // 폴리라인 위도 배열
var arrlng = new Array(); // 폴리라인 경도 배열
var spotcode = new Array(); // 스팟 코드 배열
var lats = new Array(); // 모든 스팟 위도 배열
var lngs = new Array(); // 모든 스팟 경도 배열
var paths = new Array(); // 경로 배열
var count; // 스팟리스트 개수
/* var distance; // 거리계산 */

   
   // map 객체 생성
   window.onload = function initMap() {
      
      // 초기 선택된 도시의 위도/경도
      var lati = ${cityvo.city_Lati};
      var lon = ${cityvo.city_Long};
      
      // 초기 선택된 도시의 센터 위치
      var cen = {lat: lati, lng: lon}; 
      
      // 초기 선택된 도시의 센터를 중심으로 맵 생성
      map = new google.maps.Map( //지도 객체 생성
         document.getElementById('map'), {zoom: 12, center: cen}); //기본 줌,시작 센터 설정
      
      // 마커 생성
      addMarker();
         
      // 거리계산(안됨)
      /* distance = google.maps.geometry.spherical.computeDistanceBetween(locations[0],locations[1]);
      alert(distance);
      console.log(distance); */
      
   } /* init end */
   
   // 마커 추가
   function addMarker(){
      // spot list 개수 가져오기
      count = $(".day_spot_item").length;
      
      // 마커 이미지 
      B_TD = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/B_TD.png",null,null,null,new google.maps.Size(40,42));
      B_RS = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/B_RS.png",null,null,null,new google.maps.Size(40,42));
      B_SP = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/B_SP.png",null,null,null,new google.maps.Size(40,42));
      B_TD_H = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/B_TD_H.png",null,null,null,new google.maps.Size(40,42));
      B_RS_H = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/B_RS_H.png",null,null,null,new google.maps.Size(40,42));
      B_SP_H = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/B_SP_H.png",null,null,null,new google.maps.Size(40,42));
      A_TD = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/A_TD.png",null,null,null,new google.maps.Size(40,42));
      A_RS = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/A_RS.png",null,null,null,new google.maps.Size(40,42));
      A_SP = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/A_SP.png",null,null,null,new google.maps.Size(40,42));
      A_TD_H = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/A_TD_H.png",null,null,null,new google.maps.Size(40,42));
      A_RS_H = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/A_RS_H.png",null,null,null,new google.maps.Size(40,42));
      A_SP_H = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/A_SP_H.png",null,null,null,new google.maps.Size(40,42));
      
      // 위치 위도/경도, 스팟 이름, 도시 코드, 이미지 명, 스팟 타입 담기
          for(var i=0;i<count; i++){
	         locations[i] = {"position" : new google.maps.LatLng($("#spot_"+i).attr("data-lat"),$("#spot_"+i).attr("data-lng"))};
	         spotname[i] = $("#spot_"+i).attr("data-name");
	         citycode[i] = $("#spot_"+i).attr("data-city");
	         imgname[i] = $("#spot_"+i).attr("data-img");
	         spottype[i] = $("#spot_"+i).attr("data-type");
	         spotaddr[i] = $("#spot_"+i).attr("data-addr");
	         spotcontent[i] = $("#spot_"+i).attr("data-con");
	         lats[i] = $("#spot_"+i).attr("data-lat");
	         lngs[i] = $("#spot_"+i).attr("data-lng");
	         spotcode[i] = $("#spot_"+i).attr("data-no");
          }
      
        // 스팟 마커찍기
      for (var i=0;i<count;i++) {
         if($("#spot_"+i).attr("data-type") == "랜드마크"){
            // 랜드마크 마커 생성
              marker[i] = new google.maps.Marker({
                  position: locations[i].position,
                  map: map,
                  icon: B_TD,
                  title: spotname[i]
                });
            markerListener(marker[i],i,$("#spot_"+i).attr("data-type"));
            
         }else if($("#spot_"+i).attr("data-type") == "식당가"){
            // 식당 마커 생성
              marker[i] = new google.maps.Marker({
                  position: locations[i].position,
                  map: map,
                  icon: B_RS,
                  title: spotname[i]
                });
            markerListener(marker[i],i,$("#spot_"+i).attr("data-type"));
            
         }else if($("#spot_"+i).attr("data-type") == "쇼핑"){
            // 쇼핑 마커 생성
              marker[i] = new google.maps.Marker({
                  position: locations[i].position,
                  map: map,
                  icon: B_SP,
                  title: spotname[i]
                });
            markerListener(marker[i],i,$("#spot_"+i).attr("data-type"));
         }
           
      }
        
      // spot 추가가 없을 경우 마커 이미지 변경
      if($("#schedule_detail_box").children().length == 0){
         for(var i=0;i<locations.length;i++){
            markerOver(marker[i],i,spottype[i]);
         }
      }
      
   }
   
   // 마커 클릭 이벤트
   function markerListener(mark, index, type){
      // 매개변수 마커에 클릭이벤트 적용
      google.maps.event.addListener(mark, 'click', function() {
         
         // info 정보 담아주기
         tooltipcontent = "<div class='tooltip_full_box' style='display:block;'>"+
         "<div class='tooltip_img fl'><img src='${pageContext.request.contextPath}/resources/images/plan/"+citycode[index]+"/"+imgname[index]+"'></div>"+
         "<div class='tooltip_info fl'>"+
         "<div class='tooltip_title'>"+spotname[index]+"</div>"+
         "<div class='tooltip_tag'>"+spottype[index]+"</div></div>"+
         "<div class='tooltip_detail_bottom_box'>"+
         "<div class='fl tooltip_detail_btn' onclick='detail_view_spot(&quot;"+spotname[index]+"&quot;,&quot;"+imgname[index]+"&quot;,&quot;"+spotcontent[index]+"&quot;,&quot;"+spotaddr[index]+"&quot;,&quot;"+citycode[index]+"&quot;,&quot;"+spottype[index]+"&quot;)'>자세히 보기</div>"+
         "<div class='fr tooltip_add_inspot_btn' id='insert_spot' onclick='marker_to_inspot(&quot;"+spotname[index]+"&quot;,&quot;"+spottype[index]+"&quot;,&quot;"+spotcode[index]+"&quot;,&quot;"+lats[index]+"&quot;,&quot;"+lngs[index]+"&quot;,&quot;"+citycode[index]+"&quot;,&quot;"+imgname[index]+"&quot;,&quot;"+index+"&quot;,&quot;"+spotcontent[index]+"&quot;,&quot;"+spotaddr[index]+"&quot;)'>+ 일정에 추가</div></div></div>";
         
         // 클릭시 타입에 맞게 마커 이미지 변경 & infobox 나타내기
         if(type == "랜드마크"){

            // 클릭시 마커를 중심으로 확대
            map.setZoom(15);
                 map.setCenter(this.getPosition());
            
                 // infobox show
            if(infowindow == null){
               infowindow = new google.maps.InfoWindow();
               infowindow.setContent(tooltipcontent);
               infowindow.open(map, mark);
            }else{
               infowindow.close();
               infowindow = new google.maps.InfoWindow();
               infowindow.setContent(tooltipcontent);
               infowindow.open(map, mark);
            }
         }else if(type == "식당가"){

            map.setZoom(15);
                 map.setCenter(this.getPosition());
            
            if(infowindow == null){
               infowindow = new google.maps.InfoWindow();
               infowindow.setContent(tooltipcontent);
               infowindow.open(map, mark);
            }else{
               infowindow.close();
               infowindow = new google.maps.InfoWindow();
               infowindow.setContent(tooltipcontent);
               infowindow.open(map, mark);
            }
            
         }else if(type == "쇼핑"){

            map.setZoom(15);
                 map.setCenter(this.getPosition());
            
            if(infowindow == null){
               infowindow = new google.maps.InfoWindow();
               infowindow.setContent(tooltipcontent);
               infowindow.open(map, mark);
            }else{
               infowindow.close();
               infowindow = new google.maps.InfoWindow();
               infowindow.setContent(tooltipcontent);
               infowindow.open(map, mark);
            }
         }
         
      });
      
   } /* markerListener end */
   
   // mouseover시 마커 아이콘 변경(spot 추가 전)
   function markerOver(mark,index,type){
      
      // 마커에 mouseover시
      google.maps.event.addListener(mark, "mouseover", function() {
         if(type == "랜드마크"){
            mark.setIcon(B_TD_H);
         }else if(type == "식당가"){
            mark.setIcon(B_RS_H);
         }else if(type == "쇼핑"){
            mark.setIcon(B_SP_H);
         }
      });
      
      // 마커에 mouseout시
      google.maps.event.addListener(mark, "mouseout", function() {
         if(type == "랜드마크"){
            mark.setIcon(B_TD);
         }else if(type == "식당가"){
            mark.setIcon(B_RS);
         }else if(type == "쇼핑"){
            mark.setIcon(B_SP);
         }
      });
      
   }
   
   
   // spot추가시 마커 이미지 변경
   function addMarkerIcon(index,type){
      // spot 추가 직후 
      if(type == "랜드마크"){
         marker[index].setIcon(A_TD);
      }else if(type == "식당가"){
         marker[index].setIcon(A_RS);
      }else if(type == "쇼핑"){
         marker[index].setIcon(A_SP);
      }
      
      // spot 마커 mouseover시 
      google.maps.event.addListener(marker[index], "mouseover", function() {
         if(type == "랜드마크"){
            marker[index].setIcon(A_TD_H);
         }else if(type == "식당가"){
            marker[index].setIcon(A_RS_H);
         }else if(type == "쇼핑"){
            marker[index].setIcon(A_SP_H);
         }
      });
      
      // spot 마커 mouseout시 
      google.maps.event.addListener(marker[index], "mouseout", function() {
         if(type == "랜드마크"){
            marker[index].setIcon(A_TD);
         }else if(type == "식당가"){
            marker[index].setIcon(A_RS);
         }else if(type == "쇼핑"){
            marker[index].setIcon(A_SP);
         }
      });
      
   }
   
   // spot 삭제시 마커 이미지 변경
   function delMarkerIcon(index,type){
      // spot 삭제 직후 
      if(type == "랜드마크"){
         marker[index].setIcon(B_TD);
      }else if(type == "식당가"){
         marker[index].setIcon(B_RS);
      }else if(type == "쇼핑"){
         marker[index].setIcon(B_SP);
      }
      
      // 삭제된 spot 마커 mouseover시 
      google.maps.event.addListener(marker[index], "mouseover", function() {
         if(type == "랜드마크"){
            marker[index].setIcon(B_TD_H);
         }else if(type == "식당가"){
            marker[index].setIcon(B_RS_H);
         }else if(type == "쇼핑"){
            marker[index].setIcon(B_SP_H);
         }
      });
      
      // 삭제된 spot 마커 mouseout시 
      google.maps.event.addListener(marker[index], "mouseout", function() {
         if(type == "랜드마크"){
            marker[index].setIcon(B_TD);
         }else if(type == "식당가"){
            marker[index].setIcon(B_RS);
         }else if(type == "쇼핑"){
            marker[index].setIcon(B_SP);
         }
      });
   }
   
   // 스팟 상세 box 뿌리기
   function detail_view_spot(name,img,con,add,citycd,type){
      $(".detail_view_full_box").removeData("no"); // 메모&예산
      
      $("#select_detail_view_spot").css("display","block");
      $(".info_memo").css("display","none");
      $(".spot_title").html(name);
      $("#spot_img").attr("src","${pageContext.request.contextPath}/resources/images/plan/"+citycd+"/"+img);
      $("#spot_con").html(con);
      $("#sub_addr").html("<i class='fas fa-map'></i>         " + add);
      $("#sub_info").html(type);
   }
   
   // 추가된 스팟 경로배열에 넣기
   function addPath(){
      // 배열 초기화
      arrlat = [];
      arrlng = [];
      pathpoly = [];
      
      // 추가되어있는 스팟들 위도/경도
      for(var i=1;i<=$("#schedule_detail_box").children().length;i++){
         arrlat.push($("#spot"+i).attr("data-lat"));
         arrlng.push($("#spot"+i).attr("data-lng"));
      }
      
      // 폴리 라인
      for(var i=0;i<arrlat.length;i++){
         pathpoly[i] = new google.maps.LatLng(arrlat[i],arrlng[i]);
      }
      
          markerPoly();
      
   }
   
   // 추가된 스팟 배열로 경로 찍기
   function markerPoly(){
      
          // 라인 모양
      var lineSymbol = {path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW};
          
          //경로 찍기
      paths.push(new google.maps.Polyline({
            path: pathpoly,
               icons: [{
                icon: lineSymbol,
                repeat:'100px',
                offset: '100%'
                 }],
                 geodesic: true,
                 strokeColor: 'red',
                 strokeOpacity: 1.0,
                 strokeWeight: 1.5
           })
      );
      
          // 마지막 추가된 경로만 map에 올리기
      paths[paths.length-1].setMap(map);
        
   }
   
   // 마커를 통해 스팟 추가
   function marker_to_inspot(name,type,tpcd,lat,lng,ctcd,img,index,con,addr){
      var set_day = $(".on").attr("data"); // Day
          var spot_name = name; // 여행지명
          var spot_type = type; // 여행지 타입
          var spot_no = tpcd; // 순서
          var spot_lat = lat; // 위도
          var spot_lng = lng; // 경도
          var spot_city = ctcd; // 도시 번호
          var spot_img = img; // 사진
          var spot_seq = $("#schedule_detail_box").children().length + 1;
          var spot_num = index; // 인덱스 번호
          var spot_content = con; // 스팟 설명
          var spot_addr = addr; // 스팟 주소
          var city_name;
          
          var spot_arr = new Array(spot_name, spot_type, spot_no, spot_lat, spot_lng, spot_city, spot_img, spot_seq, spot_num, city_name);
          // 정보를 담을 배열 생성
          var jsonItem = JSON.parse(sessionStorage.getItem("Day" + set_day)); // Session에서 가져올 Key 값
          if(jsonItem != null){ // 객체가 있는 경우
             jsonItem['index' + spot_seq] = spot_arr;
             sessionStorage.setItem("Day"+set_day, JSON.stringify(jsonItem));
          } else {
               var jsonItem = new Object(); // 객체가 없을 경우 직접 생성해서 넣어줌
             jsonItem['index' + spot_seq] = spot_arr;
             sessionStorage.setItem("Day"+set_day, JSON.stringify(jsonItem));
          }
          
         $("#schedule_detail_box").append("" +  
         "<div class='day_spot_item' data='" + spot_seq + "' data-set_day='" + set_day + "' data-budget='' data-memo='' data-pl_type='0' data-img='"+spot_img+"' data-city='"+spot_city+"' data-seq='"+ spot_num +"' data-no='" + spot_no + "' data-pl_cat='301' data-latlng='" + spot_lat + "," + spot_lng + "' data-lat='" + spot_lat+ "' data-lng='" + spot_lng +"' data-ci='87' data-type='"+spot_type+"' id='spot" + spot_seq + "'>"
                 +   "<div class='item_ctrl_box' style='display: none'>"
                 +       "<div class='fl item_set_plan' title='메모&amp;예산' onclick='addbudget(&quot;"+spot_no+"&quot;,&quot;"+spot_name+"&quot;,&quot;"+spot_img+"&quot;,&quot;"+spot_content+"&quot;,&quot;"+spot_addr+"&quot;,&quot;"+spot_city+"&quot;,&quot;"+spot_type+"&quot;)'><img src='/twt/resources/images/plan/item_set_icon_a.png'></div>"
                 +      "<div class='fl btn_del' title='삭제'><img src='/twt/resources/images/plan/item_del_icon_a.png'></div>"
                 +      "<div class='clear'></div>"    
                 +   "</div>"
                 +   "<div class='img_box fl'>"
                 +      "<div class='spot_order_box'>" + spot_seq + "</div>"
                 +      "<img src='/twt/resources/images/plan/" + spot_city+ "/" + spot_img +"'>"
                 +      "<div style='position:absolute;top:35px;left:40px;width:22px;height:20px;>"
                 +         "<img src='/twt/resources/images/plan/list_memo_btn_off.png' class='memo_indi' style='width:22px;height:20px;'>"
                 +         "<!-- <i class='fas fa-pencil-alt'></i> -->"
                 +      "</div>"
                 +   "</div>"
                 +   "<div class='fl info_box'>"
                 +      "<div class='title'>" + spot_name + "</div>"
                 +      "<div class='sub'>" + spot_type+"</div>"
                 +      "<div class='sub inspot_day_info_box' style='color:#1a7ad9'></div>"
                 +   "</div>"
                 +   "<div class='clear'></div>"
                 + "</div>" +  
         "");
          
         // 추가된 스팟의 위도/경도 넣어주기
         addPath();
         
        // spot추가시 마커 이미지 변경
         addMarkerIcon(spot_num,spot_type);
   }
   
   // 스팟리스트 클릭시 map줌 & infobox
   function clickspot(mark,index,type){
      // info 정보 담아주기
      tooltipcontent = "<div class='tooltip_full_box' style='display:block;'>"+
      "<div class='tooltip_img fl'><img src='${pageContext.request.contextPath}/resources/images/plan/"+citycode[index]+"/"+imgname[index]+"'></div>"+
      "<div class='tooltip_info fl'>"+
      "<div class='tooltip_title'>"+spotname[index]+"</div>"+
      "<div class='tooltip_tag'>"+spottype[index]+"</div></div>"+
      "<div class='tooltip_detail_bottom_box'>"+
      "<div class='fl tooltip_detail_btn' onclick='detail_view_spot(&quot;"+spotname[index]+"&quot;,&quot;"+imgname[index]+"&quot;,&quot;"+spotcontent[index]+"&quot;,&quot;"+spotaddr[index]+"&quot;,&quot;"+citycode[index]+"&quot;,&quot;"+spottype[index]+"&quot;,&quot;"+spotcode[index]+"&quot;,&quot;"+lats[index]+"&quot;,&quot;"+lngs[index]+"&quot;,&quot;"+index+"&quot;)'>자세히 보기</div>"+
      "<div class='fr tooltip_add_inspot_btn' id='insert_spot' onclick='marker_to_inspot(&quot;"+spotname[index]+"&quot;,&quot;"+spottype[index]+"&quot;,&quot;"+spotcode[index]+"&quot;,&quot;"+lats[index]+"&quot;,&quot;"+lngs[index]+"&quot;,&quot;"+citycode[index]+"&quot;,&quot;"+imgname[index]+"&quot;,&quot;"+index+"&quot;,&quot;"+spotcontent[index]+"&quot;,&quot;"+spotaddr[index]+"&quot;)'>+ 일정에 추가</div></div></div>";
      
      // 클릭시 타입에 맞게 마커 이미지 변경 & infobox 나타내기
      if(type == "랜드마크"){

         // 클릭시 마커를 중심으로 확대
         map.setZoom(15);
             map.setCenter(mark.getPosition());
         
             // infobox show
         if(infowindow == null){
            infowindow = new google.maps.InfoWindow();
            infowindow.setContent(tooltipcontent);
            infowindow.open(map, mark);
         }else{
            infowindow.close();
            infowindow = new google.maps.InfoWindow();
            infowindow.setContent(tooltipcontent);
            infowindow.open(map, mark);
         }
      }else if(type == "식당가"){

         map.setZoom(15);
             map.setCenter(mark.getPosition());
         
         if(infowindow == null){
            infowindow = new google.maps.InfoWindow();
            infowindow.setContent(tooltipcontent);
            infowindow.open(map, mark);
         }else{
            infowindow.close();
            infowindow = new google.maps.InfoWindow();
            infowindow.setContent(tooltipcontent);
            infowindow.open(map, mark);
         }
         
      }else if(type == "쇼핑"){

         map.setZoom(15);
             map.setCenter(mark.getPosition());
         
         if(infowindow == null){
            infowindow = new google.maps.InfoWindow();
            infowindow.setContent(tooltipcontent);
            infowindow.open(map, mark);
         }else{
            infowindow.close();
            infowindow = new google.maps.InfoWindow();
            infowindow.setContent(tooltipcontent);
            infowindow.open(map, mark);
         }
      }
   }
   
   // 예산추가
   function addbudget(seq,name,img,con,add,citycd,type){   
      // 동일한 스팟번호의 저장된 메모&예산 가져오기
      var tmpbud;
      var tmpmemo;
   
      for(var i=0;i<$("#schedule_detail_box").children().length;i++){
         if($("#schedule_detail_box").children().eq(i).data("no") == seq){
            // tmpbud = $("#schedule_detail_box").children().eq(i).data("budget");
            tmpbud = $("#schedule_detail_box").children().eq(i).attr("data-budget");
            tmpmemo = $("#schedule_detail_box").children().eq(i).data("memo");
            
            
            if(tmpbud == null || tmpbud == "null"){
            	tmpbud = 0;
            }
            
         }
      }
      
      
      // 상세box띄우며 정보 뿌려주기
      detail_view_spot(name,img,con,add,citycd,type);
      $(".detail_view_full_box").attr("data-no",seq);
      $(".info_memo").css("display","block");
      $(".budget_input").val(tmpbud);
      $("#memo_input").val(tmpmemo);
   }
   
   // 도시 변경
   function changecity(citycode,citylat,citylng){
      
      // 변경된 도시의 센터 위치
      var cen = {lat: citylat, lng: citylng}; 
      
      // 센터 설정
      map.setZoom(12);
      map.setCenter(cen);
      
      // 전에 찍힌 마커들 삭제
      for(var i=0;i<marker.length;i++){
         marker[i].setMap(null);
      }
      marker = [];
      
   }
      
   /* script */
   $(document).ready(function(){
      // 로딩 시 map의 크기
      $("#map").css("width","746px");
      
      // 스팟 box 닫기
      $(document).on("click", "#on_city_close_btn", function() {
         $("#city_list").hide();
         $("#map").css("width","1111px"); // map크기 조정
      });
      
      //스팟 box 열기
      $(document).on("click", "#on_city_open_btn", function() {
         $("#city_list").show();
         $("#map").css("width","746px");
      });

      // 도시변경 box
      $(document).on("click", ".list_title_option_menu", function() {
         if($(".city_change_box").css("display") == "none"){
            $(".city_change_box").slideDown();
            $(".list_box_overlay").css("display","block");
            $(".list_title_option_menu").html("&nbsp;&nbsp;닫기&nbsp;<i class='fas fa-caret-up'></i>");
         }else{
            $(".city_change_box").slideUp();
            $(".list_box_overlay").css("display","none");
            $(".list_title_option_menu").html("&nbsp;도시 변경<i class='fas fa-caret-down'></i>");
         }
      });
      
      // 스팟 상세 box close
      $("#detail_close_btn").click(function(){
          $("#select_detail_view_spot").css("display","none");
      });
      
      // 일정에 여행지추가하기
      $(document).on("click", ".spot_to_inspot", function() {
          var set_day = $(".on").attr("data"); // Day
          var spot_name = $(this).parent().data("name"); // 여행지명
          var spot_type = $(this).parent().data("type"); // 여행지 타입
          var spot_no = $(this).parent().data("no"); // 순서
          var spot_lat = $(this).parent().data("lat"); // 위도
          var spot_lng = $(this).parent().data("lng"); // 경도
          var spot_city = $(this).parent().data("city"); // 도시 번호
          var spot_img = $(this).parent().data("img"); // 사진
          var spot_seq = $("#schedule_detail_box").children().length + 1;
          var spot_num = $(this).parent().data("seq"); // 인덱스 번호
          var city_name = $(".list_title").children("span").text();

          var spot_arr = new Array(spot_name, spot_type, spot_no, spot_lat, spot_lng, spot_city, spot_img, null, null, city_name);
          // 정보를 담을 배열 생성
          var jsonItem = JSON.parse(sessionStorage.getItem("Day" + set_day)); // Session에서 가져올 Key 값
          if(jsonItem != null){ // 객체가 있는 경우
             jsonItem['index' + spot_seq] = spot_arr;
             sessionStorage.setItem("Day"+set_day, JSON.stringify(jsonItem));
          } else {
             var jsonItem = new Object(); // 객체가 없을 경우 직접 생성해서 넣어줌
             jsonItem['index' + spot_seq] = spot_arr;
             sessionStorage.setItem("Day"+set_day, JSON.stringify(jsonItem));
          }
          
          $("#schedule_detail_box").append("" +  
          "<div class='day_spot_item' data='" + spot_seq + "' data-set_day='" + set_day + "' data-budget='' data-memo='' data-img='"+spot_img+"' data-city='"+spot_city+"' data-seq='"+ spot_num +"' data-no='" + spot_no + "' data-pl_cat='301' data-latlng='" + spot_lat + "," + spot_lng + "' data-lat='" + spot_lat+ "' data-lng='" + spot_lng +"' data-ci='87' data-type='"+spot_type+"' id='spot" + spot_seq + "'>"
                     +   "<div class='item_ctrl_box' style='display: none'>"
                   +      "<div class='fl item_set_plan' title='메모&amp;예산' onclick='addbudget(&quot;"+spot_no+"&quot;,&quot;"+spot_name+"&quot;,&quot;"+spot_img+"&quot;,&quot;"+spotcontent[spot_num]+"&quot;,&quot;"+spotaddr[spot_num]+"&quot;,&quot;"+spot_city+"&quot;,&quot;"+spot_type+"&quot;)'><img src='/twt/resources/images/plan/item_set_icon_a.png'></div>"
                     +      "<div class='fl btn_del' title='삭제'><img src='/twt/resources/images/plan/item_del_icon_a.png'></div>"
                     +      "<div class='clear'></div>" 
                     +      "</div>"
                     +      "<div class='img_box fl'>"
                     +      "<div class='spot_order_box'>" + spot_seq + "</div>"
                     +      "<img src='/twt/resources/images/plan/" + spot_city+ "/" + spot_img +"'>"
                     +      "<div style='position:absolute;top:35px;left:40px;width:22px;height:20px;>"
                     +      "<img src='/twt/resources/images/plan/list_memo_btn_off.png' class='memo_indi' style='width:22px;height:20px;'>"
                     +      "<!-- <i class='fas fa-pencil-alt'></i> -->"
                     +      "</div>"
                     +      "</div>"
                     +      "<div class='fl info_box'>"
                     +      "<div class='title'>" + spot_name + "</div>"
                     +      "<div class='sub'>" + spot_type+"</div>"
                     +      "<div class='sub inspot_day_info_box' style='color:#1a7ad9'></div>"
                     +   "</div>"
                     +   "<div class='clear'></div>"
                     + "</div>" +  
          "");

          // 추가된 스팟의 위도/경도 넣어주기
          addPath();
          // spot추가시 마커 이미지 변경
          addMarkerIcon(spot_num,spot_type);

       });
      
      // 스팟리스트에서 디테일box
      $(document).on("click", ".title", function() {
         var d_seq = $(this).parent().parent().data("seq");
         var d_citycd = $(this).parent().parent().data("city");
         
         detail_view_spot(spotname[d_seq],imgname[d_seq],spotcontent[d_seq],spotaddr[d_seq],d_citycd,spottype[d_seq]);
      });

      
      // 스팟리스트 클릭시 map줌 & infobox
      $(document).on("click", ".ui-draggable", function() {
      /* $(".day_spot_item").click(function(){ */
         var index = $(this).data("seq");
         var type = $(this).data("type");
         var mark = marker[index];
         clickspot(mark, index, type);
      });
         
      // 예산 숫자만 받기
      $(".budget_input").keyup(function(){
         $(this).val($(this).val().replace(/[^0-9]/g,""));
      });
      

      // 완료 modal 띄우기
      $("#plan_complete_btn").click(function(){
         $("#city_list").hide();
         $("#map").css("width","1111px");
         $(".et_modal").show();
         
         var day_list = new Object();

         for(var i = 1; i <= $(".day_menu").children().lengh; i++){
            day_list['day'+i] = sessionStorage.getItem("Day"+i);
         }
         
         $("#pn_dayList").val(day_list);
         
      });
      
      // 완료 modal 끄기
      $(".modal_btn_close").click(function(){
         $(".et_modal").hide();
         $("#city_list").show();
         $("#map").css("width","746px");
      });
      
      // modal 테마 선택시 이미지 변경
      $('.theme_radio').click(function(){
         // on class 모두 삭제
         $('.theme_radio').removeClass('on');
         // 선택한 테마의 이미지 변경
         $('.theme_radio').each(function(){
            $('img',this).attr('src',$('img',this).attr('src').replace('_on.gif','.gif'));
         });
         // 선택한 테마 on class 부여
         $(this).addClass('on');
         // 선택외 테마 이미지 변경
         $('img',this).attr('src',$('img',this).attr('src').replace('.gif','_on.gif'));
         
         var theme_val = $('.theme_radio.on').data("val");
         $("#pn_type").val(theme_val);
      });
   });
   
   google.maps.event.addDomListener(window, 'load', initialize);
   
</script>
<!-- 구글맵 API KEY -->
<script async defer
src="https://maps.googleapis.com/maps/api/js?v=weekly&key=AIzaSyCiDE5HBue4mflsdkcsGvSZrUeEooX8gWQ&callback=initMap&language=ko&region=KR">
</script>
<style type="text/css">
.list_box_overlay {
   width:365px;
   height:100%;
   position:absolute;
   z-index:8;
   background: url('${pageContext.request.contextPath}/resources/images/plan/bgb_70.png') repeat;
   display:none;
}
.city_item{
    padding-top: 5px;
    height: 70px !important;
}
.tooltip_info {
    width: 170px;
}
.tooltip_detail_bottom_box {
    margin-top: 90px;
}
.tooltip_detail_btn {
    width: 120px;
    background: #fc3c3c;
    border: solid 1px #fc3c3c;
}
.tooltip_add_inspot_btn {
    width: 120px;
    background: #ffba00;
    border: solid 1px #ffba00;
}
.gm-style .gm-style-iw-c {
    border-radius: 0px;
}
#select_detail_view_spot .spot_img img {
    width: 365px;
}
.detail_view_full_box {
    width: 365px;
}
.detail_view_full_box {
    width: 365px;
}
#detail_close_btn{background:url('${pageContext.request.contextPath}/resources/images/plan/info_close_btn.png');}
#selectcurr{
    border: solid #c8c8ca 1px;
    font-family: 'nanum';
    font-size: 12px;
    color: #808080;
}
#memo_save {
    display: block;
    width: 278px;
    margin-left: 10px;
}
/* The Modal (background) */
#modal_class {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
#modal_content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    /* padding: 20px; */
    border: 1px solid #888;
    width: 30%; /* Could be more or less, depending on screen size */                          
}
</style>
</head>
<body style="">

   <!-- @@헤더@@ -->
   <div id="header">
      <div style="width:100%;">
         <h1 class="logo fl" alt="로고@@">
            <a href="http://localhost:8090/twt/index.jsp"><span style="color:purple;">&nbsp;&nbsp;<i class="fas fa-plane fa-3x"></i></span></a>
         </h1>
         <div class="fl" style="width:363px;border-right:solid #ebebeb 1px;height:62px">
            <!-- 제목부분 호버 style걸어서 수정할수있게@@ -->
            <div class="fl" id="plan_title" style="background-color: rgb(255, 255, 255);">
            <%=request.getParameter("title") %>
            </div>
            <div class="clear"></div>
         </div>
         <div class="fl" style="width:365px;height:62px;line-height:62px;border-right:solid #ebebeb 1px;text-align:center;color: #555555;font-size:16px;font-weight:bold;" id="plan_total_budget">KRW <span id="total">0</span>원</div>
            <div class="fl" id="gnb_ci_name"></div>
            <div class="fr gnb_box">
               <div class="fr" style="margin-top:9px;margin-right:20px;">
                  <a href="${pageContext.request.contextPath}/index.jsp">
                  <div class="fl" id="plan_out_btn" style="display: block;background: #fc3c3c;border: solid 1px #fc3c3c;">닫기</div>
                  </a>
                  <div class="fl" id="plan_complete_btn" onclick="plan_complete()" style="display: block;background: #ffba00;border: solid 1px #ffba00;">완료</div>
                  <div class="clear"></div>
               </div>
               <div class="clear"></div>
            </div>
      </div>
      <div class="clear"></div>
   </div> <!-- @@header end@@ -->
   
   
   <!-- 날짜 수정 모달 -->
   <div id="overlay_day_edit">
      <div class="ov_day_edit_full">
         <div style="width:100%;height:50px;border:solid #374854 1px;padding-top:7px;">
            <div class="fr" style="width:45px;height:30px;background:#ff9320;border:solid #f7870f 1px;color:#fff;font-size:12px;line-height:30px;text-align:center;margin-right:10px;cursor:pointer;" onclick="day_edit_com()">완료</div>
            <div class="clear"></div>
         </div>
         <div style="width:100%;height:50px;border:solid #374854 1px;font-size:13px;color:#fff;line-height:50px;text-align:center;cursor:pointer;" id="date_pick_btn">
            <span class="start_date"><%=request.getParameter("schedule_date") %></span>
            <input type="hidden" id="datepick_input" value="<%=request.getParameter("schedule_date") %>"/><!-- datepicker  -->
            <%-- <img src="${pageContext.request.contextPath}/resources/images/plan/plan_detail/pn_cal_edit_btn2.png" style="vertical-align:middle;margin-left:10px; cursor: pointer;"> --%>
         </div>             
         <!-- datePicker end -->
         
         <ul id="cat_menu_edit_box" style="height: 598px;">
         </ul>
      </div>   
   </div> <!-- 날짜 수정 모달 end -->

   <!-- @@ 바디 @@ -->
   <div id="full_wrap" style="width: 100%; height: 648px;">
      <div class="fl left_full_box">
         <div class="fl">
            <ul id="pn_title_box" data-member_srl="1213145">
               <li data="pn_date">
                  <div class="full_date_info fl"></div>
                  <div class="fl day_edit_start_btn" style="padding-left:8px;" onclick="day_edit_start()"><i class="fas fa-cog"></i>&nbsp;EDIT</div>
                  <div class="clear"></div>
               </li>
            </ul>
            <ul id="cat_menu" data="87" data-member_srl="1213145" data-year="2020" style="max-height: 478px;">
          <!-- <li data="1" data-date="01.31" data-day_week="5" data-f_ci="87" data-f_lat="18.79906428" data-f_lng="98.99514161" class="day_menu on" original-title="치앙마이">
                  <div class="fl cat_date_left_box">
                     <div class="cat_left_day">DAY1</div>
                     <div class="cat_left_date"></div>
                  </div>
                  <div class="fl cat_date_right_box">
                     <div class="cat_right_weekday"></div>
                     <div class="cat_right_city"></div>
                  </div>
                  <div class="clear"></div>
               </li> -->
            </ul>
            <ul id="cat_add_box" style="width: 160px; background: rgb(32, 51, 65); color: rgb(255, 255, 255); height: 100vh;">
               <li style="padding-top:15px;">
                  <div style="width:124px;height:32px;color:white;line-height:32px;border:solid 1px #fff;text-align:center;margin:0 auto;cursor:pointer;" id="add_plan_day"> DAY 추가</div>
               </li>
            </ul>
            <!-- <ul id="pn_date_controll_box" style="height:100vh;" data="" data-member_srl="1213145">
               <li data="con_date">      
                  <div style="text-align:center;border-top:solid #fff 1px;margin-top:10px;padding-top:15px;width:100%;">
                     <div style="margin:0 auto;text-align:center;font-size:15px;" onclick="$('#guide_overlay').show();">
                        <i class="far fa-bookmark"></i>&nbsp;이용방법</div>
                  </div>
               </li>
            </ul> -->
         </div>
          <div class="fl" id="schedule_full_box" style="width:265px" data="0">
              <div class="title_box" style="background: #393E46;">
                   <div id="schedule_detail_title" data-date="01-31" style="display: block;">
                        <div class="fl schedule_detail_title_text" style="width:245px;padding-left:10px;font-size:15px;">
                           <div class="fl">DAY1 <span style="color:white">|</span> 01.31(금요일) </div>
                           <%-- <div class="fl day_reset_btn" style="background:url('<%=request.getContextPath()%>/Plan/images/_day_reset_icon.png') no-repeat;" onclick="del_plan_inspot_day_all()"></div> --%>
                           <span>&nbsp;<i class="fas fa-redo-alt" id="schedule_clear" style="cursor:pointer"></i></span> <!-- 초기화 -->
                           <div class="clear"></div>
                        </div>
                      <div class="clear"></div>
                   </div>
              </div>
      
              <!--//(s)스케쥴 디테일 리스트-->
              <!-- @@@수정 호버 시 아이콘 나오게@@@ -->
              <div id="schedule_detail_box" class="connectedSortable ui-sortable" style="height: 548px; display: block;">              
              </div>
              <!--//(e)스케쥴 디테일 리스트-->
            <div class="inspot_add_box" style="height:100vh;">
               <div class="inspot_set_box">
                  <div class="clear"></div>
               </div>
            </div>
          </div>
         
         <div class="clear"></div>
      </div>
   
      <div id="right_full_box" class="fl" style="position: absolute; left: 425px; top: 66px; width: 1111px;">
         <div id="on_city_open_btn" style="background:url('${pageContext.request.contextPath}/resources/images/plan/city_open_btn.png');"></div>
         <!-- 스팟 list box -->
              <div id="city_list" data="87" style="display: block; bottom:2px;">
               <div class="list_title" style="background: #fc3c3c;"><span>${cityvo.city_Name}</span>
                  <div class="list_title_option_menu" data-is_open="off">&nbsp;도시 변경<i class="fas fa-caret-down"></i></div>
               </div>
                <div id="on_city_close_btn" style="background:url('${pageContext.request.contextPath}/resources/images/plan/city_close_btn.png');"></div>
                <div class="clear"></div>
                <div class="city_change_box">
                   <!-- <div class="city_text_search_box"><input type="text" class="city_text_search_input" id="city_search_key"></div>
                 <div class="city_search" style="display: none;"></div> -->
                 <!-- 도시 변경  -->
                     <div class="city_items" data="87" style="height:100%;">
                        <div class="city_item" data="87" data-ci_name="${cityvo.city_Name}" data-lat="${cityvo.city_Lati}" data-lng="${cityvo.city_Long}" data-code="${cityvo.city_Code}">
                           <div class="fl ci_img"><img src="${pageContext.request.contextPath}/resources/images/plan/city/${cityvo.city_Img}"></div>
                           <div class="fl">${cityvo.city_Name},&nbsp;<span>태국</span></div>
                           <div class="clear"></div>
                        </div>
                        <div class="clear"></div>
                        <div style="width:100%;height:0px;border-bottom:solid 1px #cacaca;"></div>
                        <div class="city_item_title">태국 내 다른 도시</div>
                        <c:forEach items="${allCity}" var="city">
                           <c:if test="${city.city_Code ne citycode}">
                              <div class="clear"></div>
                              <div class="city_item" data="" data-ci_name="${city.city_Name}" data-lat="${city.city_Lati}" data-lng="${city.city_Long}" data-ss_id="null" data-code="${city.city_Code}">
                                 <div class="fl ci_img"><img src="${pageContext.request.contextPath}/resources/images/plan/city/${city.city_Img}"></div>
                                 <div class="fl">${city.city_Name},&nbsp;<span>태국</span></div>
                                 <div class="clear"></div>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div> 
                     <!-- 도시 변경 end -->
               </div>
                <div class="list_search_full_box">
                   <div class="list_search_box">
                  <input type="text" id="input_search" placeholder="장소 검색">
                  <div style="margin-left:20px;margin-top:5px;">
                     <span id="type_city" type="radio" class="radio on" data-val="city" data-on="on" data-name="search_type" style="color:#808080">
                     <span class="et-radio" style="padding-top: 4px;">&nbsp;<!-- 수정@@ --><i class="far fa-check-circle check"></i></span>
                     <span class="et-radio_txt">도시내 검색&nbsp;&nbsp;&nbsp;&nbsp;</span></span>
                     <span id="type_total" type="radio" class="radio" data-val="total" data-name="search_type" style="color:#808080" data-on="off">
                     <span class="et-radio" style="padding-top: 4px;">&nbsp;<!-- 수정@@ --><i class="far fa-circle check"></i></span><span class="et-radio_txt">전체검색</span></span>
                     <input type="hidden" name="search_type" id="search_type" class="news" value="city">
                  </div>
               </div>
                    <div class="list_category_box" style="border-bottom: solid #dadada 1px; padding-left: 37px;">
                       <div class="list_cat_item fl on" data="1" data-type="total"><img src="${pageContext.request.contextPath}/resources/images/plan/ic_000_c.png"></div>
                       <div class="list_cat_item fl" data="2" data-type="랜드마크"><img src="${pageContext.request.contextPath}/resources/images/plan/ic_300_a.png"></div>
                        <div class="list_cat_item fl" data="3" data-type="식당가"><img src="${pageContext.request.contextPath}/resources/images/plan/ic_200_a.png"></div>
                        <div class="list_cat_item fl" data="4" data-type="쇼핑"><img src="${pageContext.request.contextPath}/resources/images/plan/ic_400_a.png"></div>
                  <div class="list_cat_item fl" data="1" data-type="호텔" style="display: none;"><img src="${pageContext.request.contextPath}/resources/images/plan/ic_100_a.png"></div> 
                        <div class="clear"></div>             
                    </div>
                  </div>
                <div class="list_box_overlay"></div>
                <!-- 스팟 리스트 -->
                <div class="list_box connectedSortable" style="height: 441px;">
                <c:set var="count" value="0"></c:set>
                <c:forEach items="${allSpot}" var="spot" varStatus="status">
                   <div class="day_spot_item ui-draggable" id="spot_${status.index}" data-seq="${status.index}" data-city="${spot.city_Code}" data-type="${spot.tp_Type}" data-name="${spot.tp_Name}" data-img="${spot.tp_Img}" data-addr="${spot.tp_Addr}" data-con="${spot.tp_Content}" data-set_day="0" data-rel_srl="4740" data-pl_type="0" data-no="${spot.tp_Code}" data-lat="${spot.tp_Lati}" data-lng="${spot.tp_Long}" data-pl_cat="301" data-ci="87" data-img="${spot.tp_Img}">
                      <div class="img_box fl"><img src="${pageContext.request.contextPath}/resources/images/plan/${spot.city_Code}/${spot.tp_Img}"></div>
                      <div class="fl info_box">
                         <div class="title">${spot.tp_Name}</div>
                         <div class="sub">${spot.tp_Type}</div>
                         <div class="sub">
                            <!-- <div class="tooltip_clip_cnt fl" style="padding-left:0px;"><i class="fas fa-paperclip"></i>252</div> -->
                            <div class="clear"></div>
                         </div>
                         <!-- @@ 수정 필요 @@ -->
                         <div class="sub include_pn_day" style="color:#fc3c3c"></div>
                      </div>
                      <div class="spot_to_inspot"><img src="${pageContext.request.contextPath}/resources/images/plan/spot_to_inspot_a.png"></div>
                      <div class="clear"></div>
                   </div>
                   <c:set var="count" value="${count+1}"></c:set>
                </c:forEach>
                <div class="aa" style="display:none;" data-count="${count}"></div>
         </div>
       </div><!-- 스팟 리스트 end -->


         <!-- map -->
         <div id="map" class="fr" style="height: 657px; position: relative; width: 1111px; overflow: hidden; bottom:2px;"></div>
         
         
              <!-- @@@수정@@@스팟 상세정보@@@@@ -->
              <div id="select_detail_view_spot" data="4740"  data-cat="301" data-only_clip="0" class="visible" style="left: 0px; display: none;">
                 <div class="detail_view_full_box" data-name="" data-type="" data-no="" data-lat="" data-lng="" data-city="" data-img="" data-seq="">
                    <!-- <div id="detail_spot_to_inspot" data-ci="87" data-rel_srl="4740" data-pl_type="0" style="background: #ffba00;border: solid 1px #ffba00">+일정에 추가</div> -->
                    <div id="detail_close_btn"></div>
                    <a class="spot_title" href="" target="_blank">스팟명</a>
                    <div class="spot_img">
                       <div class="detail_img_overlay"></div>
                       <img id="spot_img" src="">
                       <div class="spot_cnt_box"></div>
                    </div>
                    <div id="detail_content" style="height: 416px;">
                       <div class="info_first">
                          <div class="in_full_box">
                             <div class="info_memo" style="display: none;">
                                <div style="font-size:15px;color:#363636;font-weight:bold;text-align:left;padding-bottom:10px;padding-left:8px;">예산</div>
                                <div style="padding-left:10px;padding-bottom:15px;">
                                <div id="budget_currency_select_list">
                                   <!-- <div data="KRW">KRW</div>
                                   <div data="THB">THB</div> -->
                                </div>
                                <div id="budget_currency" data="KRW" class="fl">
                                <!-- KRW -->
                                   <select id="selectcurr" style="height: 31px;">
                                      <option>KRW</option>
                                      <option>THB</option>
                                   </select>
                                </div>
                                <div class="fl"><input type="text" class="budget_input" style="width: 227px;" placeholder="0" onblur="budgetVal()"></div>
                                <!-- <div class="fl"><input type="text" class="budget_input" style="width: 227px;" placeholder="0" onkeyup="return budgetVal(this)"></div> -->
                                <div class="clear"></div>
                                </div>
                                <div style="font-size:15px;color:#363636;font-weight:bold;text-align:left;padding-bottom:10px;padding-left:8px;">메모</div>
                                <textarea id="memo_input" style="resize:none; width: 257px; height: 70px;" data-type="" data-set_day="0" data-set_order="0" data-pl_type="0"></textarea>
                                <div id="memo_save">저장</div>
                             </div>
                          </div>
                          <div class="in_full_box">
                          <div id="spot_con" style="line-height:22px;font-size:11px;color:#808080;padding-bottom:20px;font-size:13px;">설명</div>
                             <div class="information">
                                <div style="width:100%;padding:15px;border:solid #d4d4d4 1px;">
                                   <!-- <i class="fas fa-map"></i> -->
                                   <div id="sub_addr" style="color:#808080;font-size:13px;padding-left:20px;line-height:16px;padding-bottom:10px;">주소</div>
                                   <div class="sub_title fl">카테고리</div>
                                   <div id="sub_info" class="sub_info fl">카테고리 상세</div>
                                   <div class="clear"></div>
                                   <div class="clear"></div>
                                   <div id="fq_attr_box"></div>
                                   <div id="fq_open_box"></div>
                                   <div class="clear"></div>
                                </div>
                                <div class="sub_desc"></div>
                             </div>
                             <div class="clear"></div>
                          </div>
                       </div>
                       <div class="info_second">
                          <div class="info_section_line"></div>
                       </div>
                    </div>
                    <div class="clear"></div>
                 </div>
                 <div class="detail_view_bottom"></div>
              </div>
           
      </div><!-- right_full_box end@@@@ -->
      
      <!-- 완료 modal -->
      <div class="et_modal" id="modal_class" style="overflow:hidden; display:none;">
         <!-- <div class="et_modal_layer"> -->
            <!-- modal content -->
            <div class="modal_box" id="modal_content" style="width: 460px; height: 596px; margin-top: 95px; top: 50%; overflow: hidden; display: block;">
               <form:form method="post" id="form" enctype="multipart/form-data" action="fileUpload.do">
               <div class="title_box">
                  <!--일정정보 수정-->
                  <span id="this_modal_title">일정만들기 완료</span>
                  <img src="${pageContext.request.contextPath}/resources/images/plan/modal/modal_close_btn.gif" class="modal_btn_close" alt="" onclick="et_modal_close();">
               </div>
               <div class="modal_content">
                  <input type="hidden" name="plan_seq" id="plan_seq" value="1213145">
                  <input type="hidden" name="pn_dayList" id="pn_dayList" value="">
                  <table class="create_table" width="100%" cellpadding="0" cellspacing="0">
                     <colgroup>
                        <col width="85"></col>
                     </colgroup>
                     <tbody>
                        <tr>
                           <th><!--여행 제목-->여행 제목            </th>
                           <td>
                              <input type="text" name="pn_title" id="pn_title" class="modal_input" value="<%=request.getParameter("title")%>">
                           </td>
                        </tr>
                        <tr>
                           <td colspan="2" class="blank_td">&nbsp;</td>
                        </tr>
                        <tr>
                           <th>
                              <!--설명-->설명            </th>
                           <td>
                              <textarea class="modal_textarea" name="pn_desc" id="pn_desc" style="resize:none;" placeholder="이번 여행에 관한 간략한 소개글을 작성해 보세요             (선택사항)"></textarea>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="2" class="blank_td">&nbsp;</td>
                        </tr>
                        <tr>
                           <th>
                              <!--출발일-->출발일            </th>
                           <td>
                              <input type="text" name="pn_day" id="start_day" value="<%=request.getParameter("schedule_date")%>">
                           </td>
                        </tr>
                        <tr>
                           <td colspan="2" class="blank_td">&nbsp;</td>
                        </tr>
                        <tr>
                           <th valign="top" style="padding-top:5px;">
                           <!--여행 테마-->여행 테마            </th>
                           <td>
                              <input type="hidden" name="pn_type" id="pn_type">
                              <div class="theme_radio" data-val="나홀로">
                                 <div class="r_inner_box">
                                    <img src="${pageContext.request.contextPath}/resources/images/plan/modal/theme_alone.gif" alt="">
                                    나홀로                  </div>
                              </div>
                              <div class="theme_radio" data-val="커플">
                                 <div class="r_inner_box">
                                    <img src="${pageContext.request.contextPath}/resources/images/plan/modal/theme_couple.gif" alt="">
                                    커플                  </div>
                              </div>
                              <div class="theme_radio" data-val="친구">
                                 <div class="r_inner_box">
                                    <img src="${pageContext.request.contextPath}/resources/images/plan/modal/theme_frends.gif" alt="">
                                    친구                  </div>
                              </div>
                              <div class="clear"></div>
                              <div class="theme_radio" data-val="가족">
                                 <div class="r_inner_box">
                                    <img src="${pageContext.request.contextPath}/resources/images/plan/modal/theme_family.gif" alt="">
                                    가족                  </div>
                              </div>
                              <div class="theme_radio" data-val="단체">
                                 <div class="r_inner_box">
                                    <img src="${pageContext.request.contextPath}/resources/images/plan/modal/theme_people.gif" alt="">
                                    단체                  </div>
                              </div>
                              <div class="theme_radio" data-val="비즈니스">
                                 <div class="r_inner_box">
                                    <img src="${pageContext.request.contextPath}/resources/images/plan/modal/theme_business.gif" alt="">
                                    비즈니스                  </div>
                              </div>
                           </td>
                        </tr>
                        <tr>
                           <th>여행 인원</th>
                           <td style="height:10px; padding-bottom:9px;"><input name="pn_person" style="width:40px;" type="number" min="1">명</td>
                        </tr>
                        <tr>
                           <th>썸네일 등록</th>
                           <td><input type="file" name="file" id="file"></td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div class="modal_footer">
                  <div class="fr" style="margin-right:10px;">
                     <!-- <input type="button" class="m_btn_submit" id="form_submit" value="완료" onclick="insertPlan();"></div> -->
                     <input type="button" class="m_btn_submit" id="form_submit" value="완료"></div>
                     <input type="hidden" name="file_name" id="file_name"/>
                  <div class="clear"></div>
               </div>
               </form:form>
            </div><!-- modal content end -->
         <!-- </div> -->
      </div><!-- modal end -->

      
   </div><!-- full_wrap end -->
   

<script src="${pageContext.request.contextPath}/resources/js/plan/plan_detail.js?version=1.5"></script>
</body>

</html>
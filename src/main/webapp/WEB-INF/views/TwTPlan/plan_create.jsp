<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
   <!-- 아이콘 -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
   
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
   
   <!-- css -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/default_ko.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/reset.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/default.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/gnb.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/date_picker.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/plan_create_css.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/plan_create_modal.css">
   <!-- // jQuery UI CSS파일 --> 
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
   
   <script async="" src="//www.google-analytics.com/analytics.js"></script>
   <script>
      var et_lang = 'ko';
   </script>
   
   <script type="text/javascript">
      lang = {};
      function lang_uri(){
         return '/ko';
      }
   </script>
   <!-- <script type="text/javascript" src="/jslang?lang=ko&amp;lang_file=commonjs"></script> -->
    <link rel="image_src" href="https://www.earthtory.com/res/img/earthtory_logo_to_sns.png">

<style type="text/css">
.labels{
  color:white;
  background-color:red;
  font-size:20px;
  text-align:center;width:80px;height:80px;line-height:80px;border-radius:100%;white-space:nowrap;
}
</style>

<!-- google map script -->
<script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=geometry,places&ext=.js"></script>
<script src="https://cdn.rawgit.com/googlemaps/v3-utility-library/master/markerwithlabel/src/markerwithlabel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plan/MarkerWithLabel.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
// 전역 변수 선언
var marker; // 마커
var myIcon; // 마커 아이콘
var content = new Array(); // 도시명
var locations = new Array(); // 도시 위도/경도
var markers = new Array(); // 마커 배열
var citycodes = new Array(); //도시 코드

   // map 추가
   function initMap() {
      //방콕위치 위도/경도
      var bangkok = {lat: 13.755161, lng: 100.502371}; 
      
      // 방콕을 센터로 맵 생성
      var map = new google.maps.Map( //지도 객체 생성
         document.getElementById('map'), {zoom: 6, center: bangkok}); //기본 줌,시작 센터 설정
      
      // DB 불러와서 위치 위도/경도, 도시코드 담기
      for(var i=0;i<4;i++){
    	  locations[i] = {"position" : new google.maps.LatLng($("#city_"+i).attr("data-lat"), $("#city_"+i).attr("data-lng"))};
		  citycodes[i] = $("#city_"+i).attr("data-no");
      }
          
      // 마커 아이콘 생성
      myIcon = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/marker.png",null,null,null,new google.maps.Size(50,45));
      
      // 마커 정보(도시명)담기
      for(var i=0;i<locations.length;i++){
         content[i] = $("#city_"+i).attr("data-ci_name");
      }
      
      // 도시 마커찍기
      for (var i=0;i<locations.length;i++) {
           marker = new google.maps.Marker({
               position: locations[i].position,
               map: map,
               icon: myIcon,
               title: content[i]
             });
           
           //생성된 마커를 마커배열에 추가
           markers.push(marker);
           //marker별 이벤트 적용
           markerListener(markers[i],i);
      }
      
      console.log("마커 배열 : " + markers);
      
      // 마커와 함께 라벨찍기 (안됨)
      /* for(var i=0;i<locations.length;i++){
         marker = new MarkerWithLabel({
            position: locations[i].position,
            map: map,
            icon: myIcon,
            title: content[i],
            labelContent: content[i],
             labelAnchor: new google.maps.Point(-11, 30),
             labelClass: "labels", // the CSS class for the label
             labelStyle: {opacity: 0.75}
         });
         
         markers.push(marker);
      } */
        
      console.log(markers);
       
   } /* init end */
   
	// 마커 클릭 이벤트 실행 / select detail box 띄우기  
	function markerListener(mark, index){
		// 매개변수 마커에 클릭이벤트 적용
		google.maps.event.addListener(mark, 'click', function() {
			
			// 클릭시 마커에 animation이 있으면
			if (mark.getAnimation() != null) {
				mark.setAnimation(null);
				$('#select_detail_view_city').hide();
			} else {
			// 클릭시 마커에 animation이 없으면
				mark.setAnimation(google.maps.Animation.BOUNCE);
				
				// 클릭외 나머지 마커들 animation 삭제
				for(var i=0;i<4;i++){ 
					if(i != index){
						markers[i].setAnimation(null);
					}
				}
				$('#select_detail_view_city').show();
				$(".cityname").html(content[index]);
				$("input[name=citycode]").val(citycodes[index]);
			}
		});
	}
   
   $(document).ready(function(){
	   // 선택된 도시 삭제 & 마커 animation 삭제
      $(".fa-times-circle").click(function(){ // x표시 누르면 select detail box 사라짐, bounce 이벤트 삭제
         $('#select_detail_view_city').hide();
         for(var i=0;i<locations.length;i++){
            markers[i].setAnimation(null);
         }
      });
	   
	  // 왼쪽 도시 box에서 선택시 마커 움직임(안됨)
      /* $(".item").on("click", function() {
    	  var index = $(this).attr("data-index");
    	  alert("index?" + index);
    	  console.log("선택 마커?" + markers[0].title);
          markerListener(markers[index],index);
      }); */
   });
   
   google.maps.event.addDomListener(window, 'load', initialize);

</script>
<!-- 구글맵 API KEY -->
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiDE5HBue4mflsdkcsGvSZrUeEooX8gWQ&callback=initMap&language=ko&region=KR">
</script>
</head>
<body style="">

   <!-- @@@@@@@헤더@@@@@@@@  -->
   <div id="header">
      <div class="wrap" style="width:100%;padding:0px 10px;">
         <h1 class="logo fl" alt="로고@@">
            <a href="${pageContext.request.contextPath}/index.jsp"><span style="color:#C2BAFF"><i class="fas fa-plane-departure fa-3x"></i></span></a>
         </h1>
         <div class="fl" id="gnb_plan_create_title">1.도시선택&nbsp;&nbsp;→&nbsp;&nbsp;2.상세 일정 만들기</div>
         <div class="fl" id="gnb_ci_name"></div>
         <div class="fr gnb_box">
            <div class="fl gnb_search_box"></div>
            <a href="${pageContext.request.contextPath}/index.jsp"><div class="fr gnb_plan_create_close_btn" style="background: #ffba00;border: solid 1px #ffba00;">닫기</div></a>
            <div class="clear"></div>
         </div>
      </div>
      <div class="clear"></div>
      <div class="recent_action ra_absolute"></div>

   <!-- @@@바디@@@ -->
   <div id="full_wrap" style="width: 100%; height: 658px;">
      <div class="fl left_full_box">
         <ul class="fl" id="cat_menu" data="" data-member_srl="1213145">
            <li data="as" data-val="아시아" class="on">
               <span style="position:relative; top:8px;"><i class="fas fa-globe-asia fa-3x"></i><br>아시아</span>
            </li>
         </ul>
         
          <div class="fl" id="schedule_full_box" style="width:265px" data="0">
              <div class="title_box">
                   <div id="country_list_title" style="display: none;">
                      <div class="fl ct_title">아시아</div>
                      <div class="clear"></div>
                   </div>
                   <div id="city_list_title" style="display: block;">
                      <div class="back_btn fl"></div>
                      <div class="fl cu_title" style="width:230px;padding-left:10px;font-size:15px;">태국</div>
                      <div class="clear"></div>
                   </div>
              </div>
            
            <!-- 지역 선택 -->
              <div id="city_list_box" style="height: 100vh;">
                 <c:forEach items="${res}" var="city" varStatus="status">
	                 <div class="item" id="city_${status.index}" data-index="${status.index}" data-no="${city.city_Code}" data="86" data-ci_name="${city.city_Name}" data-lat="${city.city_Lati}" data-lng="${city.city_Long}">
	                    <div class="img_box fl"><img src="${pageContext.request.contextPath}/resources/images/plan/city/${city.city_Img}"></div>
	                    <div class="info_box fl">
	                       <div class="info_title">${city.city_Name}</div>
	                       <div class="info_sub_title">${city.city_Eng}</div>
	                      </div>
	                      <div class="spot_to_inspot"><img src="${pageContext.request.contextPath}/resources/images/plan/spot_to_inspot_a.png"></div>
	                      <div class="clear"></div>
	                  </div>
                  </c:forEach>
            </div>
          </div>
         <div class="clear"></div>
      </div>
   
      <div id="right_full_box" class="fl" style="position:absolute;left:336px;top:62px;">
              
         <!-- 지도 설정 @@ -->
         <div id="map" class="fl" style="height: 659px; position: relative; width: 1200px; overflow: hidden; left:0px"></div>
           
           <!-- 일정 정보 설정 -->
              <div id="select_detail_view_city" data="0">
              <div class="city_title">
               <div class="ci_title_name fl">여행도시</div>
               <div class="pn_date_box fr" id="date_pick_btn" data="0">
                  <!-- <div class="pn_date_info fl">출발일</div>
                  <div class="pn_date_icon fr"><i class="fas fa-calendar-alt"></i></div> -->
                  <div class="clear"></div>
                  <form action="planDetail.do" method="get" id="createform">
                     <input type="hidden" id="schedule_date" name="schedule_date" value=""/> <!-- 날짜  -->
                     <input type="hidden" id="city_no" name="citycode" value=""/> <!-- 도시코드 -->
                     <input type="hidden" id="title" name="title" value=""/> <!-- 제목 -->
                  </form>
               </div>
               <div class="clear"></div>
            </div>
            <!-- 선택된 지역 정보 표시 -->
              <div id="selected_cities" data="0" style="max-height: 458px;">
                 <div class="s_cities" data-ci="86" data-day="2" data-lat="13.75222220" data-lng="100.49388890">
                    <div class="city_info">
                       <div class="del_city_btn fl" style="margin:0px 10px;">
                          <i class="fas fa-times-circle"></i>
                       </div>
                       <div class="fl cityname"></div> <!-- 표시되는 지역 명 -->
                    </div>
                 </div>
              </div>
              <!-- 상세일정만들기 버튼 -->
              <div class="detail_city_bottom">
               <div class="detail_plan_go_btn" id="createplan-modal">상세 일정 만들기</div>
              </div>
                </div><!-- 일정 정보 end -->
         </div><!-- right box end -->
         
      <!-- 모달 정보 설정 -->
      <div id="createmodal" class="createmodal">
         <!-- 모달 내용-->
         <div class="modal-content" style="width:460px; height:240px; padding-top: 0px;">
            <div class="title_box">
               	출발일 선택
               <img src="${pageContext.request.contextPath}/resources/images/plan/modal/modal_close_btn.gif" class="modal_btn_close">
            </div>
            <table class="create-table" width="100%" cellpadding="0" cellspacing="0" style="margin-top: 20px;">
               <colgroup><col width="85"><col></colgroup>
               <tbody>
                  <tr>
                     <th>여행제목       </th>
                     <td>
                        <div id="modal-input" class="input_outline">
                           <input type="text" id="modal-name" class="modal_input pn_title" value="" placeholder="여행제목을 입력해주세요"/><br/>
                           <!-- <div class="title-cnt">0/20</div> -->
                           <div class="clear"></div>
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2"  style="height: 19px">&nbsp;</td>
                  </tr>
                  <tr>
                     <th>여행출발일       </th>
                     <td>
                        <input type="text" id="testDatepicker" class="modal_input" style="width: 45%;"/>
                     </td>
                  </tr>
               </tbody>
            </table>
            <div style="border-top:1px solid #b3b3b3;padding-top: 10px;margin-top: 10px;">
            	<input type="submit" class="m_btn_submit" id="submitDetail" value="완료" style="float: right;">
            </div>
         </div>
      </div> <!-- 모달 end -->
   		
         <div class="clear"></div>
      </div>
   </div>

<!-- // jQuery 기본 js파일-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>     
<script src="${pageContext.request.contextPath}/resources/js/plan/plan_create.js"></script> 
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
</body>
</html>
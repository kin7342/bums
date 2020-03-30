<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- 	<meta name="description" content="20만개의 여행일정, 나만의 여행일정 계획하기">
	<meta name="keywords" content="여행일정, 여행일정 만들기, 여행일정표, 여행 가이드북, 여행 동선, 여행 루트, 일정 추천, 싱가포르 여행일정, 오사카 여행일정, 홍콩 여행일정, 유럽 여행일정, 뉴욕 여행일정, 타이베이 여행일정">
	<meta property="fb:app_id" content="334344006612913">
	<meta property="og:title" content="여행 플래너 어스토리">
	<meta property="og:type" content="article">
	<meta property="og:url" content="https://www.earthtory.com/ko/plan/create">
	<meta property="og:description" content="여행 플래너 사이트 어스토리에서 제공하는 국내외 여행을 위한 관광명소, 맛집, 쇼핑장소, 밤문화, 호텔, 항공권 정보를 통해 나만의 여행일정을 짜보세요.">
	<meta property="og:image" content="https://www.earthtory.com/res/img/earthtory_logo_to_sns.png"> -->
			
	<link rel="shortcut icon" href="/res/earthtory.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/default_ko.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/gnb.css">
	
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

    <link rel="canonical" href="https://www.earthtory.com/ko/plan/create">
      	
	<link rel="home" href="www.earthtory.com">

	<link rel="alternate" href="https://www.earthtory.com/plan/create" hreflang="x-default" title="English">
	<link rel="alternate" href="https://www.earthtory.com/ja/plan/create" hreflang="ja-jp" title="日本語">
	<link rel="alternate" href="https://www.earthtory.com/ko/plan/create" hreflang="ko-kr" title="한국어">

	<meta name="google-site-verification" content="MwgpAlNbsXRZEln-QQP8Jra-Aj8cTKcCtDd3L_StvTc">
	<meta name="naver-site-verification" content="48a2af847268bfd79153f73690ad01b35cb1593a">
	<!-- <script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/39/9/intl/ko_ALL/common.js"></script>
	<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/39/9/intl/ko_ALL/util.js"></script>
	<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/39/9/intl/ko_ALL/marker.js"></script>
	<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/39/9/intl/ko_ALL/map.js"></script>
	<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/39/9/intl/ko_ALL/onion.js"></script>
	<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/39/9/intl/ko_ALL/overlay.js"></script>
	<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/39/9/intl/ko_ALL/controls.js"></script> -->
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
// 전역 변수 선언
var marker;
var myIcon;
var content = new Array();
var locations = new Array();
var markers = new Array();

	// map 추가
	function initMap() {
		var bangkok = {lat: 13.755161, lng: 100.502371}; //방콕위치 위도/경도
		// 방콕을 센터로 맵 생성
		var map = new google.maps.Map( //지도 객체 생성
			document.getElementById('map'), {zoom: 6, center: bangkok}); //기본 줌,시작 센터 설정
		
		// 위치 배열 되는 코드
		// 임의로
 		/* var locations = [
	        {
	          position: new google.maps.LatLng(13.757691, 100.505969)
	        }, {
	          position: new google.maps.LatLng(18.795185, 98.9598123)
	        }, {
	          position: new google.maps.LatLng(12.9230812, 100.8832977)
	        }, {
	          position: new google.maps.LatLng(7.9558174, 98.3420414)
	        }
       	]; */
       	
       	// DB 불러와서 위치 위도/경도 담기
       	for(var i=0;i<4;i++){
			locations[i] = {"position" : new google.maps.LatLng($("#city_"+i).attr("data-lat"), $("#city_"+i).attr("data-lng"))}; 
       	}
       	
		// 마커 아이콘
		myIcon = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/marker.png",null,null,null,new google.maps.Size(50,45));
		// 말풍선 안에 들어갈 내용
		/* content = ["방콕","치앙마이","파타야","푸켓"]; */
		
		//마커 정보(도시명)담기
		for(var i=0;i<4;i++){
			content[i] = $("#city_"+i).attr("data-ci_name");
		}
		
		// 위치 배열 마커찍기
		for (var i = 0; i < locations.length; i++) {
        	marker = new google.maps.Marker({
            	position: locations[i].position,
            	map: map,
            	icon: myIcon,
            	title: content[i]
          		/* ,
            	labelContent: content[i],
    		    labelAnchor: new google.maps.Point(-11, 30),
   			    labelClass: "labels", // the CSS class for the label
    		    labelStyle: {opacity: 0.75}*/
       		});
        	
        	//생성된 마커를 마커배열에 추가
        	markers.push(marker);
		}
        
		console.log(markers);
		//바운스
        /* google.maps.event.addListener(marker, 'click', bounceEvent(map,marker)); */
          	
       	// 마커를 클릭했을 때의 말풍선 이벤트
          	
		/*  infoWindow.setOptions({
		   	content: contentString,
		     position: locations[i].position
		 }); */

          	
       	/* 클릭시 줌되는 것 */
		/* var infowindow = new google.maps.InfoWindow();
       	google.maps.event.addListener(marker, 'click', (function(marker, i) {
           	return function() {
           		infowindow.setContent(locations[i][0]);
               	infowindow.open(map, marker);
            }
       	})(marker, i));
           
       	if(marker){
           	marker.addListener('click', function() {
          		map.setZoom(15);
           		map.setCenter(this.getPosition());
        	});
        } */
        /* alert("marker ??" + marker);
        console.log(marker); */
        
		google.maps.event.addListener(marker, 'click', toggleBounce);	
        
       	
       /* var infowindow = new google.maps.InfoWindow({content: content[count]});
       	google.maps.event.addListener(marker, "click", function() {
			infowindow.open(map,marker);
        	count++;
       	}); */
            
       	
		/* 바운스 */
    	/* google.maps.event.addListener(marker, 'click', function() {
				marker.setAnimation(google.maps.Animation.BOUNCE);
   			});
    	
   		marker.setMap(map); */
       	/* 바운스 */
       	/* google.maps.event.addListener(marker, 'click', function() {
			if (marker.getAnimation() != null) {
				marker.setAnimation(null);
			}else {
				marker.setAnimation(google.maps.Animation.BOUNCE);
			}
		});  */
       /* 	console.log(markers); */
       	
       	/* 마커 클릭시 바운딩, detail box 나타내기 */
		//google.maps.event.addListener(marker, 'click', function() {
			//marker.setAnimation(google.maps.Animation.BOUNCE);
			//$('#select_detail_view_city').show("slide", {direction:"left"}, 200);
       		/* $("#select_detail_view_city").animate({right: -200}, 500 ); */
       		/* $("#select_detail_view_city").css("display","block"); */
       		/* $("#select_detail_view_city").attr('style',"display:block;"); */
       	//});
       	

	}
	
	function toggleBounce(){
		if (marker.getAnimation() != null) {
		    marker.setAnimation(null);
			$('#select_detail_view_city').hide();
		  } else {
		    marker.setAnimation(google.maps.Animation.BOUNCE);
			$('#select_detail_view_city').show(); //show("slide", {direction:"left"}, 200);
		  }
	}
	
	/* function bounceEvent(map, marker){
		return function(){
			if(marker.clicked){
				marker.setAnimation(google.maps.Animation.BOUNCE);
			}
		}
	} */
	google.maps.event.addDomListener(window, 'load', initialize);

</script>
<!-- 구글맵 API KEY -->
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiDE5HBue4mflsdkcsGvSZrUeEooX8gWQ&callback=initMap&language=ko&region=KR">
</script>
</head>
<body style="">
	<!-- <script>

	</script> -->
	<!-- @@@@@@@헤더@@@@@@@@  -->
	<div id="header">
		<div class="wrap" style="width:100%;padding:0px 10px;">
			<h1 class="logo fl" alt="로고@@">
				<a href="/ko/"><span style="color:#C2BAFF"><i class="fas fa-plane-departure fa-3x"></i></span></a>
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


	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plan/date_picker.css">

	<style type="text/css">
		html, body{overflow:hidden !important;}
		.left_full_box{border-right:solid 1px #a7a7a7;height:100%;z-index:999;}
		#cat_menu{width:70px;height:100vh;background:#203341}
		#cat_menu li{width:70px;height:70px;background:#203341;color:#fff;text-align:center;border-bottom:solid 1px #374854;font-size:12px;cursor:pointer;}
		#cat_menu li img{padding-top:17px;padding-bottom:9px;}
		#cat_menu li img.s{padding-top:10px;padding-bottom:0px;}
		#cat_menu li.on{background:#fc3c3c;border-bottom:0px;}
		#cat_menu li:not(.on):hover{background:#164c88;}
		#schedule_day_list_box{overflow-y:scroll;}
		#top_menu{width:100%;height:45px;background:url(/res/map/mn_top_bg.png);position:absolute;top:74px;left:445px;z-index:2;}
		#clip_view_btn{width:110px;height:20px;font-size:11px;color:#666666;margin-top:10px;margin-left:12px;padding-left:25px;padding-top:6px;cursor:pointer;background:url('/res/map/clip_checkbox_null.png') no-repeat;}
		#clip_view_btn.on{background:url('/res/map/clip_checkbox_checked.png') no-repeat;}

		.go_list_btn{width:110px;height:20px;font-size:11px;color:#666666;margin-top:15px;margin-left:12px;padding-left:16px;padding-top:1px;cursor:pointer;background:url('/res/map/go_list_btn.png') no-repeat;}
		
		.item_sub_info_box{color:#707070;font-size:13px;position:absolute;bottom:0px;left:0px}
		
		.clip_btn{padding:0 5px;height:32px;background:#555555;border:solid #3b3b3b 1px;color:#fff;font-size:15px;position:absolute;bottom:0px;right:0px;text-align:center;line-height:30px;cursor:pointer;}
		.clip_btn.on{background:#ff9320;border:solid #f7870f 1px;}

		#select_detail_view_city{width:300px;position:absolute;left:10px;top:10px;padding-bottom:20px;z-index:999;background:#fff;border-radius:5px;display:none;}
		.detail_view_full_box{width:337px;background:url('/res/map/detail_bg.png');position:relative;}
		#select_detail_view_city .city_title{width:100%;height:59px;line-height:59px;padding-left:20px;color:#fff;font-size:17px;font-weight:bold;background:#ffba00;color:#fff;border-top-left-radius:5px;border-top-right-radius:5px;}

		#country_list_box .item {
		  padding: 15px;
		  cursor: pointer;
		  border-bottom: solid #a7a7a7 1px;
		  background-color: #fff;
		  width: 248px;
		  position: relative;
		  background:url('/res/img/workspace/new/cu_next_icon.png') no-repeat 225px 30px;
		}
		#country_list_box .item:hover{
			background-color:#f7f7f7;
		}

		.item .img_box {
		  width: 62px;
		  height: 55px;
		  position: relative;
		}
		.item .img_box img {
		  width: 62px;
		  height: 55px;
		}
		.item .info_box{margin-left:5px;}
		#country_list_box{overflow-y:scroll}
		.item .info_title{font-size:15px;color:#363636;}
		.item .info_sub_title{font-size:15px;color:#b3b3b3;margin-top:5px;}
		
		#city_list_box{overflow-y:scroll}
		#city_list_box .item {
		  padding: 15px;
		  cursor: pointer;
		  border-bottom: solid #a7a7a7 1px;
		  background-color: #fff;
		  width: 248px;
		  position: relative;
		}
		#city_list_box .item:hover{
			background-color:#f7f7f7;
		}
		.spot_to_inspot{  cursor: pointer;
		  position: absolute;
		  top: 25px;
		  right: 15px;}
		
		   .labels {
		     color: #363636;
		     background-color: white;
		     font-family: "nanum";
		     font-size: 11px;
		     font-weight: bold;
		     text-align: center;
		     min-width: 40px;
			 padding:2px;
		     border: 1px solid black;
		     white-space: nowrap;
		   }
		#date_pick{position:absolute;width:230px;display:none;margin-top:-5px;}
		#date_pick_btn{min-width:60px}
		.ui-datepicker{margin-top:-2px;}
	</style>

	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false&amp;region=KR&amp;language=ko&amp;key=AIzaSyCl637FhRA2W2lb2sQ776t96OML_-LOVdw"></script>

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
				<!-- <div id="search_box" style="width:100%;height:51px;border-bottom:solid #d6d6d6 1px;"></div> -->
				
				<!-- 지역 선택 -->
		        <div id="city_list_box" style="height: 100vh;">
		        	<c:forEach items="${res}" var="city" varStatus="status">
        			<div class="item" id="city_${status.index}" data-no="${city.city_Code}" data="86" data-ci_name="${city.city_Name}" data-lat="${city.city_Lati}" data-lng="${city.city_Long}">
        				<div class="img_box fl"><img src="${pageContext.request.contextPath}/resources/images/plan/city/${city.city_Img}"></div>
        				<!-- <div class="img_box fl"><img src="http://img.earthtory.com/img/city_images/86/bangkok_1425369552.jpg"></div> -->
        				<div class="info_box fl">
        					<div class="info_title">${city.city_Name}</div>
        					<div class="info_sub_title">${city.city_Eng}</div>
       					</div>
       					<div class="spot_to_inspot"><img src="${pageContext.request.contextPath}/resources/images/plan/spot_to_inspot_a.png"></div>
       					<div class="clear"></div>
   					</div>
   					</c:forEach>
					<%-- <div class="item" data-no="5" data="87" data-ci_name="치앙마이" data-lat="18.79906428" data-lng="98.99514161">
						<div class="img_box fl"><img src="http://img.earthtory.com/img/city_images/87/chiang-mai_1425528980.jpg"></div>
						<div class="info_box fl">
							<div class="info_title">치앙마이</div>
							<div class="info_sub_title">Chiang Mai</div>
						</div>
						<div class="spot_to_inspot"><img src="${pageContext.request.contextPath}/resources/images/plan/spot_to_inspot_a.png"></div>
						<div class="clear"></div>
					</div>
					<div class="item" data-no="13" data="89" data-ci_name="파타야" data-lat="12.92750000" data-lng="100.87527780">
						<div class="img_box fl"><img src="http://img.earthtory.com/img/city_images/89/pattaya_1425530603.jpg"></div>
						<div class="info_box fl">
							<div class="info_title">파타야</div>
							<div class="info_sub_title">Pattaya</div>
						</div>
						<div class="spot_to_inspot"><img src="${pageContext.request.contextPath}/resources/images/plan/spot_to_inspot_a.png"></div>
						<div class="clear"></div>
					</div>
					<div class="item" data-no="14" data="90" data-ci_name="푸켓" data-lat="7.98431090" data-lng="98.33074680">
						<div class="img_box fl"><img src="http://img.earthtory.com/img/city_images/90/phuket_1425534412.jpg"></div>
						<div class="info_box fl">
							<div class="info_title">푸켓</div>
							<div class="info_sub_title">Phuket</div>
						</div>
						<div class="spot_to_inspot"><img src="${pageContext.request.contextPath}/resources/images/plan/spot_to_inspot_a.png"></div>
						<div class="clear"></div>
					</div> --%>
				</div>
		    </div>
			<div class="clear"></div>
		</div>
	
		<div id="right_full_box" class="fl" style="position:absolute;left:336px;top:62px;">
	        <div id="clip_list" data="0">
               	<div class="list_title"><span></span> 클립보드<div class="list_title_option_menu" data-is_open="off">도시 변경</div></div>
                <div id="detail_close_btn"></div>
                <div class="clear"></div>
                <div class="clipboard_change_box"></div>
                
                <div class="list_box_overlay"></div>
                
                <div class="list_box"></div>
           	</div>
           	
           	<!-- 지도 설정 @@ -->
			<div id="map" class="fl" style="height: 659px; position: relative; width: 1200px; overflow: hidden; left:0px"></div>
			
			  
			  <!-- 일정 정보 설정 -->
              <div id="select_detail_view_city" data="0">
				  <div class="city_title">
					<div class="ci_title_name fl">여행도시</div>
					<div class="pn_date_box fr" id="date_pick_btn" data="0">
						<div class="pn_date_info fl">출발일</div>
						<div class="pn_date_icon fr"><i class="fas fa-calendar-alt"></i></div>
						<div class="clear"></div>
						<div id="date_pick" class="hasDatepicker">
							<div class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="display: block;">
								<div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all">
									<a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="">
										<span class="ui-icon ui-icon-circle-triangle-e"></span>
									</a>
									<div class="ui-datepicker-title">
										<span class="ui-datepicker-month">1월</span>&nbsp;<span class="ui-datepicker-year">2020</span>
									</div>
								</div>
								<table class="ui-datepicker-calendar">
									<thead>
										<tr>
											<th class="ui-datepicker-week-end"><span title="SUN">SUN</span></th>
											<th><span title="MON">MON</span></th>
											<th><span title="TUE">TUE</span></th>
											<th><span title="WED">WED</span></th>
											<th><span title="THU">THU</span></th>
											<th><span title="FRI">FRI</span></th>
											<th class="ui-datepicker-week-end"><span title="SAT">SAT</span></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
											<td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
											<td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">1</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">2</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">3</span></td>
											<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">4</span></td>
										</tr>
										<tr>
											<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">5</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">6</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">7</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">8</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">9</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">10</span></td>
											<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">11</span></td>
										</tr>
										<tr>
											<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">12</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">13</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">14</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">15</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">16</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">17</span></td>
											<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">18</span></td>
										</tr>
										<tr>
											<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">19</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">20</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">21</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">22</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">23</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">24</span></td>
											<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">25</span></td>
										</tr>
										<tr>
											<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">26</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">27</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">28</span></td>
											<td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">29</span></td>
											<td class=" ui-datepicker-days-cell-over  ui-datepicker-current-day ui-datepicker-today" data-handler="selectDay" data-event="click" data-month="0" data-year="2020">
												<a class="ui-state-default ui-state-highlight ui-state-active ui-state-hover" href="#">30</a>
											</td>
											<td class=" " data-handler="selectDay" data-event="click" data-month="0" data-year="2020">
												<a class="ui-state-default" href="#">31</a>
											</td>
											<td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div><!--datepick end -->
						<form>
							<input type="hidden" id="schedule_date" name="schedule_date" value=""/> <!-- 날짜  -->
							<input type="hidden" id="city_no" name="citycode" value=""/> <!-- 도시코드 -->
							<input type="hidden" id="title" name="title" value=""/> <!-- 제목 -->
						</form>
					</div>
					<div class="clear"></div>
				</div>
			  	<div id="selected_cities" data="0" style="max-height: 458px;"></div>
			  	<div class="detail_city_bottom">
					<div class="detail_plan_go_btn" onclick="et_modal('500px','470px','1','0','/ko/modal/create_new_plan?is_exist_city_route=true','2','1');">상세 일정 만들기</div>
			  	</div>
          		</div>
			</div>
	
			<div class="clear"></div>
		</div>
	</div>
	
	<!--//레알-->
	<style type="text/css">
		#selected_cities{width:100%;padding:0px 15px;padding-top:20px;padding-bottom:20px;overflow-y:auto}
		.s_cities{width:100%;min-height:39px;}
		.city_info{height:39px;background:#efefef;color:#555555;font-size:15px;line-height:39px;border-radius:5px;cursor:move;}
		.city_route_info{background:url('/res/img/workspace/new/item_route_bg.png') no-repeat 20px 0px;width:100%;height:41px;padding-left:63px;font-size:11px;color:#808080}
		.city_distance_info{margin-top:16px;}
		.del_city_btn{cursor:pointer;margin:4px 10px}
		.city_set_day_box{margin-right:10px;}
		.city_set_minus_btn{cursor:pointer;margin-top:3px;margin-right:3px;}
		.city_set_plus_btn{cursor:pointer;margin-top:3px;margin-left:3px;}
		.city_set_day_info{color:#555555;font-size:13px;min-width:40px;text-align:center;}
		.city_air_search_btn{min-width:79px;height:23px;border:solid #cacaca 1px;background:url('/res/img/workspace/new/air_search_icon.png') no-repeat right 5px top 3px;line-height:23px;padding-left:15px;padding-right:25px;cursor:pointer;margin-top:7px;margin-right:15px;color:#808080;display:none;}
		.detail_city_bottom{padding-top:20px;border-top:solid #d6d6d6 1px}
		.detail_plan_go_btn{width:270px;height:44px;line-height:44px;text-align:center;color:#fff;font-size:16px;margin:0 auto;background:#fc3c3c;border:solid #fc3c3c 1px;cursor:pointer;}
		.pn_date_box{margin-right:15px;cursor:pointer;}
		.pn_date_info{font-size:13px;margin-right:5px;padding-top:3px;}
		.pn_date_icon{margin-top:3px;}
		
		.list_title{width:265px;height:70px;background:#1a7ad9;line-height:70px;color:#fff;padding-left:10px;font-size:17px;font-weight:bold;}
		#schedule_full_box .title_box{width:265px;height:70px;background:#ffba00;color:#fff;line-height:70px;font-size:17px;font-weight:bold;padding:0px 10px;}
		#schedule_full_box .title_box .sub{font-size:13px;color:#fff;font-weight:normal;text-decoration:underline;}
		.day_item{width:100%;height:86px;border-bottom:solid #a7a7a7 1px;padding-left:10px;cursor:pointer;position:relative;overflow:hidden;}
		.day_item.hover{height:auto;}
		.day_item.edit{cursor:move;}
		.day_item:hover{background:#f7f7f7;}
		.day_item_circle{width:73px;height:73px;background:url('/res/img/workspace/schedule_day_box.png');position:relative;}
		.day_item_circle .day{font-size:20px;color:#46b5f1;position:absolute;top:20px;width:73px;text-align:center;}
		.day_item_circle .date{font-size:13px;color:#808080;position:absolute;top:45px;width:73px;text-align:center;}
		
		#clip_list{width:265px;z-index:999;position:absolute;left:0px;height:100%;background:#fff;display:none;}
		#city_list{width:265px;z-index:999;position:absolute;left:0px;height:100%;background:#fff;display:none;}
		#hotel_list{width:265px;z-index:999;position:absolute;left:0px;height:100%;background:#fff;display:none;}
		#transport_list{width:265px;z-index:999;position:absolute;left:0px;height:100%;background:#fff;display:none;}
		.back_btn{width:13px;height:23px;background:url('/res/img/workspace/back_btn.png');margin-top:22px;cursor:pointer;}
		#city_list_title{display:none;}
		#country_list_title .sub{cursor:pointer;}
		
		.ui-sortable-helper{border:solid #1a7ad9 1px;background:#f7f7f7;height:86px;}
		.ui-draggable-dragging{border:solid #1a7ad9 1px;background:#f7f7f7;height:86px;}
		.ui-state-highlight {background:#fff;height:86px;}
		
		.list_box{overflow-y:scroll;background:#fff;}
		#add_plan_day{width:218px;height:42px;line-height:42px;text-align:center;color:#46b5f1;border:solid #46b5f1 1px;font-size:15px;margin:0 auto;margin-top:10px;cursor:pointer;}
		.spot_distance_box{height:21px;line-height:21px;background:#fff;border:solid #cacaca 1px;font-size:11px;color:#808080;position:absolute;padding:0px 5px;margin-top:-25px;}
		.spot_distance_box:hover{text-decoration:underline;}
		#ddFrame {position: absolute;top:10px !important;right:10px !important;left:initial !important; border: 1px solid #ccc; width: 25%; height: 520px; background: rgb(255, 255, 255); background: rgba(255, 255, 255, 0.8); padding: 0px 0px; z-index: 40;}
		#ddBox {overflow-y: scroll; width: 97%; height: 500px; margin: 0px; border: 2px solid #fff; border-top: 16px solid #fff; }
		#ddBoxClose {background: url(http://earthtory.com/res/img/map/direction_close.png) no-repeat; height: 16px; width: 16px; cursor: pointer;}
		#ddBoxPrint {background: url(http://earthtory.com/images/print.png) no-repeat; height: 16px; width: 26px;padding-left: 20px ;left: 4px !important; cursor: pointer; text-decoration: none; color: #66e}
	</style>
	
	<script src="${pageContext.request.contextPath}/resources/js/plan/plan_create.js"></script> 
	<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
</body>
</html>
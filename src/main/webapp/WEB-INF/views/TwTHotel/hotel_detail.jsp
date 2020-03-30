<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>TwT - Hotel</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">
	
	<!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style type="text/css">
    html{
    	scroll-behavior:smooth;
    }
    .btn.btn-primary:hover {
    border: 1px solid #fc3c3c;
    background: transparent;
    color: #fc3c3c;
	}
	.btn.btn-primary {
    background: #fc3c3c;
    border: 1px solid #fc3c3c;
    color: #fff;
	}
	.rate i {
    color: #fc3c3c;
	}
	.destination .text .rate i {
    color: #fc3c3c;
	}
	.hotel-single .star i {
    color: #fc3c3c;
	}
	.destination .text .bottom-area span:last-child a:hover {
    background: #ffba00;
	}
	.destination .text .bottom-area span:last-child a {
    background: #ffba00;
	}
	.tagcloud a:hover {
    border: 1px solid #fc3c3c;
    color: #fc3c3c;
	}
    </style>

<!-- 구글map -->
<script type="text/javascript">
var map;
	window.onload = function initMap() {
		//금액 계산버튼 하이드
		$("#button_1").hide();
		// 호텔 위도/경도
		var lati = ${hvo.h_Lati};
		var lon = ${hvo.h_Long};
		
		// 지도 센터 위치
		var cen = {lat: lati, lng: lon};
		
		// 호텔 위치를 중심으로 맵 생성
		map = new google.maps.Map( //지도 객체 생성
		document.getElementById('map'), {zoom: 15, center: cen}); //기본 줌,시작 센터 설정
		
		// 호텔 위치 마커찍기
		var location = {"position" : new google.maps.LatLng(lati,lon)};
		var icon = new google.maps.MarkerImage("${pageContext.request.contextPath}/resources/images/plan/marker/marker.png",null,null,null,new google.maps.Size(50,45));
		var marker = new google.maps.Marker({
        	position: location.position,
        	map: map,
        	icon: icon
   		});
	}
	
	// 현재 설정된 날짜를 가져오는 함수
	function get_date(date) {
	   var date_val = date.split("/"); // 날짜 가져오기
	   var date_MM = date_val[0]; // 월
	   var date_DD = date_val[1]; // 일
	   var day1_date = new Date(date_val[2],date_MM, date_DD); // Date 객체 생성
	   return day1_date;
	}
	
	function price1(){
		var checkin_date = get_date($("#checkin_date").val());
		var checkout_date = get_date($("#checkout_date").val());
		
		var res = checkout_date.getDate() - checkin_date.getDate();
		
		
		var reservation_price2 = $("#reservation_price").val();
				
		var rs = res * removeComma(reservation_price2);
		
		
		var total_price = formatnumber(rs, "3");
		
		$("#reservation_price2").html(total_price);
		$("#reservation_price").val(rs);
		
		$("#button_1").hide();//버튼 가리기
		
		
	}
	
	// 콤마 제거함수
	function removeComma(str){
	   var number = parseInt(str.replace(/,/g,""));

	   return number;
	}
	
	//콤마 추가
	function formatnumber(v1,v2){
		   var str = new Array();
		   v1 = String(v1);
		   for(var i=1;i<=v1.length;i++){
		      if(i % v2) str[v1.length-i] = v1.charAt(v1.length-i);
		      else str[v1.length-i] = ','+v1.charAt(v1.length-i);
		   }
		   return str.join('').replace(/^,/,'');
		}
	
	//버튼 하이드
	function hidebu(){
		$("#button_1").hide();
		
	}
	
	function showbu(){
		$("#button_1").show();
	}
	//버튼 쇼
	
	/* 찬우  *//* 방선택시 가격 방이름 예약탭으로 이동 */
	function aa(){
    		console.log($("#reservation_price").val());
    	}
    
    	function kakao_price(num){
    		//alert("hotel_room" + $(this).parent( '.d-flex' ).children('#hotel_room').text());
    		//alert("hotel_room" + $(this).parent( '.d-flex' ).children('#hotel_room').val());
    		//alert("sss:" + num);
    		var hotel_room = $("#hotel_room"+num).text();
    		var hotel_price = $("#hotel_price"+num).text();
    		var hr_code = $("#hotel_hr_code"+num).val();
    		var h_code = $("#hotel_h_code"+num).val();
    		
    		hotel_price = hotel_price.substring(2);
    		    		
    		console.log(hotel_room + "/" +hotel_price);
    		console.log("호텔 방 코드"+ hr_code + "/" + h_code);
    		var hotelVal ={
    			"hotel_room":hotel_room,
    			"hotel_price":hotel_price,
    			"hr_code":hr_code,
    			"h_code":h_code
    		};
    		
    		$.ajax({
    			type:"post",
    			data:JSON.stringify(hotelVal),
    			contentType:"application/json",
    			dateType:"json",
    			success:function(){
    				$("#reservation_hotelroom2").text(hotel_room);
 					$("#reservation_hotelroom").attr("value", hotel_room);//인풋히든
    				$("#reservation_price2").text(hotel_price);
    				$("#reservation_price").attr("value", hotel_price);
    				$("#reservation_hr_code").attr("value", hr_code);
    				$("#reservation_h_code").attr("value", h_code);
    				//$("#reservation_price").val(hotel_price);//인풋히든
    				
    				$("#button_1").show();//계산 버튼 보이기
    				console.log("hr코드"+$("#hr_code").val());
    			},
    			error:function(){
    				alert("Room을 선택해 주세요");
    			}
    			
    		});
    		
    		alert(hotel_room+"가 선택되었습니다.");
    		
    	}
    	
    	//검색
		function f_submit() {
			var form = document.getElementById("searchForm")
			var chkStar = "";
			
			for(var i=1; i<=5; i++) {
				if($("#exampleCheck"+i).is(":checked")) {
					chkStar = chkStar + "\'" + $("#exampleCheck"+i).val() + "\'\,";
				}
			}

			chkStar = chkStar.slice(0,-1)
			
			$("#h_Starnn").val(chkStar);
			$("#stt_Price").val($("#value1").html())
			$("#end_Price").val($("#value2").html())
			
			form.submit();
		}
	
</script>
<!-- 구글맵 API KEY -->
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiDE5HBue4mflsdkcsGvSZrUeEooX8gWQ&callback=initMap&language=ko&region=KR">
</script>
</head>
<body id="body">
	<!-- 오른쪽 네비게이션 메뉴 DIV 시작 -->
	<div id="sidebar"><%@ include file="/WEB-INF/views/TwTAccount/common/sidebar.jsp" %></div>
	<!-- sidebar end -->
	
	<!-- header -->
	<%@ include file="../header.jsp" %>
	<!-- header css 적용 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function() {
	      $("#nav2").addClass("active")
	      $(".hero-wrap").attr('style',"background-image: url('${pageContext.request.contextPath}/resources/images/bg_12.jpg');");
	      $(".bread").text('Hotel');
	   	});
	    

   	</script>
   	
	
	<!-- ------------------------------------------------ 검색창 ------------------------------------------------------ -->
	
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        	<div class="col-lg-3 sidebar" id="searchType">
        	   <form id="searchForm" action="./hotel.do" method="get" >
        		<div class="sidebar-wrap bg-light ftco-animate">
        			<h3 class="heading mb-4">호텔 검색</h3>
        				<div class="fields">
		              <div class="form-group">
		                <input type="text" class="form-control" name="h_Name" placeholder="검색어를 입력하세요" value="">
		              </div>
		              
		              <div class="form-group">
						 <p class="rate">조식 선택</p>
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                  		  <select name="hr_Breakfast" class="form-control" placeholder="Breakfast">
	                  		    <option value="">전체</option>
	                   		   <option value="Y">선택</option>
	                   		   <option value="N">미선택</option>           
	                   		 </select>
	                	  </div>
		              	</div>	
		              
		           <!--    <div class="form-group">
		              <p class="rate">이용일정</p>
		                <input type="text" id="checkin_date" class="form-control" placeholder="체크인">
		              </div>
		              <div class="form-group">
		                <input type="text" id="checkin_date" class="form-control" placeholder="체크아웃">
		              </div> -->
		              <div class="form-group">
		              	<p class="rate">금액설정</p>
		              	<div class="range-slider">
                         
                         <label> 최소: </label>
                                     <input type="range" name="stt_Price" min="0" max="500000" step="5000" value="0" oninput="document.getElementById('value1').innerHTML=this.value;">                                                                                               
                                     <span id="value1" style="color: red;">0</span>
                                                                                     원 ~ 
                                      <label> 최대 : </label>
                                     <input type="range" name="end_Price" min="0" max="500000" step="5000" value="500000" oninput="document.getElementById('value2').innerHTML=this.value;">
                                     <a><span id="value2" style="color: red;">500000</span></a>
                                                                                      원
						</div>			
		              </div>
		               <div class="form-group">
		               <p class="rate">호텔 등급</p>
						<input type="hidden" id="h_Starnn" name="h_Starnn"/>
							  <div class="form-check">
									<input type="checkbox" class="form-check-input" id="exampleCheck5" value="5">
									<label class="form-check-label" for="exampleCheck1">
										<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
									</label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck4" value="4">
						      <label class="form-check-label" for="exampleCheck1">
						    	   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck3" value="3">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						     </label>
							  </div>
							  <div class="form-check">
							    <input type="checkbox" class="form-check-input" id="exampleCheck2" value="2">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1" value="1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
							    </label>
							  </div>
							</div>
		              
		              <div class="form-group">
		                <input type="button" id="searchBtn" value="호텔 검색" class="btn btn-primary py-3 px-5" onclick="f_submit()">
		              </div>
		              
		            </div>
        		</div>
             </form>
          </div>
          
          <!-- --------------------------------------------------------검색창 종료 ------------------------------------------------------- -->
          
           <!-- 호텔 사진 -->
          <div class="col-lg-9">
          	<div class="row">
          		<div class="col-md-12 ftco-animate">
          			<div class="single-slider owl-carousel">
          				<div class="item">
          					<div class="hotel-img" style="background-image: url(${pageContext.request.contextPath}/resources/images/hotel/${hvo.h_Img});"></div>
          				</div>
                        <c:forEach items="${detailList_B}" var="pList">
          				<div class="item">
          					<div class="hotel-img" style="background-image: url(${pageContext.request.contextPath}/resources/images/hotel/hotelroom/${pList.hr_Img});"></div>
          				</div>
          				</c:forEach>
          			</div>
          		</div>
          		<!-- 호텔 사진 끝 -->
          		
          		<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
          			<!-- 호텔 이름 -->
          			<h2>${hvo.h_Name}</h2> <!-- 호텔 이름 -->
          			<p class="rate mb-5">
          			    <!-- 호텔주소 -->
          				<span class="loc"><i class="icon-map"></i>${hvo.h_Addr}</a></span><br><br>
          				<!-- 별점 -->
          				<span class="star">
    							<c:forEach begin="1" end="${hvo.h_Starn}">
		    						<i class="icon-star"></i>
		    					</c:forEach>
		    					<c:forEach begin="1" end="${5 - hvo.h_Starn}">
				    				<i class="icon-star-o"></i>
				    			</c:forEach>
    					</span>
    				</p>
    					<!-- 호텔소개 -->
    					<div class="d-md-flex mt-5 mb-5">
    					  <ul>
	    					<li>${hvo.h_Content}</li>

	    					</ul>
    					</div>
  
          		</div>
          		
          		<!-- 위치 지도 시작 -->
          		<div id="map" style="height: 657px; position: relative; width: 1111px; overflow: hidden; bottom:2px;"></div>
          		<!-- 위치 지도 끝 -->
          		
          		<!-- 보유객실 정보 시작 -->
          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
          			<h4 class="mb-4">객실 정보</h4>
          			<div class="row">
          				<!-- 객실  -->
	<c:set var="cnt" value="1"/>
          	  <c:forEach items="${detailList_B}" var="dList">
          				<div class="col-md-4">
				    				<div class="destination">	    								    					
				    					<a class="img img-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/hotel/hotelroom/${dList.hr_Img });"></a>
									<form action="hotel_reservation.do" method="post">	
										<input type="hidden" id= "hotel_hr_code${cnt }" value="${dList.hr_Code }" >
										<input type="hidden" id= "hotel_h_code${cnt }"  value="${dList.h_Code }" >																		
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a id="hotel_room${cnt }">${dList.hr_Rank }</a></h3><br><!-- 호텔방 이름  -->
					    						</div>
					    						<div class="two">
					    							<span id="hotel_price${cnt }" class="price per-price" style="margin: -13px;"><a>₩&nbsp;</a><fmt:formatNumber value="${dList.hr_Price }" pattern="#,###" /><br></span><!-- 금액  -->
				    							</div>
				    						</div>
				    						<div class="tagcloud">
				    						   <c:if test="${dList.hr_Smoking == 'N' }">
				    						      <a class="tag-cloud-link">금연객실</a>
				    						   </c:if>
				    						   <c:if test="${dList.hr_Smoking == 'Y' }">
				    						      <a class="tag-cloud-link">흡연객실</a>
				    						   </c:if>
				    						   <c:if test="${dList.hr_Breakfast == 'Y' }">
				    						      <a class="tag-cloud-link">조식</a>
				    						   </c:if>
				    						   <c:if test="${dList.hr_Wifi == 'Y' }">
				    						      <a class="tag-cloud-link">WiFi</a>
				    						   </c:if><br>
								                <a class="tag-cloud-link"><i class="fas fa-bed"></i>&nbsp;${dList.hr_bed }</a>
								                
							              	</div>
				    						<hr>
				    						<div class="tagcloud">
				    						<a class="tag-cloud-link" style="margin-bottom: -22px; font-size: 13px;">
				    						<i class="fas fa-user-alt">&nbsp;&nbsp;${dList.hr_Standard } 명</i>
				    						</a>
				    						<a class="tag-cloud-link" style="margin-bottom: -22px; font-size: 13px;">
				    						<i class="fas fa-users">&nbsp;&nbsp;${dList.hr_Max } 명</i>
				    						</a>
				    						</div>
				    						<p class="bottom-area d-flex">
				    							<span class="ml-auto"><a onclick="kakao_price(${cnt});" style="cursor:pointer;">Pick</a></span>
				    						</p>
				    					</div>
				    					</form>
				    				</div>
				    			</div>
				    			<c:set var="cnt" value="${cnt+1 }"/>
          		</c:forEach>
          	
          			</div>
          		</div>
          		
          		
          		<!-- 보유객실 정보 끝 -->
          		
          		
          		
          		<!-- 예약 시작 -->
          		
          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
          		<form action="kakaoPay.do" method="post">
          			<input type="hidden" id="reservation_hr_code" name="reservation_hr_code" value="">
          			<input type="hidden" id="reservation_h_code" name="reservation_h_code" value="">
          			<input type="hidden" id="reservation_hotelroom" name="reservation_hotelroom" value="">
          			<input type="hidden" id="reservation_price" name="reservation_price" value="">
          			<h4 class="mb-5">예약</h4>
					<p id="reservation_hotelname2" style="font-size: 20px; color: #fc3c3c;"><input type="hidden"  name="reservation_hotelname" value="${hvo.h_Name}"><b>${hvo.h_Name}</b>
					(<span id="reservation_hotelroom2" style="font-size: 17px; color: #fc3c3c;">방정보</span>)
					</p><!--  -->
          			<h5 class="mb-5">총금액 :<span id="reservation_price2">금액</span> 원</h5>
          			<div class="fields">
          				<div class="row">
          					<div class="col-md-6">
				              <div class="form-group">
				                <input id="reservation_name" name="reservation_name" type="text" class="form-control" placeholder="이름">
				              </div>
			              </div>
			              <div class="col-md-6">
				              <div class="form-group">
				                <input id="reservation_email" name="reservation_email" type="text" class="form-control" placeholder="Email">
				              </div>
			              </div>
			              <div class="col-md-6">
				              <div class="form-group">
				                <input type="text" id="checkin_date" name="checkin_date" class="form-control" placeholder="체크인" value="">
				              </div>
			              </div>
			              <div class="col-md-6">
				              <div class="form-group">
				                <input type="text" id="checkout_date" name="checkout_date" class="form-control" placeholder="체크 아웃" value="">
				              </div>
				            </div>
				            
				             <div class="col-md-12">
				              <div id="button_1" class="form-group">		
				              <input type="button" value="금액 확인"  onclick="price1();"  class="btn btn-primary py-3">		              
				              </div>
			              </div>
				            
				            <div class="col-md-6">
					            <div class="form-group">
				                <div class="select-wrap one-third">
			                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
			                    <select id="reservation_guest" name="reservation_guest" class="form-control">
			                      <option value="1">인원(성인)</option>
			                      <option value="1">1</option>
			                      <option value="2">2</option>
			                      <option value="3">3</option>
			                      <option value="4">4</option>
			                    </select>
			                  </div>
				              </div>
			              </div>
			              <div class="col-md-6">
					            <div class="form-group">
				                <div class="select-wrap one-third">
			                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
			                    <select id="reservation_children" name="reservation_children" class="form-control">
			                      <option value="0">인원(어린이)</option>
			                      <option value="0">0</option>
			                      <option value="1">1</option>
			                      <option value="2">2</option>
			                      <option value="3">3</option>
			                      <option value="4">4</option>
			                    </select>
			                  </div>
				              </div>
			              </div>
				            <div class="col-md-12">
				              <div class="form-group">	              
				                <input type="submit" value="예약 하기" class="btn btn-primary py-3">
				              </div>
			              </div>
		              </div>
		            </div> 
          		</form>  
          		</div>     		
          		<!-- 예약 끝 -->
          		
          		<!-- 평점시작  평점은 여기가 아닌 마이페이지 쪽에 결제가 진행된 후 체크아웃 되면 그때 해야될것으로 판단됨-->
          		<!-- <div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
          			<h4 class="mb-4">평점</h4>
          			<div class="row">
          				<div class="col-md-6">
          					<form method="post" class="star-rating">
										  <div class="form-check">
												<input type="checkbox" class="form-check-input" id="exampleCheck1">
												<label class="form-check-label" for="exampleCheck1">
													<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i> 100 Ratings</span></p>
												</label>
										  </div>
										  <div class="form-check">
									      <input type="checkbox" class="form-check-input" id="exampleCheck1">
									      <label class="form-check-label" for="exampleCheck1">
									    	   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i> 30 Ratings</span></p>
									      </label>
										  </div>
										  <div class="form-check">
									      <input type="checkbox" class="form-check-input" id="exampleCheck1">
									      <label class="form-check-label" for="exampleCheck1">
									      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i> 5 Ratings</span></p>
									     </label>
										  </div>
										  <div class="form-check">
										    <input type="checkbox" class="form-check-input" id="exampleCheck1">
									      <label class="form-check-label" for="exampleCheck1">
									      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i> 0 Ratings</span></p>
									      </label>
										  </div>
										  <div class="form-check">
									      <input type="checkbox" class="form-check-input" id="exampleCheck1">
									      <label class="form-check-label" for="exampleCheck1">
									      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i> 0 Ratings</span></p>
										    </label>
										  </div>
										</form>
          				</div>
          			</div>
          		</div> -->
          		<!-- 평점끝 -->

          	</div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

    
	<!-- footer -->
	<%@ include file="../footer.jsp" %>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
  <%-- <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script> --%>
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    
  </body>
</html>
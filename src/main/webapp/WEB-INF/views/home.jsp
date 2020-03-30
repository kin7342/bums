<%@page import="com.fp.twt.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.fp.twt.vo.MemberVo" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>TwT - Main</title>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

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
    
    
    <!-- font -->
	<link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Kalam&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Waiting+for+the+Sunrise&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Over+the+Rainbow&display=swap" rel="stylesheet">

    <style type="text/css">
    .ftco-navbar-light .navbar-nav > .nav-item.cta > a:hover {
    	background: #fc3c3c;
    	border: 1px solid #fc3c3c;
	}
	.blog-entry .text .heading a:hover, .blog-entry .text .heading a:focus, .blog-entry .text .heading a:active {
    	color: #fc3c3c;
	}
	
	.enjoy-css {
	  -webkit-box-sizing: content-box;
	  -moz-box-sizing: content-box;
	  box-sizing: content-box;
	  width: 150px;
	  height: 40px;
	  cursor: pointer;
	  margin: 0;
	  -webkit-border-radius: 40px;
	  border-radius: 35px;
	  font: normal 18px/40px "Domine Font Family", Helvetica, sans-serif;
	  color: rgb(255, 255, 255);
	  text-align: center;
	  -o-text-overflow: clip;
	  text-overflow: clip;
	  letter-spacing: 1px;
	  background: #fc3c3c;
	  margin: 0 0 0 140px;
	}
	
	
	.ftco-navbar-light.scrolled .nav-item.cta > a {
      color: #fff !important;
      background: #fc3c3c;
    }
    
    .destination .text .bottom-area span:last-child a:hover {
    background: #ffba00;
	}
	.destination .text .bottom-area span:last-child a {
    background: #ffba00;
	}
	
	.destination .text .rate i {
    color: #fc3c3c;
	}
	.rate i {
    color: #fc3c3c;
	}
	.tagcloud a:hover {
    border: 1px solid #fc3c3c;
    color: #fc3c3c;
	}
	.destination .text h3 a {
    font-size: 16px;
	}
	.destination .text .two .per-price {
    font-size: 18px;
	}
	.destination .text .bottom-area span {
    font-size: 13px;
	}
    
    html{
    	scroll-behavior:smooth;
    }
    </style>

    
</head>
<body id="body">
<% MemberVo user = (MemberVo)session.getAttribute("user");
	if(user != null){
		System.out.println(user.toString());		
	}
%>
  	<!-- 오른쪽 네비게이션 메뉴 DIV 시작 -->
	<div id="sidebar"><%@ include file="/WEB-INF/views/TwTAccount/common/sidebar.jsp" %></div>
	<!-- sidebar end -->
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">TwT</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>

      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active"><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="plan.do" class="nav-link">Plan</a></li>
          <li class="nav-item"><a href="flight.do" class="nav-link">Flight</a></li>
          <li class="nav-item"><a href="hotel.do" class="nav-link">Hotel</a></li>
          <li class="nav-item"><a href="community.do" class="nav-link">Community</a></li>
          <%-- 세션 유무에 따른 버튼 이벤트 --%>
             <c:if test="${kakaoId eq null and naverId eq null and user eq null and googleId eq null}">
                <li id="nav4" class="nav-item"><a href="login.do" class="nav-link"><i class="fas fa-user"></i>&nbsp;My</a></li>
                <li class="nav-item cta"><a href="login.do" class="nav-link"><span>Login</span></a></li>
             </c:if>
             
             <c:if test="${kakaoId ne null or naverId ne null or user ne null or googleId ne null }">
                <li id="nav4" class="nav-item"><a href="mypage.do" class="nav-link"><i class="fas fa-user"></i>&nbsp;My</a></li>
                <li class="nav-item cta"><a href="logout.do" class="nav-link"><span>Logout</span></a></li>
             </c:if>
        </ul>
      </div>
    </div>
  </nav>
    <!-- END nav -->
    
    <div class="hero-wrap js-fullheight" style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_6.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-4" style="font-family: 'Kalam', cursive;" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>T</strong>ravel <br><span style="padding:0 0 0 60px;"> <strong>w</strong>ith</span> <br><span style="padding:0 0 0 100px;"><strong>T</strong>ogether</span></h1>
            <div class="enjoy-css" style="font-family: 'Kalam', cursive;" onclick="location.href='plan.do'">Create Plan!</div>
          </div>
        </div>
      </div>
    </div>
	
    <section class="ftco-section bg-light" style="z-index: 1">
      <div class="container">
        <div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
            <h2 ><strong>Popular</strong> Plan</h2>
          </div>
        </div>
        <div class="row d-flex">
        
        <c:forEach items="${main_Plan }" var="vo" begin="${page.startRow }" end="${page.startRow + 4}">
          <div class="col-md-3 d-flex ftco-animate">
	            <div class="blog-entry align-self-stretch" style="min-width: 250px;">
	              <a href="communityDetail.do?ts_code=${vo.ts_Code }" class="block-20" style="background-image: url(${pageContext.request.contextPath}/resources/images/plan/thumbnail/${vo.ts_Thum});"></a>
	              <div class="text p-4 d-block" style="min-width: 250px;">
	              	<span class="tag">${fn:substring(vo.ts_Sday,0,8)}</span>
	              	<span class="tag">| ${vo.ts_Period }DAYS</span>
	              	<span style="padding: 0 0 0 18px; float: right;">
		              	<a href=""><i class="far fa-heart"></i>&nbsp;&nbsp;</a>
			            <i class="fas fa-eye"></i><span style="font-size:16px;">&nbsp;&nbsp;${vo.ts_View }</span>
		            </span>
		            <br>
              	    <h3 class="heading" style="margin-top: 8px;"><a href="communityDetail.do?ts_code=${vo.ts_Code }">${vo.ts_Title }</a></h3>
                    <div class="tagcloud">
	                <a class="tag-cloud-link" style="cursor: pointer;">${vo.ts_Theme }</a>
               	 	</div>
           		 	<br>
                    <div style="margin-top: -10px;"><i class="fas fa-user"></i>&nbsp;${vo.m_Name }</div>			              	    
	              </div>
	            </div>
	          </div>
          </c:forEach>
          
        </div>
      </div>
    </section>
    
    <section class="ftco-section ftco-destination">
    	<div class="container">
    		<div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
            <h2 class="mb-4"><strong>Popular</strong> Destination</h2>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-12">
    				<div class="destination-slider owl-carousel ftco-animate">
    					<c:forEach items="${main_Destination}" var="TravelPointVo" begin="${page.startRow }" end="${page.startRow + 5}">
	    				<div class="item">
		    				<div class="destination">
		    					<a class="img d-flex justify-content-center align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/images/plan/${TravelPointVo.city_Code}/${TravelPointVo.tp_Img});">
		    					</a>
		    					<div class="text p-3">
		    						<h3>${TravelPointVo.tp_Name }</h3>
		    						<span class="listing">${TravelPointVo.tp_Addr }</span>
		    					</div>
		    				</div>
	    				</div>
	    				</c:forEach>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>

    <section class="ftco-section ftco-destination">
    	<div class="container">
				<div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
            <h2 class="mb-4"><strong>Popular</strong> Hotel</h2>
          </div>
        </div>   

    		<div class="row">
    			<div class="col-md-12">
    				<div class="destination-slider owl-carousel ftco-animate">
    					

        
<!--          	<div class="row">	
         	<div class="col-md-12">
         	<div class="destination-slider owl-carousel ftco-animate owl-loaded owl-drag fadeInUp ftco-animated">
       		<div class="owl-stage-outer">       		
        	<div class= "owl-stage"> -->
    		<c:forEach items="${main_hotel }" var="HotelVo" begin="${page.startRow }" end="${page.startRow + 5}">
          <!-- 		<div class="ftco-animate"> -->
          				<div class="item">
		    				<div class="destination">
		    					<a href="hotelDetail.do?h_Code=${HotelVo.h_Code }" class="img img-2 d-flex justify-content-center align-items-center" 
		    					        style="background-image: url(${pageContext.request.contextPath}/resources/images/hotel/${HotelVo.h_Img});">
		    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<div class="d-flex">
		    							<div class="one">
				    						<h3 style="width: 130px;"><a href="hotelDetail.do?h_Code=${HotelVo.h_Code }" style="margin: -7px;">${HotelVo.h_Name}</a></h3>
				    						<p class="rate">
		    									<c:forEach begin="1" end="${HotelVo.h_Starn}">
		    										<i class="icon-star"></i>
		    									</c:forEach>
		    									<c:forEach begin="1" end="${5 - HotelVo.h_Starn}">
				    								<i class="icon-star-o"></i>
				    							</c:forEach>
				    						</p>
			    						</div>
			    						<div class="two">
			    							<span class="price per-price" style="margin: -7px;">₩&nbsp;<fmt:formatNumber value="${HotelVo.min_Price}" pattern="#,###" /><br><a style="font-size: 16px;">/ 1박</a></span>
		    							</div>
		    						</div>
		    						<p style="width:216px; height:85px; font-size:13px;">${HotelVo.h_Basiccontent}</p>
		    						<hr>
		    						<p class="bottom-area d-flex">
		    							<span><i class="icon-map-o"></i>&nbsp;&nbsp;${HotelVo.h_Basicaddr}</span> 
		    							<span class="ml-auto"><a href="hotelDetail.do?h_Code=${HotelVo.h_Code }">상세정보</a></span>
		    						</p>
		    					</div>
		    				</div>
		    			</div>
		    			<!-- </div> -->
			        </c:forEach>
<!-- 			        
			         </div>
			         </div>
			         
			         <div class="owl-nav">
			         <button role="presentation" class="owl-prev"><span class="ion-ios-arrow-back"></span></button>
			         <button role="presentation" class="owl-next"><span class="ion-ios-arrow-forward"></span></button>
			         </div>
			         
			         <div class="owl-dots">
			         <button class="owl-dot active"><span></span></button>
			         <button class="owl-dot"><span></span></button>
			         </div> -->
			         
			        </div>
			        </div>
			        </div><!-- row -->
			       
			        
    	</div>
    </section>

    <!-- footer -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>

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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    
  </body>
</html>
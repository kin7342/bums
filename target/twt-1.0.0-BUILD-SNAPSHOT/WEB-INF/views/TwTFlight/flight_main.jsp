<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
    <title>TwT - Flight</title>
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
    
    <!-- font -->
    <link href="https://fonts.googleapis.com/css?family=Kalam&display=swap" rel="stylesheet">
    <style type="text/css">
    html{
      scroll-behavior:smooth;
    }
    
    .block-17 form .search-submit {
    background: #fc3c3c;
    border: 1px solid #fc3c3c;
	}
	
	.block-17 form .search-submit:hover {
    background: #fc3c3c !important;
    color: #fff !important;
    border: 1px solid #fc3c3c !important;
	}
    </style>
</head>
  
<body id="body">
	<!-- 오른쪽 네비게이션 메뉴 DIV 시작 -->
	<div id="sidebar"><%@ include file="/WEB-INF/views/TwTAccount/common/sidebar.jsp" %></div>
	<!-- sidebar end -->
	
  <!-- header -->
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">TwT</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>

      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="plan.do" class="nav-link">Plan</a></li>
          <li id="nav1" class="nav-item active"><a href="flight.do" class="nav-link">Flight</a></li>
          <li id="nav2" class="nav-item"><a href="hotel.do" class="nav-link">Hotels</a></li>
          <li id="nav3" class="nav-item"><a href="community.do" class="nav-link">Community</a></li>
          <li id="nav4" class="nav-item"><a href="mypage.do" class="nav-link"><i class="fas fa-user"></i>&nbsp;My</a></li>
          <li class="nav-item cta"><a href="login.do" class="nav-link"><span>Login</span></a></li>
        </ul>
      </div>
    </div>
  </nav>
    <!-- END nav -->
    
    <div class="hero-wrap js-fullheight" style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_9.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }" style="font-family: 'Kalam', cursive;"><strong>Flight Search <br></strong></h1>
            <!-- <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Find great places to stay, eat, shop, or visit from local experts</p> -->
            <div class="block-17 my-4" style="width:140%; height:80px;">
              <form action="airsearch.do" method="post" class="d-block d-flex">
                <div class="fields d-block d-flex" style="width:140%; height:80px;">
                <div class="select-wrap one-third">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="" class="form-control">
                      <option value="">왕복</option>
                      <option value="">편도</option>
                    </select>
                 </div>
                 
                  <div class="textfield-search one-third">                  
                  	<input type="text" class="form-control" placeholder="출발지">
                  </div>  
                                  
                  <div class="textfield-search one-third">                  
                  	<input type="text" class="form-control" placeholder="도착지">
                  </div>    
                  
                  <div class="form-group">
		             <input type="text" id="checkin_date" class="form-control" placeholder="가는날" style=" padding-right: 0px; padding-left: 0px; width:100px;">
		          </div>
		          <div class="form-group">
		             <input type="text" id="checkin_date" class="form-control" placeholder="오는날" style=" padding-right: 0px; padding-left: 0px; width:100px;">
		          </div>		               
		               
		          <div class="select-wrap one-third">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="" class="form-control">
                      <option value="1">1명</option>
                      <option value="2">2명</option>
                      <option value="3">3명</option>
                      <option value="4">4명</option>
                      <option value="5">5명</option>
                      <option value="6">6명</option>
                      <option value="7">7명</option>
                      <option value="8">8명</option>
                    </select>
                 </div>      
                </div>
                
                <input type="submit" class="search-submit btn btn-primary" value="검색" >  
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section ftco-destination">
    	<div class="container">
	
					    <!-- 날씨 -->
        <div class="container row justify-content-start">
          <div class="col-md-5 heading-section ftco-animate">
            <h2 class="mb-1 pb-1"><strong>날씨</strong></h2>          
          	<div class="row ftco-animate">
		          <div class="col-md-12">
		            <div class="carousel-testimony owl-carousel">
		              <div class="item">
		                <div class="item">
		               	 <div class="testimony-wrap d-flex">		                	
		                  <div class="user-img mb-5" style="background-image: url(${pageContext.request.contextPath}/resources/images/destination-1.jpg)">
		                  </div>
		                  <h2 style="padding-left:100px">눈<br>17°C</h2>
		               	 </div>
		             	 </div>
		              </div>
		              <div class="item">
		                <div class="item">
		                <div class="testimony-wrap d-flex">		                	
		                  <div class="user-img mb-5" style="background-image: url(${pageContext.request.contextPath}/resources/images/destination-2.jpg)">
		                  </div>
		                  <h2 style="padding-left:100px">흐림<br>17°C</h2>
		                </div>
		              </div>
		              </div>
		              <div class="item">
		                <div class="testimony-wrap d-flex">		                	
		                  <div class="user-img mb-5" style="background-image: url(${pageContext.request.contextPath}/resources/images/destination-3.jpg)">
		                  </div>
		                  <h2 style="padding-left:100px">맑음<br>17°C</h2>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
          </div>
		<div class="col-md-2"></div>
          <div class="col-md-5 heading-section ftco-animate">
            <h2 class="mb-1 pb-1"><strong>환율</strong></h2>          
          	<div class="row ftco-animate">
			      <div class="col-md-8">
		           
		              <div class="form-group">
		                <input type="text" class="form-control" placeholder="태국">
		              </div>
		              <div class="form-group">
		                <input type="text" class="form-control" placeholder="한국">
		              </div>
		              <div class="form-group">
		                <h2 style="text-align: center;">=</h2>
		              </div>
		              <div class="form-group">
		                <h2 style="text-align: center;">계산된 금액</h2>
		              </div>
		            
		          </div>
		     </div>
          </div>
        </div>
	</div>

    </section>
		
		
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    
  </body>
</html>
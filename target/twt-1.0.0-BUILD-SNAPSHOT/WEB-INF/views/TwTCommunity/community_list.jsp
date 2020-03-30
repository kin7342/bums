<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page import="com.fp.twt.vo.MemberVo" %>
	<%@ page import="com.fp.twt.vo.TravelScheduleVo" %>
<!DOCTYPE html>
<html lang="en">
<head>
  	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
    <title>TwT - Community</title>
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
    
    <style type="text/css">
    html{
    	scroll-behavior:smooth;
    }
    
    .tagcloud a:hover {
    border: 1px solid #fc3c3c;
    color: #fc3c3c;
	}
	
	.nav-link {
    display: block;
    padding: 0.2rem 1rem;
	}
	
	.nav-pills .nav-link.active, .nav-pills .show > .nav-link {
    color: #fff;
    background-color: #fc3c3c;
	}
	
	.blog-entry .text .heading a:hover, .blog-entry .text .heading a:focus, .blog-entry .text .heading a:active {
    color: #fc3c3c;
	}
	
	.ftco-navbar-light.scrolled .nav-item.active > a {
    color: #fc3c3c !important;
	}
	
	.btn.btn-primary.btn-outline-primary {
    border: 1px solid #ffba00;
    background: #ffba00;
    color: white;
	}
	
	.btn.btn-primary.btn-outline-primary:hover {
    border: 1px solid transparent;
    background: #ffba00;
    color: white;
	}	
	
	.pl-4, .px-4 {
    padding-left: 1.2rem !important;
    padding-right: 1.2rem !important;
	}
	.pb-3, .py-3 {
    padding-bottom: 0.5rem !important;
    padding-top: 0.5rem !important;
	}
	
	.mb-4, .my-4 {
    margin-bottom: 0rem !important;
	}
    </style>
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
	      $("#nav3").addClass("active")
	      $(".hero-wrap").attr('style',"background-image: url('${pageContext.request.contextPath}/resources/images/bg_7.jpg');");
	      $(".bread").text('Community');
	   	});
   	</script>

    <section class="ftco-section testimony-section bg-light">
    	<div class="container">
    		<div class="row d-md-flex">
	    		<div class="ftco-animate">
		    		<div class="row">
		          <div class="col-md-12 nav-link-wrap mb-4">
		            <div class="nav ftco-animate nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		              <a class="nav-link active" id="v-pills-whatwedo-tab" data-toggle="pill" href="#v-pills-whatwedo" role="tab" aria-controls="v-pills-whatwedo" aria-selected="true">Travel Plans</a>

		              <a class="nav-link" id="v-pills-mission-tab" data-toggle="pill" href="#v-pills-mission" role="tab" aria-controls="v-pills-mission" aria-selected="false">Photo Book</a>
			          
		            </div>
		          </div>
		          <div class="col-md-12 d-flex align-items-center">
		            
		            <div class="tab-content ftco-animate" id="v-pills-tabContent">

					<!-- fade 1 -->
		              <div class="tab-pane fade show active" id="v-pills-whatwedo" role="tabpanel" aria-labelledby="v-pills-whatwedo-tab">
							<div style="margin-bottom: 25px; padding-left: 1020px;">
					    	<span class="sort" date-id="po" onclick="" style="cursor:pointer;"><i class="far fa-thumbs-up"></i>&nbsp;인기</span>
					    	<span class="sort">&nbsp;|&nbsp;</span>
					    	<span class="sort" date-id="regdate" onclick="" style="cursor:pointer;"><i class="far fa-calendar-alt"></i>&nbsp;최신</span>
					      	</div>						
						<div class="row d-flex">
						
						
							<c:forEach items="${community }" var="vo">
							 	<div class="col-md-3 d-flex ftco-animate">
							            <div class="blog-entry align-self-stretch" style="min-width: 250px;">
							              <a href="communityDetail.do" class="block-20" style="background-image: url('${pageContext.request.contextPath}/resources/images/image_1.jpg');"></a>
							              <div class="text p-4 d-block" style="min-width: 250px;">
							              	<span class="tag">${vo.ts_Sday }</span>
							              	<span class="tag">| ${vo.ts_Period }DAYS</span>
							              	<span style="padding: 0 0 0 18px;">
								              	<i class="far fa-heart"></i>&nbsp;&nbsp;
									            <i class="fas fa-eye"></i><span style="font-size:16px;">&nbsp;&nbsp;1</span>
								            </span>
								            <br>
						              	    <h3 class="heading"><a href="communityDetail.do">${vo.ts_Title }</a></h3>
						                    <div class="tagcloud">
							                <a href="#" class="tag-cloud-link">${vo.ts_Theme }</a>
						               	 	</div>
						           		 	<br>
						                    <div style="margin-top: -10px;"><i class="fas fa-user"></i> 아이디</div>			              	    
							              </div>
							            </div>
							          </div>
						 </c:forEach>
						   <%-- <c:forEach begin="${(page-1)*8 }" end="${((page-1)*8)+7 }" var="vo">
							 <c:choose>
							 	<c:when test="${vo >= community.size() }">
						          <div class="col-md-3 d-flex ftco-animate">
						            <div class="blog-entry align-self-stretch" style="min-width: 250px;">
						              <div class="text p-4 d-block" style="min-width: 250px;">
						              	<span class="tag"></span>
						              	<span class="tag"></span>
						              	<span style="padding: 0 0 0 18px;">
							            </span>
							            <br>
					              	    <h3 class="heading"></h3>
					                    <div class="tagcloud">
						                <a href="#" class="tag-cloud-link"></a>
						                <a href="#" class="tag-cloud-link"></a>
					               	 	</div>
					           		 	<br>
					                    <div style="margin-top: -10px;"></div>			              	    
						              </div>
						            </div>
						          </div>
							 	</c:when>
							 	<c:otherwise>
							 		<div class="col-md-3 d-flex ftco-animate">
							            <div class="blog-entry align-self-stretch" style="min-width: 250px;">
							              <a href="communityDetail.do" class="block-20" style="background-image: url('${pageContext.request.contextPath}/resources/images/image_1.jpg');"></a>
							              <div class="text p-4 d-block" style="min-width: 250px;">
							              	<span class="tag">2020.02.05</span>
							              	<span class="tag">| 5DAYS</span>
							              	<span style="padding: 0 0 0 18px;">
								              	<i class="far fa-heart"></i>&nbsp;&nbsp;
									            <i class="fas fa-eye"></i><span style="font-size:16px;">&nbsp;&nbsp;1</span>
								            </span>
								            <br>
						              	    <h3 class="heading"><a href="communityDetail.do">태국 여행</a></h3>
						                    <div class="tagcloud">
							                <a href="#" class="tag-cloud-link">나홀로</a>
							                <a href="#" class="tag-cloud-link">비즈니스 여행</a>
						               	 	</div>
						           		 	<br>
						                    <div style="margin-top: -10px;"><i class="fas fa-user"></i> 아이디</div>			              	    
							              </div>
							            </div>
							          </div>
							 	</c:otherwise>
							 </c:choose>
						 </c:forEach>  --%>


						</div>
		              </div>

				    <!-- fade 2 -->
		              <div class="tab-pane fade" id="v-pills-mission" role="tabpanel" aria-labelledby="v-pills-mission-tab">
				        <div style="float: top; margin-left:985px;">
				        	<a href="communityInsert.do" class="btn btn-primary btn-outline-primary mt-4 px-4 py-3 mb-4"><span>Create Book</span></a>
				        </div>
				        <div class="container">
				        <div class="row justify-content-start mb-5 pb-3">
				          <div class="col-md-5 heading-section ftco-animate">
				            <h2 class="mb-1 pb-1"><strong>여행 제목1</strong></h2>          
				          	<div class="row ftco-animate">
						          <div class="col-md-12">
						            <div class="carousel-testimony owl-carousel">
						              <div class="item">
										<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg"/>
						              </div>
						              <div class="item">
										<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg"/>
						              </div>
						              <div class="item">
										<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg"/>
						              </div>
						            </div>
						          </div>
						        </div>
				          </div>
				          
						<div class="col-md-2"></div>
						
				          <div class="col-md-5 heading-section ftco-animate">
				            <h2 class="mb-1 pb-1"><strong>여행 제목2</strong></h2>          
				          	<div class="row ftco-animate">
						          <div class="col-md-12">
						            <div class="carousel-testimony owl-carousel">
						              <div class="item">
										<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg"/>
						              </div>
						              <div class="item">
										<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg"/>
						              </div>
						              <div class="item">
										<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg"/>
						              </div>
						            </div>
						          </div>
						        </div>
				          </div>
				          
				          <div class="col-md-5 heading-section ftco-animate">
				            <h2 class="mb-1 pb-1"><strong>여행 제목3</strong></h2>          
				          	<div class="row ftco-animate">
						          <div class="col-md-12">
						            <div class="carousel-testimony owl-carousel">
						              <div class="item">
										<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg"/>
						              </div>
						              <div class="item">
										<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg"/>
						              </div>
						              <div class="item">
										<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg"/>
						              </div>
						            </div>
						          </div>
						        </div>
				          </div>
				          
						<div class="col-md-2"></div>
						
				          <div class="col-md-5 heading-section ftco-animate">
				            <h2 class="mb-1 pb-1"><strong>여행 제목4</strong></h2>          
				          	<div class="row ftco-animate">
						          <div class="col-md-12">
						            <div class="carousel-testimony owl-carousel">
						              <div class="item">
										<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg"/>
						              </div>
						              <div class="item">
										<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg"/>
						              </div>
						              <div class="item">
										<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg"/>
						              </div>
						            </div>
						          </div>
						        </div>
				          </div>
				<!--  -->          
				        </div>
						</div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
    	</div>
<!-- 페이징 -->        
      <div class="container">
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
<!--  -->
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
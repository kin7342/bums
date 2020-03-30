<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        	<div class="col-lg-3 sidebar">
        		<div class="sidebar-wrap bg-light ftco-animate">
        			<h3 class="heading mb-4">호텔 검색</h3>
        			<form action="#">
        				<div class="fields">
		              <div class="form-group">
		                <input type="text" class="form-control" placeholder="검색어를 입력하세요">
		              </div>
		              <div class="form-group">
						 <p class="rate">조식 선택</p>
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                  		  <select name="" id="" class="form-control" placeholder="Breakfast">
	                  		    <option value="">전체</option>
	                   		   <option value="">선택</option>
	                   		   <option value="">미선택</option>           
	                   		 </select>
	                	  </div>
		              	</div>	
		              
		              <div class="form-group">
		              <p class="rate">이용일정</p>
		                <input type="text" id="checkin_date" class="form-control" placeholder="체크인">
		              </div>
		              <div class="form-group">
		                <input type="text" id="checkin_date" class="form-control" placeholder="체크아웃">
		              </div>
		              <div class="form-group">
		              	<p class="rate">금액설정</p>
		              	<div class="range-slider">
		              		<span>
										    <input type="number" value="25000" min="0" max="120000"/>	-
										    <input type="number" value="50000" min="0" max="120000"/>
							</span>
										  <input value="1000" min="0" max="120000" step="500" type="range"/>
										  <input value="50000" min="0" max="120000" step="500" type="range"/>
										
						</div>			
		              </div>
		              <div class="form-group">
		                <input type="submit" value="호텔 검색" class="btn btn-primary py-3 px-5">
		              </div>
		            </div>
	            </form>
        		</div>
        	</div>
           <!-- 호텔 사진 -->
          <div class="col-lg-9">
          <h2>객실 사진</h2>
          	<div class="row">
          		<div class="col-md-12 ftco-animate">
          			<div class="single-slider owl-carousel">
          				<div class="item">
          					<div class="hotel-img" style="background-image: url(${pageContext.request.contextPath}/resources/images/hotel-2.jpg);"></div>
          				</div>
          				<div class="item">
          					<div class="hotel-img" style="background-image: url(${pageContext.request.contextPath}/resources/images/hotel-3.jpg);"></div>
          				</div>
          				<div class="item">
          					<div class="hotel-img" style="background-image: url(${pageContext.request.contextPath}/resources/images/hotel-4.jpg);"></div>
          				</div>
          			</div>
          		</div>
          		<!-- 호텔 사진 끝 -->
          		
          		<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
          			
          			<h2>호텔 부가설명</h2>
          			<p class="rate mb-5">
          				<span class="loc"><a href="#"><i class="icon-map"></i> 호텔 주소입력 (별점 필요한지 확인필요)</a></span>
          				<span class="star">
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star-o"></i>
    							몇명이투표했는지 입력</span>
    						</p>
    						<p>설명 내용</p>
    						<div class="d-md-flex mt-5 mb-5">
    							<ul>
	    							<li>호텔짱</li>
	    							<li>핵좋음</li>
	    							<li>뷰가멋졍</li>
	    							<li>수영장도있어</li>
	    						</ul>
	    						<ul class="ml-md-5">
	    							<li>친절해</li>
	    							<li>굿이야</li>
	    							<li>진짜좋아?</li>
	    							<li>진짜진짜좋아</li>
	    						</ul>
    						</div>
    						<p>추가 내용 내용</p>
    						<div class="tagcloud">
				                <a href="#" class="tag-cloud-link">금연객실</a>
				                <a href="#" class="tag-cloud-link">조식</a>
				                <a href="#" class="tag-cloud-link">WiFi</a>
			              	</div>
          		</div>
          		
          		
          		<!-- 보유객실 정보 시작 -->
          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
          			<h4 class="mb-4">객실 정보</h4>
          			<div class="row">
          				<!-- 객실 1 -->
          				<div class="col-md-4">
				    				<div class="destination">
				    					<a href="hotelDetail.do" class="img img-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/room-4.jpg);"></a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotelDetail.do">스위트 룸</a></h3>
						    						<p class="rate">
						    							
						    							<span>소개</span>
						    						</p>
					    						</div>
					    						<div class="two">
					    							<span class="price per-price">$1500<br></span>
				    							</div>
				    						</div>
				    						<div class="tagcloud">
				    							<p>방에 대한 소개 &nbsp;
								                <a href="#" class="tag-cloud-link"><i class="fas fa-bed"></i>&nbsp;침대개수</a>
								                </p>
							              	</div>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i></span> 
				    							<span class="ml-auto"><a href="#">Pick</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
				    			<!-- 객실 2 -->
				    			<div class="col-md-4">
				    				<div class="destination">
				    					<a href="<%=request.getContextPath()%>/hotel-single.html" class="img img-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/room-5.jpg);"></a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="<%=request.getContextPath()%>/hotel-single.html">패밀리 룸</a></h3>
						    						<p class="rate">
						    							
						    							<span>소개</span>
						    						</p>
					    						</div>
					    						<div class="two">
					    							<span class="price per-price">$600<br></span>
				    							</div>
				    						</div>
				    						<p>방에 대한 소개 </p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i></span> 
				    							<span class="ml-auto"><a href="#">Pick</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
				    			<!-- 객실 3 -->
				    			<div class="col-md-4">
				    				<div class="destination">
				    					<a href="<%=request.getContextPath()%>/hotel-single.html" class="img img-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/room-6.jpg);"></a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="<%=request.getContextPath()%>/hotel-single.html">디럭스 룸</a></h3>
						    						<p class="rate">
						    							
						    							<span>소개</span>
						    						</p>
					    						</div>
					    						<div class="two">
					    							<span class="price per-price">$300<br></span>
				    							</div>
				    						</div>
				    						<p>방에 대한 소개 </p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i></span> 
				    							<span class="ml-auto"><a href="#">Pick</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
          			</div>
          		</div>
          		<!-- 보유객실 정보 끝 -->
          		
          		<!-- 위치 지도 시작 -->
          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
          			<h4 class="mb-5">호텔 위치(지도 들어갈 부분)</h4>
          			<div></div>
          		</div>
          		<!-- 위치 지도 끝 -->
          		
          		<!-- 예약 시작 -->
          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
          			<h4 class="mb-5">예약</h4>
          			<h5 class="mb-5">총금액 : $</h5>
          			<div class="fields">
          				<div class="row">
          					<div class="col-md-6">
				              <div class="form-group">
				                <input type="text" class="form-control" placeholder="이름">
				              </div>
			              </div>
			              <div class="col-md-6">
				              <div class="form-group">
				                <input type="text" class="form-control" placeholder="Email">
				              </div>
			              </div>
			              <div class="col-md-6">
				              <div class="form-group">
				                <input type="text" id="checkin_date" class="form-control" placeholder="체크인">
				              </div>
			              </div>
			              <div class="col-md-6">
				              <div class="form-group">
				                <input type="text" id="checkin_date" class="form-control" placeholder="체크 아웃">
				              </div>
				            </div>
				            <div class="col-md-6">
					            <div class="form-group">
				                <div class="select-wrap one-third">
			                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
			                    <select name="" id="" class="form-control" placeholder="Guest">
			                      <option value="0">인원(성인)</option>
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
			                    <select name="" id="" class="form-control" placeholder="Children">
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    
  </body>
</html>
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
	.destination .text .bottom-area span:last-child a:hover {
    background: #ffba00;
	}
	.destination .text .bottom-area span:last-child a {
    background: #ffba00;
	}
	.destination{
	height:471.400px;
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
    </style>
    
    <script type="text/javascript">
	    function fn_paging(curPage) {
    		location.href = "/twt/hotel.do?curPage=" + curPage;
    	}
	   
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
	      $(".hero-wrap").attr('style',"background-image: url('${pageContext.request.contextPath}/resources/images/bg_10.jpg');");
	      $(".bread").text('Hotel');
	   	});
   	</script>
   	
   	 <!------------------------------------------------------------  검색창           ----------------------------------------------------- -->
   	 
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        	<div class="col-lg-3 sidebar" id="searchType">
        	   <form id="searchForm" action="./hotel.do" method="post" >
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
		              
		              <!-- <div class="form-group">
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
		               <p class="rate">호텔 평점</p>
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
          
          <!-- ---------------------------------------------------------- 검색창 종료 ---------------------------------------------------------------------------- -->




          
          <div class="col-lg-9">
          	<div class="row">
          	<c:choose>
          	<c:when test="${not empty hotellist}">
              <c:forEach items="${hotellist }" var="HotelVo">
          		<div class="col-md-4 ftco-animate">
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
			        </c:forEach>
			        </c:when>
			        <c:otherwise>
			          <div class="col-md-4" style="margin: 300px;">
			                            <h1>검색결과가 없습니다.</h1>
			          </div>
			        </c:otherwise>
			        </c:choose>
          	</div>
		    			<!-- -------------------------------------------- 페이징 -------------------------------------------- -->
		    			
		    			
		     <div class="row mt-5">
	          <div class="col text-center">
	            <div class="block-27">
	            <ul>
			    <c:if test="${pagination.curRange ne 1 }">
			        <li><a href="#" onClick="fn_paging(1)">&lt;</a></li> 
			    </c:if>
			    <c:if test="${pagination.curPage ne 1}">
			        <li><a href="#" onClick="fn_paging('${pagination.prevPage }')">&lt;</a></li> 
			    </c:if>
			    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
			        <c:choose>
			            <c:when test="${pageNum eq  pagination.curPage}">
			                <li class="active"><span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span></li> 
			            </c:when>
			            <c:otherwise>
			                <li><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></li> 
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			        <li><a href="#" onClick="fn_paging('${pagination.nextPage }')">&gt;</a> </li>
			    </c:if>
			    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
			       <li> <a href="#" onClick="fn_paging('${pagination.pageCnt }')">&gt;</a></li> 
			    </c:if>
			    </ul>
			</div>
			</div>
			</div>
			
			    <!-- ---------------------------------------              페이징 종료                      -----------------------------------   -->
		        
		        
		        
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
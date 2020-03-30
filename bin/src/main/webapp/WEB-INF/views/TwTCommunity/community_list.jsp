<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page import="com.fp.twt.vo.MemberVo" %>
	<%@ page import="com.fp.twt.vo.TravelScheduleVo" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<% MemberVo vo = (MemberVo)session.getAttribute("user"); %>
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
    
    <script type="text/javascript">
	    function fn_paging(curPage) {
			location.href = "/twt/community.do?curPage=" + curPage;
		}
	    
	    function fList(ts_Code){
	    	var tagid = "#check_"+ts_Code;
	    	var faid = "#fa-heart_"+ts_Code;
	    	
	    	var tag = $(tagid);
	    	
			 	$.ajax({
				url: "fList.do",
				
				data : ts_Code,
					
                type: "post",
                
                dataType : "json",
                
                success: function(data){
                	var res = data.res;
                	/* alert(tag.text()); */
                	if(res){
                		if(tag.text()=='Y'){
                			alert("찜을 해제하였습니다.")
                			$(faid).css("font-weight", "");
                			tag.text('N');
                			
                		} else {
                			alert("찜 목록에 등록 되었습니다.");
                			$(faid).css("font-weight", "bold");
                			tag.text('Y');
                		}
                	}
                },
                
                error:function(){
        	  		alert("에러");
        	  	}
			})
		};
		
		function login(){
			alert("로그인이 필요합니다.");
			location.href="login.do";
		};
    </script>
    
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
	    $(document).ready(function(){
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
		              <a onclick="potoBookList();" class="nav-link" id="v-pills-mission-tab" data-toggle="pill" href="#v-pills-mission" role="tab" aria-controls="v-pills-mission" aria-selected="false">Photo Book</a>
		            </div>
		          </div>
		          <div class="col-md-12 d-flex align-items-center">
		            
		            <div class="tab-content ftco-animate" id="v-pills-tabContent">

					<!-- fade 1 -->
		              <div class="tab-pane fade show active" id="v-pills-whatwedo" role="tabpanel" aria-labelledby="v-pills-whatwedo-tab">
							<div style="margin-bottom: 25px; padding-left: 1020px;">
					    	<span class="sort" date-id="regdate" ><i class="far fa-calendar-alt"></i>&nbsp;<a href="community.do">최신</a></span>
					    	<span class="sort">&nbsp;|&nbsp;</span>
					    	<span class="sort" date-id="po" ><i class="far fa-thumbs-up"></i>&nbsp;<a href="community.do?Chk=true">인기</a></span>
					      	</div>						
						<div class="row d-flex">
							<c:forEach items="${list }" var="vo" varStatus="status" begin="${page.startRow }" end="${page.startRow + 7 }">
							 	<div class="col-md-3 d-flex ftco-animate">
							            <div class="blog-entry align-self-stretch" style="min-width: 250px;">
							              <a href="communityDetail.do?ts_code=${vo.ts_Code }" class="block-20" style="background-image: url(${pageContext.request.contextPath}/resources/images/plan/${vo.city_Code }/${vo.tp_Img });"></a>
							              <div class="text p-4 d-block" style="min-width: 250px;">
							              	<span class="tag">${fn:substring(vo.ts_Sday,0,8)}</span>
							              	<span class="tag">| ${vo.ts_Period }DAYS</span>
							              	<span style="padding: 0 0 0 18px; float: right;">
							              	
							              	<!-- 로그인 돼있을 때 찜 여부 확인 후 목록 출력 -->
							              <%-- 	<c:if test="${kakaoId ne null or naverId ne null or user ne null or googleId ne null}">
							              	<c:set var="istrue" value="false"></c:set>
							              		<c:forEach items="check" var="check">
							              			<c:if test="${check.fl_Code eq vo.ts_Code }">
										              	<c:set var="istrue" value="true"></c:set>
							              			</c:if>
							              		</c:forEach>
							              		  	<c:choose>
										              	<c:when test="${istrue eq true}"> --%>
									              				<div class="cnt_copy">
																	<a onclick="fList('${vo.ts_Code}');" id="fList" style="cursor: pointer;"><i class="far fa-heart" id="fa-heart_${vo.ts_Code}" style="color: #fc3c3c; font-weight: bold;" ></i></a>&nbsp;&nbsp;
																	<i class="fas fa-eye"></i><span style="font-size:14px;">&nbsp;&nbsp;${vo.ts_View }</span>
																</div>
										              	<%-- </c:when>
										              	<c:otherwise> --%>
												            <div class="cnt_copy">
																<a onclick="fList('${vo.ts_Code}');" id="fList" style="cursor: pointer;"><i class="far fa-heart" id="fa-heart_${vo.ts_Code}" style="color: #fc3c3c;" ></i></a>&nbsp;&nbsp;
																<i class="fas fa-eye"></i><span style="font-size:14px;">&nbsp;&nbsp;${vo.ts_View }</span>
															</div>
										              	<%-- </c:otherwise>
										              	</c:choose>
											</c:if> --%>
											
											<!-- 로그인 안돼 있을 때 하트 클릭 시 로그인 창으로 이동 -->
											<c:if test="${kakaoId eq null and naverId eq null and user eq null and googleId eq null}">
												<div class="cnt_copy">
													<a onclick="login();" id="login" style="cursor: pointer;"><i class="far fa-heart" style="color: #fc3c3c;"></i></a>&nbsp;&nbsp;
													<i class="fas fa-eye"></i><span style="font-size:14px;">&nbsp;&nbsp;${vo.ts_View }</span>
							              		</div>
											</c:if>
											
								            </span>
								            <br>
						              	    <h3 class="heading" style="margin-top: 8px;"><a href="communityDetail.do?ts_code=${vo.ts_Code }">${vo.ts_Title }</a></h3>
						                    <div class="tagcloud">
							                <a href="community.do?ts_theme=${vo.ts_Theme}" class="tag-cloud-link">${vo.ts_Theme }</a>
						               	 	</div>
						           		 	<br>
						                    <div style="margin-top: -10px;"><i class="fas fa-user"></i>&nbsp;${vo.m_Name }</div>			              	    
							              </div>
							            </div>
							          </div>
						 </c:forEach>
						 
						</div>

						<!-- 페이징 --> 
						<script type="text/javascript">
						   function PageMove(page,Chk){
						      if(Chk == ""){
						         Chk = false;
						      }
						       location.href = "community.do?curpagenum="+page+"&Chk="+Chk;
						    }
						</script>              
						
						<c:if test="${page.listCount > 8}">
		                     <div class="container">
		                       <div class="row mt-5">
		                         <div class="col text-center">
		                           <div class="block-27">
		                             <ul>
		                             <c:if test="${page.preve eq true }">
		                               <li><a href="javascript:PageMove(${page.currentPage-1 },'${Chk}')">&lt;</a></li>
		                             </c:if>
		                             <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }" >
		                             <c:choose>
		                             <c:when test="${i eq page.currentPage }">
		                               <li class="active"><span><a href="javascript:PageMove(${i},'${Chk}')">${i}</a></span></li>
		                             </c:when>
		                             <c:otherwise>
		                                <li><a href="javascript:PageMove(${i},'${Chk}')">${i}</a></li>
		                             </c:otherwise>
		                             </c:choose>
		                             </c:forEach>  
		                             <c:if test="${page.next eq true }">  
		                               <li><a href="javascript:PageMove(${page.currentPage+1 },'${Chk}')">&gt;</a></li>
		                             </c:if>  
		                             </ul>
		                           </div>
		                         </div>
		                       </div>
		                     </div>
		                  </c:if>   
						       
		              </div>

				    <!-- fade 2 -->
		              <div class="tab-pane fade" id="v-pills-mission" role="tabpanel" aria-labelledby="v-pills-mission-tab">
				        <div style="float: top; margin-left:985px;">
				        <a href="communityInsertForm.do" class="btn btn-primary btn-outline-primary mt-4 px-4 py-3 mb-4"><span>Create Book</span></a>
				        </div>
				        <div class="container">
				        <div class="row justify-content-start mb-5 pb-3" id="potoList">
				        
				        <c:choose>
				        <c:when test="${empty potoList}">
				        <div>작성된 글이 없습니다.</div>
				        </c:when>
				        <c:otherwise>
				        <c:forEach items="${potoList }" var="list" varStatus="status" begin="${potopage.startRow }" end="${potopage.startRow + 3 }">
				        <div class="col-md-5 heading-section ftco-animate">
				            <a href="potoBookDetail.do?sr_Code=${list.sr_Code }"><h2 class="mb-1 pb-1"><strong>${list.sr_Title}</strong></h2></a>
				            <h6>작성자 : ${list.m_Code}</h6>       
				          	<div class="row ftco-animate">
						          <div class="col-md-12">
						            <div class="carousel-testimony owl-carousel">
						              <c:forTokens var="src" items="${list.sr_ImgSrc }" delims=",">
						              <div class="item">
										<a href="potoBookDetail.do?sr_Code=${list.sr_Code }"><img src="${src}" height="260px"/></a>
						              </div>
									  </c:forTokens>	
						            </div>
						          </div>
						        </div>
				          </div>
				          <c:if test="${status.index%2 == 0 }">
						  <div class="col-md-2"></div>
						  </c:if>
						</c:forEach>
						</c:otherwise>
						</c:choose>
				<!--  -->          
				        </div>
						</div>
						<!-- 페이징 -->        
<script type="text/javascript">
	function potoPageMove(page){
    	location.href = "community.do?potocurpagenum="+page;
    }
</script>              
						<c:if test="${potopage.listCount > 4}">
					      <div class="container">
					        <div class="row mt-5">
					          <div class="col text-center">
					            <div class="block-27">
					              <ul>
					              <c:if test="${potopage.preve eq true }">
					                <li><a href="javascript:potoPageMove(${potopage.currentPage-1 })">&lt;</a></li>
					              </c:if>
					              <c:forEach var="i" begin="${potopage.startPage }" end="${potopage.endPage }" >
					              <c:choose>
					              <c:when test="${i eq potopage.currentPage }">
					                <li class="active"><span><a href="javascript:potoPageMove(${i})">${i}</a></span></li>
					              </c:when>
					              <c:otherwise>
					              	<li><a href="javascript:potoPageMove(${i})">${i}</a></li>
					              </c:otherwise>
					              </c:choose>
					              </c:forEach>  
					              <c:if test="${potopage.next eq true }">  
					                <li><a href="javascript:potoPageMove(${potopage.currentPage+1 })">&gt;</a></li>
					              </c:if>  
					              </ul>
					            </div>
					          </div>
					        </div>
					      </div>
						</c:if>   
		              </div>
		            </div>
		          </div>
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
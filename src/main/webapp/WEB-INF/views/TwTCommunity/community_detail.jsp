<%@page import="com.fp.twt.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
	<% MemberVo vo = (MemberVo)session.getAttribute("user"); %>
<!DOCTYPE html>
<html lang="en">
<head>

	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
    <title>TwT - Community</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community/community_detail_css.css">
	<link href = "https://fonts.googleapis.com/css?family= Modak & display = swap"rel = "stylesheet">
    
<script src="https://kit.fontawesome.com/6953482b42.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
/* $(function () {
// Smooth Scroll
$('a[href*=#]').bind('click', function(e){
  var anchor = $(this);
  $('html, body').stop().animate({
    scrollTop: $(anchor.attr('href')).offset().top
  }, 1000);
  e.preventDefault();
});
}); */
var check = '${fListChk.fl_Check}';

function fList(ts_Code){
 	$.ajax({
	url: "fList.do",
	
	data : ts_Code,
		
    type: "post",
    
    dataType : "json",
    
    success: function(data){
    	var res = data.res;
    	
    	if(res){
    		if(check=='Y'){
    			alert("찜을 해제하였습니다.")
    			$("#fa-heart").css("font-weight", "");
     			check = 'N';
    			
    		} else{
    			alert("찜 목록에 등록 되었습니다.");
    			$("#fa-heart").css("font-weight", "bold");
    			check = 'Y';
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
	}
	
	function ansdelete(ans_Code, board_Code){
		$.ajax({
			type : "post",
			url : "ansDelete.do?ans_Code="+ans_Code+"&board_Code="+board_Code,
			dataType : "json",
			success : function(data){
				$("#message").val("");
				var html = "";
				var count = "";
				if(data.list.length > 0){
				$.each(data.list, function(index, val){
					count++;
					html += '<li class="comment">';
					html += '<div class="vcard bio">';
					html += '</div>';
					html += '<div class="comment-body">';
					html += '<div class="meta">'+val.reple_Code+'</div>';
					html += '<h3>'+val.m_Code+'</h3>';
					html += '<h4>'+val.ans_Content+'</h4>';
					html += '<p><a onclick="ansdelete(\''+val.ans_Code+'\',\''+val.board_Code+'\')" class="reply">삭제</a></p>';
					html += '</div>';
					html += '</li>';
					$("#ansList").html(html);
				});
					$("#comments").html(count+" Comments");				
				} else {
					$("#comments").remove();
					$("#ansList").html("");
				}
 			},
			error : function(){
				alert("실패");
			}
		});
	}
	
	function ansfunc(){
		if($("#message").val() == ""){
			alert("내용을 입력하세요.");
		} else {
		var formData = $("#ansform").serialize();
		$.ajax({
			data : formData,
			type : "post",
			url : "ansInsert.do",
			dataType : "json",
			success : function(data){
				$("#message").val("");
				var html = "";
				var count = "";
				
				if(data.list.length == 1){
					count++;
					html += '<h3 id="comments" class="mb-5">'+count+' Comments</h3>';
					html += '<ul class="comment-list" id="ansList">';
					html += '<li class="comment">';
					html += '<div class="vcard bio">';
					html += '</div>';
					html += '<div class="comment-body">';
					html += '<div class="meta">'+data.list[0].reple_Code+'</div>';
					html += '<h3>'+data.list[0].m_Code+'</h3>';
					html += '<h4>'+data.list[0].ans_Content+'</h4>';
					html += '<p><a onclick="ansdelete(\''+data.list[0].ans_Code+'\',\''+data.list[0].board_Code+'\')" class="reply">삭제</a></p>';
					html += '</div>';
					html += '</li>';
					html += '</ul>';
					$("#test").prepend(html);
				} else {
					$.each(data.list, function(index, val){
						count++;
						html += '<li class="comment">';
						html += '<div class="vcard bio">';
						html += '</div>';
						html += '<div class="comment-body">';
						html += '<div class="meta">'+val.reple_Code+'</div>';
						html += '<h3>'+val.m_Code+'</h3>';
						html += '<h4>'+val.ans_Content+'</h4>';
						html += '<p><a onclick="ansdelete(\''+val.ans_Code+'\',\''+val.board_Code+'\')" class="reply">삭제</a></p>';
						html += '</div>';
						html += '</li>';
						$("#ansList").html(html);
					});
						$("#comments").html(count+" Comments");
				};
 			},
			error : function(){
				alert("실패");
			}
		});
		}
		 
	}
</script>

<style type="text/css">
.btn.btn-primary:hover {
    border: 1px solid #fc3c3c;
    background: #fc3c3c;
    color: white;
}

.btn.btn-primary {
    background: #fc3c3c;
    border: 1px solid #fc3c3c;
    color: #fff;
}

.tagcloud a:hover {
    border: 1px solid #fc3c3c;
    color: #fc3c3c;
}

.block-21 .text .heading a:hover, .block-21 .text .heading a:active, .block-21 .text .heading a:focus {
    color: #fc3c3c;
}

.block-21 .blog-img {
    display: block;
    height: 100px;
    width: 100px;
}

.comment-list li .comment-body .reply:hover {
    color: #fff;
    background: #ffba00;
}

.p-5 {
    padding: 2rem !important;
}

.subc {
    background: #ffba00 !important;
    border: 1px solid #ffba00 !important;
    color: #fff !important;
}

.subc:hover {
    border: 1px solid #ffba00 !important;
    background: #ffba00 !important;
    color: white !important;
}

.pl-4, .px-4 {
    padding-left: 1rem !important;
    padding-right: 1rem !important;
}

.pb-3, .py-3 {
    padding-bottom: 0.5rem !important;
    padding-top: 0.5rem !important;
}
.btn.btn-primary.btn-outline-primary:hover {
    background: #fc3c3c;
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


   <!-- 폼 넣는 위치 -->
   <section class="ftco-section ftco-degree-bg" style="padding: 2em 0;">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate">
          <p style="text-align: left; margin-left: 60px; margin-bottom: 30px; font-weight:bold;"><i class="fas fa-user"></i> ${detail.m_Name }님의 여행일정</p>
          
            <h2 class="mb-3" style="text-align: center; margin-top: 40px; font-weight: bold; margin-bottom: 2rem !important; ">${detail.ts_Title }</h2>
            <div class="plan_info" style="float: right; margin-top: 20px; ">
					<div class="plan_info_box" style="margin-top: -25px; margin-right: 50px; ">
						<div class="cnt_spot">
						<i class="fas fa-map-marker-alt fa-lg" ></i>&nbsp; 태국
						</div>
						<div class="cnt_people" style=" float: left; font-weight: bold; padding-left: 20px; background-position: left center; margin-left: 12px; font-size: 12px; ">
						<i class="fas fa-user-friends fa-lg"></i>&nbsp; ${detail.ts_People }
						</div>
						<div class="cnt_view">
						<i class="far fa-eye fa-lg" ></i>&nbsp; ${detail.ts_View }
						</div>
						<c:if test="${kakaoId ne null or naverId ne null or user ne null or googleId ne null}">
							<c:if test="${fListChk.fl_Check eq null or fListChk.fl_Check eq 'N'}">
								<div class="cnt_copy">
									<a onclick="fList('${detail.ts_Code}');" style="cursor: pointer;"><i class="far fa-heart fa-lg" id="fa-heart" style="color: #fc3c3c;" ></i></a>
								</div>
							</c:if>
							<c:if test="${fListChk.fl_Check eq 'Y' }">
								<div class="cnt_copy">
									<a onclick="fList('${detail.ts_Code}');" style="cursor: pointer;"><i class="far fa-heart fa-lg" id="fa-heart" style="color: #fc3c3c; font-weight: bold;" ></i></a>
								</div>
							</c:if>
						</c:if>
						<c:if test="${kakaoId eq null and naverId eq null and user eq null and googleId eq null}">
							<div class="cnt_copy">
								<a onclick="login();" style="cursor: pointer;"><i class="far fa-heart fa-lg" style="color: #fc3c3c;"></i></a>
							</div>
						</c:if>
					</div>
				</div>
				
 <main id="home" class="contents">
  <div class="container">
    <h3 class="page-title text-center" style="margin-top: 120px; color: silver; font-size: 17px;"><i class="fas fa-calendar-alt"></i><br>${detail.ts_Sday }&nbsp;(${detail.ts_Period }DAYS)</h3>
    
    <c:choose>
    <c:when test="${empty detailList }">
    	<div>글이 없습니다.</div>
    </c:when>

    <c:otherwise>
   <c:forEach items="${dayList}" var="dayList">
    <ul class="timeline">
      <li class="timeline-line"></li>
      
      <li class="timeline-group">
        <a class="btn btn-primary" style="color: white; ">${dayList}</a>
      </li>
      
    </ul>
    
    <ul class="timeline">
      <li class="timeline-line"></li>

	<c:forEach items="${detailList }" var="dList">
	<c:if test="${dayList eq dList.ts_Day}">
      <li class="timeline-item">
        <div class="timeline-badge"><a></a></div>
        <div class="timeline-panel">
          <div id="services" class="timeline-heading">
            	${dList.tp_Name }
            <div class="timeline-date" style="font-size: 13px;"><i class="fas fa-tag"></i>&nbsp;&nbsp;${dList.tp_Type }</div>
          </div>
                    
          <div class="timeline-embed" style="padding-top: 0px;">
          <img class="blog-img mr-4" src="<%=request.getContextPath() %>/resources/images/plan/${dList.city_Code }/${dList.tp_Img }" style="float: left; width: 263px; margin-left: 12px; margin-bottom: 15px;" />
          </div>
          
          <div class="timeline-content">
          <i class="fas fa-won-sign" style="font-size: 12px;">${dList.ts_Money }</i>
          <br>
          ${dList.tp_Content }
          </div>
          
          <c:if test="${dList.ts_Memo ne null }">
          <div class="timeline-footer" id="timeline-footer">
            <i class="far fa-file-alt fas-2x" id="far fa-file-alt"></i><small class="text-muted" id="text-muted"> ${dList.ts_Memo }</small>
          </div>
          </c:if>
        </div>
      	</li>
      	</c:if>
    	</c:forEach>
    </ul>
    </c:forEach>      
   </c:otherwise>
    </c:choose>
    
  </div>
            
            <!-- 댓글  -->
          <div class="col-md-8 ftco-animate" style="margin-right: 190px;">
            <div class="pt-5 mt-5" id="test">
            <c:if test="${not empty anslist }">
              <h3 id="comments" class="mb-5">${anslist.size()} Comments</h3>
              <ul class="comment-list" id="ansList">
            	<c:forEach items="${anslist }" var="list">
                <li class="comment">
                  <div class="vcard bio">
                  </div>
                  <div class="comment-body">
                    <div class="meta"><fmt:formatDate pattern="MM-dd HH:mm" value="${list.ans_Date }"/></div>
                    <h3>${list.m_Code }</h3> 
                    <h4>${list.ans_Content }</h4>
                    <%-- <c:if test="${list.m_Code eq member.m_Id}">
                    <p><a onclick="ansdelete('${list.ans_Code}','${list.board_Code }');" class="reply">삭제</a></p>
                    </c:if> --%>
                  </div>
                </li>
                </c:forEach>
              </ul>
              </c:if>
              <!-- END comment-list -->
              <c:if test="${not empty user.m_Id }">
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5" style="margin-bottom: 0px;">&nbsp;Leave a comment</h3>
                <form id="ansform" method="post" class="p-5 bg-light" style="margin-bottom:50px; width: 750px;">
                <input type="hidden" name="m_Code" value="${user.m_Id }"/>
                <input type="hidden" name="board_Code" value="${detail.ts_Code }"/>
                  <div class="form-group">
                    <label for="message">Content</label>
                    <textarea name="ans_Content" id="message" cols="60" rows="5" class="form-control"></textarea>
                  </div>
                  <div class="form-group" align="right">
                    <input type="button" value="Post Comment" onclick="ansfunc();" class="btn py-3 px-4 btn-primary subc">
                  </div>
                </form>
              </div>
              </c:if>	
            </div>
          </div> 

          </div> 
          
          <!-- .col-md-8 -->
          <div class="col-md-4 sidebar ftco-animate">

            <div class="sidebar-box ftco-animate">
            <c:choose>
            <c:when test="${fn:length(relList) > '1'}">
              <h3><i class="fas fa-clipboard-list"></i> Relation Post</h3>
            </c:when>
              <c:otherwise>
              <i class="fas fa-clipboard-list"></i>&nbsp;연관된 일정이 없습니다.
              </c:otherwise>
            </c:choose>
              <c:forEach items="${relList}" var="rel" varStatus="status" begin="0" end="2" >
              
              <div class="block-21 mb-4 d-flex">
		               <a href="communityDetail.do?ts_code=${rel.ts_Code }" class="blog-img mr-4" style="background-image: url(${pageContext.request.contextPath}/resources/images/plan/thumbnail/${rel.ts_Thum});"></a>
		               <div class="text">
		                 <h3 class="heading"><a href="communityDetail.do?ts_code=${rel.ts_Code }">${rel.ts_Title }</a></h3>
		                 <div class="meta">
		                   <div><i class="fa fa-calendar"></i> ${rel.ts_Sday }</div>
		                   <div><i class="fas fa-user"></i> ${rel.m_Name }</div>
		                   <div><i class="far fa-eye far-2x"></i> ${rel.ts_View }</div>
		                 </div>
		               </div>
		            </div>
           	</c:forEach>

            <div class="sidebar-box ftco-animate">
              <h3><i class="fas fa-hashtag"></i> Tag</h3>
              <div class="tagcloud">
                <a href="community.do?ts_theme=${detail.ts_Theme}" class="tag-cloud-link">${detail.ts_Theme }</a>
              </div>
            </div>

          </div>

        </div>
      </div>
      </div>
    </section> <!-- .section -->

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
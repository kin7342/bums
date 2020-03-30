<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	function deleteChk(){
		var sr_Code = $("input[name=srcode]").val();
 		if(confirm("삭제하시겠습니까?")){
			var url ="potoBookDelete.do?sr_Code="+sr_Code;
 			$(location).attr('href',url);
		};
	};
	
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
			<div class="container" style="margin: 50px">
			<input type="hidden" name="srcode" value="${poto.sr_Code }"/>
            <h2 class="mb-3" style="text-align: center; margin-top: 40px; font-weight: bold;">${poto.sr_Title }</h2>
            
			${poto.sr_Content }
			</div>
			<div class="container">
	        <div align="right">
	        <c:if test="${truefalse == true }">
	        <a href="updatePotoForm.do?sr_Code=${poto.sr_Code }" class="btn btn-primary btn-outline-primary mt-4 px-4 py-3 mb-4"><span>수정</span></a>
	        <input type="button" onclick="deleteChk();" class="btn btn-primary btn-outline-primary mt-4 px-4 py-3 mb-4" value="삭제"/>
	        <%-- <a href="potoBookDelete.do?sr_Code=${poto.sr_Code }" class="btn btn-primary btn-outline-primary mt-4 px-4 py-3 mb-4"><span>삭제</span></a> --%>
	        </c:if>
	        <a href="community.do" class="btn btn-primary btn-outline-primary mt-4 px-4 py-3 mb-4"><span>목록</span></a>
	        </div>
	        </div>
  <!-- 댓글  -->
          <div class="col-md-8 ftco-animate" style="margin-left: 190px; margin-right: 190px;">
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
                    <c:if test="${list.m_Code eq member.m_Id}">
                    <p><a onclick="ansdelete('${list.ans_Code}','${list.board_Code }');" class="reply">삭제</a></p>
                    </c:if>
                  </div>
                </li>
                </c:forEach>
              </ul>
              </c:if>
              <!-- END comment-list -->
              <c:if test="${not empty user.m_Id }">
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">Leave a comment</h3>
                <form id="ansform" method="post" class="p-5 bg-light" style="margin-bottom:50px; ">
                <input type="hidden" name="m_Code" value="${user.m_Id }"/>
                <input type="hidden" name="board_Code" value="${poto.sr_Code }"/>
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
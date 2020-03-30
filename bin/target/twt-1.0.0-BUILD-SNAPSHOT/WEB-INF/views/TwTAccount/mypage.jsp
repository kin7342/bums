<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<%-- 부트스트랩 모달 core 파일 시작 --%>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<%-- 부트스트랩 모달 core 파일 끝 --%>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/account/form.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scss/bootstrap/bootstrap.scss">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
<%-- 오른쪽 사이드 리모콘 메뉴 --%>
	$(document).ready(function() {
		$("#sidebar").load("../TwTAccount/common/sidebar.jsp")
	});
<%-- 내 일정 이미지 마우스 오버 이벤트 --%>
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
<%-- 비밀번호 보기/숨기기 이벤트 --%>
	$(function() {
		$('#eye').on(
				'click',
				function() {
					$('#password').toggleClass('active');

					if ($('#password').hasClass('active') == true) {
						$(this).find('.fa-eye').attr('class',
								"fas fa-eye-slash").parents(".form-group")
								.find('#password').attr('type', 'text');
					} else {
						$(this).find('.fa-eye-slash').attr('class',
								"fas fa-eye").parents('.form-group').find(
								'#password').attr('type', 'password');
					}
				});
	});
</script>
<style type="text/css">
body {
	background-image: url("${pageContext.request.contextPath}/resources/images/account/mypage_bg.jpg");
	background-repeat: no-repeat;
	background-size:cover;
}

#container {
	background-color: white;
	display: inline-block;
	margin: 140px auto;
	border-radius: 6px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.5), 0 10px 10px
		rgba(0, 0, 0, 0.3);
	padding: 40px 60px;
	margin-left: 190px;
}

.title {
	width: 100%;
	border-left: 4px solid #fc3c3c;
	height: 40px;
	line-height: 40px;
	font-size: 18px;
	font-weight: bold;
	padding: 0 12px;
	float: left;
}

#profile {
	width: 100%;
	float: left;
	padding: 35px 55px;
}

#profile img {
	width: 170px;
	display: block;
	margin: 0 auto;
}

#form_wrap {
	width: 100%;
	height: 350px;
	position: absolute;
	padding: 35px 60px;
}

#form_wrap p {
	font-size: 17px;
	color: #43652e;
}

input {
	border: 0;
	width: 100%;
	border-bottom: 1px solid #d5d5d5;
}

.page_left {
	float: left;
	width: 100%;
	padding-right: 25px;
	margin: 50px 0;
}

.day_box {
	width: 100%;
	padding-bottom: 30px;
	box-sizing: border-box;
}

.day_info_box {
	width: 100%;
	height: 60px;
	box-sizing: border-box;
}

.day_txt {
	float: left;
	background: #393e46;
	height: 60px;
	line-height: 60px;
	color: white;
	font-weight: bold;
	font-size: 22px;
	width: 110px;
	text-align: center;
	box-sizing: border-box;
}

.day_info {
	float: left;
	width: 839.2px;
	background: white;
	border-top: 1px solid #e5e5e5;
	border-right: 1px solid #e5e5e5;
	height: 60px;
	box-sizing: border-box;
}

.day_info_left {
	float: left;
	width: 430px;
	padding-left: 10px;
	box-sizing: border-box;
}

.date {
	font-size: 12px;
	color: #b3b3b3;
	font-weight: bold;
	padding-top: 7px;
	box-sizing: border-box;
}

.day_title {
	color: #363636;
	font-weight: bold;
	font-size: 18px;
}

.day_sch_box {
	width: 100%;
	border: 1px solid #e5e5e5;
	background: white;
	min-height: 100px;
	box-sizing: border-box;
}

.day_sch_num {
	height: 100%;
	text-align: center;
	float: left;
	width: 110px;
	box-sizing: border-box;
}

.sch_num {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	color: white;
	background: #393e46;
	margin: 0 auto;
	font-size: 18px;
	font-weight: bold;
	line-height: 32px;
	text-align: center;
	margin-top: 35px;
	box-sizing: border-box;
}

.sch_content {
	width: 604px;
	float: left;
	padding-top: 15px;
	box-sizing: border-box;
}

.spot_content_box {
	width: 425px;
	float: left;
	padding-left: 10px;
	box-sizing: border-box;
	padding-top: 13px;
}

.spot_name {
	font-size: 17px;
	color: #555555;
	font-weight: bold;
	box-sizing: border-box;
}

.spot_img {
	float: left;
	width: 70px;
	height: 70px;
	box-sizing: border-box;
	margin-top: 13px;
}

.spot_info {
	height: 41px;
	padding-top: 10px;
	box-sizing: border-box;
}

.tag {
	height: 23px;
	border: 1px solid #cccccc;
	background: #f5f5f5;
	font-size: 12px;
	color: #555555;
	line-height: 23px;
	padding-left: 9px;
	padding-right: 9px;
	float: left;
	border-radius: 3px;
	box-sizing: border-box;
}

.day_info_right {
	width: 172px;
	float: left;
	height: 60px;
	line-height: 60px;
	font-size: 16px;
	color: #555555;
	font-weight: bold;
	text-align: right;
	padding-right: 15px;
}

.clear {
	clear: both;
}

.block-27 {
	display: inline-block;
	text-align: center;
	width: 100%;
	margin-top: 15px;
}

.block-27 ul {
	padding: 0;
	margin: 0;
}

ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.block-27 ul li {
	display: inline-block;
	margin-bottom: 4px;
	font-weight: 400;
}

figure.snip1432 {
	font-family: 'Raleway', Arial, sans-serif;
	color: #fff;
	position: relative;
	overflow: hidden;
	margin: 10px;
	min-width: 230px;
	max-width: 315px;
	width: 100%;
	background: #000000;
	color: #ffffff;
	text-align: left;
}

figure.snip1432 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.6s ease;
	transition: all 0.6s ease;
}

figure.snip1432 img {
	opacity: 0.8;
	width: 100%;
	vertical-align: top;
	-webkit-transition: opacity 0.35s;
	transition: opacity 0.35s;
}

figure.snip1432 figcaption {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

figure.snip1432 figcaption>div {
	height: 50%;
	overflow: hidden;
	width: 100%;
	position: relative;
}

figure.snip1432 h2, figure.snip1432 h3 {
	color: white;
	margin: 0;
	position: absolute;
	left: 0;
	padding: 0 30px;
	text-transform: uppercase;
	margin: 0;
}

figure.snip1432 h2 {
	font-weight: 900;
	top: 0;
}

figure.snip1432 h3 {
	font-size: 1em;
	bottom: 0;
	font-weight: 500;
}

figure.snip1432 h3:nth-of-type(2) {
	opacity: 0;
	-webkit-transform: translateY(150%);
	transform: translateY(150%);
}

figure.snip1432 a {
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	position: absolute;
}

figure.snip1432:hover img, figure.snip1432.hover img {
	opacity: 0.5;
	-webkit-filter: grayscale(100%);
	filter: grayscale(100%);
}

figure.snip1432:hover figcaption h3:first-of-type, figure.snip1432.hover figcaption h3:first-of-type
	{
	-webkit-transform: translateY(150%);
	transform: translateY(150%);
	opacity: 0;
}

figure.snip1432:hover figcaption h3:nth-of-type(2), figure.snip1432.hover figcaption h3:nth-of-type(2)
	{
	opacity: 1;
	-webkit-transform: translateY(0%);
	transform: translateY(0%);
}

.my_route {
	width: 100%;
	height: 95px;
	line-height: 95px;
	border: 1px solid #fc3c3c;
	border-radius: 5px;
	padding: 0 15px;
}

#myroute:hover {
	box-shadow: 0px 3px 20px rgba(252, 60, 60, 0.6);
	cursor:pointer;
}

.btn.btn-primary.btn-outline-primary:hover {
    border: 1px solid #fc3c3c;
    background: #fc3c3c;
    color: #fff;
}
.btn.btn-primary.btn-outline-primary {
    border: 1px solid #fc3c3c;
    background: transparent;
    color: #fc3c3c;
}

html{
   	scroll-behavior:smooth;
}
</style>
<title>TWT - 마이페이지</title>
</head>
<body id="body">
	<%-- 오른쪽 네비게이션 메뉴 DIV 시작 --%>
	<div id="sidebar"><%@ include file="/WEB-INF/views/TwTAccount/common/sidebar.jsp" %></div>
	<%-- 오른쪽 네비게이션 메뉴 DIV 끝 -%>
	
	<%-- NAV시작 --%>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">TwT</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">Home</a></li>
		          	<li class="nav-item"><a href="plan.do" class="nav-link">Plan</a></li>
		          	<li id="nav1" class="nav-item"><a href="flight.do" class="nav-link">Flight</a></li>
		          	<li id="nav2" class="nav-item"><a href="hotel.do" class="nav-link">Hotels</a></li>
		          	<li id="nav3" class="nav-item"><a href="community.do" class="nav-link">Community</a></li>
		          	<li id="nav4" class="nav-item"><a href="mypage.do" class="nav-link"><i class="fas fa-user"></i>&nbsp;My</a></li>
		          	<li class="nav-item cta"><a href="login.do" class="nav-link"><span>Logout</span></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%-- NAV끝 --%>

	<%-- container시작 --%>
	<div class="col-sm-9" id="container">
		<div class="col-sm-3" style="float: left;">
			<div class="col-xs-12 title">
				<p>개인 정보</p>
			</div>

			<div class="col-sm-9" id="profile">
				<img src="${pageContext.request.contextPath}/resources/images/account/profile.png">
			</div>
		</div>

		<%-- 개인정보조회 DIV 시작 --%>
		<div class="col-sm-9" style="float: left;">
			<div id="form_wrap">
				<form action="#" method="post">
					<div class="form-group">
						<input type="text" value="${login.mId}" /> <label for="input"
							class="control-label">ID</label><i class="bar"></i>
					</div>

					<div class="form-group">
						<input type="text" value="${login.mEmail}" /> <label
							for="input" class="control-label">E-MAIL</label><i class="bar"></i>
					</div>

					<div class="form-group">
						<input type="password" required="required" value="${login.mPass}"
							id="password" /> <label for="input" class="control-label">PWD</label><i
							class="bar"> <span style="float: right; margin-top: -30px;"
							id="eye"> <i class="fas fa-eye"></i>
						</span>
						</i>
					</div>

					<div style="margin-left: 585px;">
						<a href="#" class="btn btn-primary btn-outline-primary">수 정</a>
					</div>
				</form>
			</div>
		</div>
		<%-- 개인정보조회 DIV 끝 --%>
		
		<%-- 호텔예약조회 DIV 시작 --%>
		<div class="col-sm-12" style="float: left; margin-top: 35px;">
			<div class="title">
				<p>항공권 예약 정보</p>
			</div>

			<div class="col-sm-12 page_left">
				<div class="day-box" id="day_box">
					<div class="day_info_box">
						<div class="day_txt">DAY1</div>

						<div class="day_info">
							<div class="day_info_left">
								<div class="date">2015.08.01 (토)</div>
								<div class="day_title">로스엔젤레스</div>
							</div>
							<div class="day_info_right" style="display: none;"></div>
							<div class="clear"></div>
						</div>
					</div>

					<div class="day_sch_box" id="day_sch_box">
						<div class="day_sch_num">
							<div class="sch_num">1</div>
						</div>

						<div class="day_sch_content">
							<img
								src="http://img.earthtory.com/img/place_img/10019/64982_0_et.jpg"
								class="spot_img" style="cursor: pointer;">

							<div class="spot_content_box">
								<div class="spot_name">베니스 비치</div>
								<div class="spot_info">
									<div class="tag">해변/항구</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%-- 호텔예약조회 DIV 끝 --%>

		<%-- 호텔예약조회 DIV 시작 --%>
		<div class="col-sm-12" style="float: left; margin-top: 35px;">
			<div class="title">
				<p>호텔 예약 정보</p>
			</div>

			<div class="col-sm-12 page_left">
				<div class="day-box" id="day_box">
					<div class="day_info_box">
						<div class="day_txt">DAY1</div>

						<div class="day_info">
							<div class="day_info_left">
								<div class="date">2015.08.01 (토)</div>
								<div class="day_title">로스엔젤레스</div>
							</div>
							<div class="day_info_right" style="display: none;"></div>
							<div class="clear"></div>
						</div>
					</div>

					<div class="day_sch_box" id="day_sch_box">
						<div class="day_sch_num">
							<div class="sch_num">1</div>
						</div>

						<div class="day_sch_content">
							<img
								src="http://img.earthtory.com/img/place_img/10019/64982_0_et.jpg"
								class="spot_img" style="cursor: pointer;">

							<div class="spot_content_box">
								<div class="spot_name">베니스 비치</div>
								<div class="spot_info">
									<div class="tag">해변/항구</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%-- 호텔예약조회 DIV 끝 --%>

		<%-- 일정 DIV시작 --%>
		<div class="col-sm-12" style="float: left;">
			<div class="title">
				<p>나의 일정</p>
			</div>
			<br> <br> <br>
			<div class="col-sm-6">
				<a href="#" data-toggle="modal" data-target="#exampleModalCenter">
					<figure class="snip1432">
						<img src="${pageContext.request.contextPath}/resources/images/account/route1.jpg" width="150">
						<figcaption>
							<div>
								<h3>Thailand</h3>
								<h3>작성한 일정 (3개)</h3>
							</div>
							<div>
								<h2>BANG KOK</h2>
							</div>
						</figcaption>
					</figure>
				</a>
			</div>
		</div>
		<%-- 일정 DIV끝 --%>

		<%-- 찜 목록 DIV 시작 --%>
		<div class="col-sm-12" style="float: left; margin-top: 30px;">
			<div class="title">
				<p>찜 목록</p>
			</div>
			<br> <br> <br> <br>

			<div class="row row-cols-1 row-cols-md-3">
				<div class="col mb-4">
					<div class="card h-100">
						<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col mb-4">
					<div class="card h-100">
						<img src="${pageContext.request.contextPath}/resources/images/image_6.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a short card.</p>
						</div>
					</div>
				</div>
				<div class="col mb-4">
					<div class="card h-100">
						<img src="${pageContext.request.contextPath}/resources/images/image_3.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content.</p>
						</div>
					</div>
				</div>
				<div class="col mb-4">
					<div class="card h-100">
						<img src="${pageContext.request.contextPath}/resources/images/image_4.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> <br>
		<%-- 찜 목록 DIV 끝 --%>

		<%-- 커뮤니티 DIV 시작 --%>
		<div class="col-sm-12" style="float: left; margin-top: 30px;">
			<div class="title">
				<p>내가 쓴 게시글</p>
			</div>
			<br> <br> <br> <br>

			<div class="row row-cols-1 row-cols-md-3">
				<div class="col mb-4">
					<div class="card h-100">
						<img src="${pageContext.request.contextPath}/resources/images/image_1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col mb-4">
					<div class="card h-100">
						<img src="${pageContext.request.contextPath}/resources/images/image_6.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a short card.</p>
						</div>
					</div>
				</div>
				<div class="col mb-4">
					<div class="card h-100">
						<img src="${pageContext.request.contextPath}/resources/images/image_3.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content.</p>
						</div>
					</div>
				</div>
				<div class="col mb-4">
					<div class="card h-100">
						<img src="${pageContext.request.contextPath}/resources/images/image_4.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
			</div>
		</div>

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
		<%-- 커뮤니티 DIV 끝 --%>

		<%-- 회원탈퇴 버튼 시작--%>
		<div style="margin-left: 880px;">
			<a href="#"
				class="btn btn-primary btn-outline-primary mt-4 px-4 py-3">회원탈퇴</a>
		</div>
		<%-- 회원탈퇴 버튼 끝 --%>
	</div>
	<%-- container끝 --%>

	<%-- 일정 모달 DIV 시작 --%>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">
						<b>일정 목록</b>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="my_route" id="myroute">
						<div style="float: left; margin-top: -3px; display: inline;">
							<img src="${pageContext.request.contextPath}/resources/images/account/Ticket-icon.png" width="65">
						</div>

						<div style="float: left; display: inline; font-size: 20px; margin-left: 15px;">
						   <b>일정제목들어갈부분</b>
						</div>
						
						<div style="float:left; display:inline; font-size:11px; margin-left:40px;">
						   <b>2020/02/02 - 2020/02/06</b>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btn-outline-primary"
						data-dismiss="modal">확  인</button>
				</div>
			</div>
		</div>
	</div>
	<%-- 일정 모달 DIV 끝 --%>
	<div id="footer"></div>
</body>
</html>
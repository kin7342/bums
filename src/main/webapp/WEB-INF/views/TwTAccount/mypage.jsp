<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 아이콘 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<%-- 부트스트랩 모달 core 파일 시작 --%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<%-- 부트스트랩 모달 core 파일 끝 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/account/form.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scss/bootstrap/bootstrap.scss">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<script type="text/javascript" src="js/component.js"></script>
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

<%-- date picker --%>
$(function(){
		//input을 datepicker로 선언
		$("#Start_date").datepicker({
		showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		,dateFormat: "yy/mm/dd"
		,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		,changeYear: true //콤보박스에서 년 선택 가능
		,changeMonth: true //콤보박스에서 월 선택 가능                
		,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전) 0 으로 설정했을대는 오늘 날짜 이후로 만 선택 가능함.
		,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
		});       
		
		$("#End_date").datepicker({
			showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,dateFormat: "yy/mm/dd"
			,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			,changeYear: true //콤보박스에서 년 선택 가능
			,changeMonth: true //콤보박스에서 월 선택 가능                
			,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
			,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
			,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
			,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
			,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전) 0 으로 설정했을대는 오늘 날짜 이후로 만 선택 가능함.
			,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
			}); 
		
		$("#Start_date2").datepicker({
			showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,dateFormat: "yy/mm/dd"
			,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			,changeYear: true //콤보박스에서 년 선택 가능
			,changeMonth: true //콤보박스에서 월 선택 가능                
			,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
			,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
			,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
			,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
			,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전) 0 으로 설정했을대는 오늘 날짜 이후로 만 선택 가능함.
			,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
			});
		
		$("#End_date2").datepicker({
			showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,dateFormat: "yy/mm/dd"
			,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			,changeYear: true //콤보박스에서 년 선택 가능
			,changeMonth: true //콤보박스에서 월 선택 가능                
			,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
			,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
			,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
			,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
			,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전) 0 으로 설정했을대는 오늘 날짜 이후로 만 선택 가능함.
			,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
			});  
		
		$("#Start_date3").datepicker({
			showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,dateFormat: "yy/mm/dd"
			,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			,changeYear: true //콤보박스에서 년 선택 가능
			,changeMonth: true //콤보박스에서 월 선택 가능                
			,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
			,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
			,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
			,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
			,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전) 0 으로 설정했을대는 오늘 날짜 이후로 만 선택 가능함.
			,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
			});
		
		$("#End_date3").datepicker({
			showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,dateFormat: "yy/mm/dd"
			,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			,changeYear: true //콤보박스에서 년 선택 가능
			,changeMonth: true //콤보박스에서 월 선택 가능                
			,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
			,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
			,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
			,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
			,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전) 0 으로 설정했을대는 오늘 날짜 이후로 만 선택 가능함.
			,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
			}); 
		
		$("#Start_date4").datepicker({
			showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,dateFormat: "yy/mm/dd"
			,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			,changeYear: true //콤보박스에서 년 선택 가능
			,changeMonth: true //콤보박스에서 월 선택 가능                
			,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
			,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
			,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
			,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
			,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전) 0 으로 설정했을대는 오늘 날짜 이후로 만 선택 가능함.
			,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
			});
		
		$("#End_date4").datepicker({
			showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,dateFormat: "yy/mm/dd"
			,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			,changeYear: true //콤보박스에서 년 선택 가능
			,changeMonth: true //콤보박스에서 월 선택 가능                
			,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
			,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
			,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
			,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
			,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전) 0 으로 설정했을대는 오늘 날짜 이후로 만 선택 가능함.
			,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
			});  
});

<%-- datepicker 날짜 비교 --%>
$(document).ready(function(){
	$("#airBtn").click(function(){
		var start1 = new Date($("#Start_date").datepicker("getDate"));
		var end1 = new Date($("#End_date").datepicker("getDate"));
		
		var start2 = new Date($("#Start_date2").datepicker("getDate"));
		var end2 = new Date($("#End_date2").datepicker("getDate"));
		
		if(end1 - start1 < 0 || end2 - start2 < 0) {
		 alert("도착일이 출발일 보다 이전일수 없습니다"); 
		 return false;
		} else {
			$("#airBtn").attr("type","submit");
		}
		
		if(start2 < end1) {
			alert("귀국일이 출국일보다 이전일 수 없습니다");
			return false;
		} else {
			$("#airBtn").attr("type","submit");
		}
	});
	
	$("#updateAirBtn").click(function(){
		var start1 = new Date($("#Start_date3").datepicker("getDate"));
		var end1 = new Date($("#End_date3").datepicker("getDate"));
		
		var start2 = new Date($("#Start_date4").datepicker("getDate"));
		var end2 = new Date($("#End_date4").datepicker("getDate"));
		
		if(end1 - start1 < 0 || end2 - start2 < 0) {
			 alert("도착일이 출발일 보다 이전일수 없습니다"); 
			 return false;
			} else {
				$("#updateAirBtn").attr("type","submit");
			}
			
			if(start2 < end1) {
				alert("귀국일이 출국일보다 이전일 수 없습니다");
				return false;
			} else {
				$("#updateAirBtn").attr("type","submit");
			}
	});
});


<%-- 회원탈퇴 , 비밀번호 alert --%>
$(document).ready(function(){
	$("#deleteMe").click(function(){
		alert("회원탈퇴가 성공적으로 완료되었습니다.");
	});
	
	$("#updatePWd").click(function(){
		alert("비밀번호가 정상적으로 변경되었습니다.");
	});
});
</script>
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
   
html{
	scroll-behavior:smooth;
}
   
body {
	background-image:
		url("${pageContext.request.contextPath}/resources/images/account/mypage_bg.jpg");
	background-repeat: no-repeat;
	background-size: cover;
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
	width:70px;
	margin-top:20px;
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

figure.snip1433 {
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

figure.snip1433 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.6s ease;
	transition: all 0.6s ease;
}

figure.snip1433 img {
	opacity: 0.8;
	width: 100%;
	vertical-align: top;
	-webkit-transition: opacity 0.35s;
	transition: opacity 0.35s;
}

figure.snip1433 figcaption {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

figure.snip1433 figcaption>div {
	height: 50%;
	overflow: hidden;
	width: 100%;
	position: relative;
}

figure.snip1433 h2, figure.snip1433 h3 {
	color: white;
	margin: 0;
	position: absolute;
	left: 0;
	padding: 0 30px;
	text-transform: uppercase;
	margin: 0;
}

figure.snip1433 h2 {
	font-weight: 900;
	top: 0;
}

figure.snip1433 h3 {
	font-size: 1em;
	bottom: 0;
	font-weight: 500;
}

figure.snip1433 h3:nth-of-type(2) {
	opacity: 0;
	-webkit-transform: translateY(150%);
	transform: translateY(150%);
}

figure.snip1433 a {
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	position: absolute;
}

figure.snip1433:hover img, figure.snip1433.hover img {
	opacity: 0.5;
	-webkit-filter: grayscale(100%);
	filter: grayscale(100%);
}

figure.snip1433:hover figcaption h3:first-of-type, figure.snip1433.hover figcaption h3:first-of-type
	{
	-webkit-transform: translateY(150%);
	transform: translateY(150%);
	opacity: 0;
}

figure.snip1433:hover figcaption h3:nth-of-type(2), figure.snip1433.hover figcaption h3:nth-of-type(2)
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
	margin-botton:15px;
}

#myroute:hover {
	box-shadow: 0px 3px 20px rgba(252, 60, 60, 0.6);
	cursor: pointer;
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

html {
	scroll-behavior: smooth;
}

#air_container {
	width: 100%;
}

#airplane_Info {
	width: 100%;
	height: 290px;
	border-radius: 5px;
	border-top: 4px solid #fc3c3c;
	border-right: 3px solid #eee;
	border-bottom: 3px solid #eee;
	border-left: 3px solid #eee;
	float:left;
	margin-top:10px;
	padding: 15px 15px;
}

#airInfo_title {
	width: 100%;
	height: 50px;
	font-size: 22px;
	line-height: 50px;
	padding-left: 25px;
}

#airInfo1 {
	width: 100%;
	height: 130px;
	overflow: hidden;
	margin-top: 10px;
}

#airInfo2 {
	width: 30%;
	height: 80px;
	margin-top: 20px;
	margin-left: 850px;
}

#info {
	width: 100%;
	height: 130px;
	float: left;
}

#info_title {
	width: 100%;
	font-size: 11px;
	color: black;
}

#info_location {
	width: 100%;
	margin-top: -10px;
	font-size: 22px;
	font-weight: bold;
}

.star { float:right;
        width:20%;
        text-align:center;
        height:100%;
        padding-top:23px;
       }
       
.star-rating__wrap{
	display: inline-block;
	font-size: 1rem;
}
.star-rating__wrap:after{
	content: "";
	display: table;
	clear: both;
}
.star-rating__ico{
	float: right;
	padding-left: 2px;
	cursor: pointer;
	color: #fc3c3c;
}
.star-rating__ico:last-child{
	padding-left: 0;
}
.star-rating__input{
	display: none;
}
.star-rating__ico:hover:before,
.star-rating__ico:hover ~ .star-rating__ico:before,
.star-rating__input:checked ~ .star-rating__ico:before
{
	content:'\f005';
	font-family:"Font Awesome 5 Free";
	font-weight:900;
}
</style>
<title>TWT - 마이페이지</title>
</head>
<body id="body">
	<%-- 오른쪽 네비게이션 메뉴 DIV 시작 --%>
	<div id="sidebar">
	   <%@ include file="/WEB-INF/views/TwTAccount/common/sidebar.jsp"%>
	</div>
	<%-- 오른쪽 네비게이션 메뉴 DIV 끝 -%>
	
	<%-- NAV시작 --%>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/index.jsp">TwT</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a
						href="${pageContext.request.contextPath}/index.jsp"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a href="plan.do" class="nav-link">Plan</a></li>
					<li id="nav1" class="nav-item"><a href="flight.do"
						class="nav-link">Flight</a></li>
					<li id="nav2" class="nav-item"><a href="hotel.do"
						class="nav-link">Hotels</a></li>
					<li id="nav3" class="nav-item"><a href="community.do"
						class="nav-link">Community</a></li>
					<li id="nav4" class="nav-item"><a href="mypage.do"
						class="nav-link"><i class="fas fa-user"></i>&nbsp;My</a></li>
					<c:if
						test="${kakaoId eq null and naverId eq null and user eq null and googleId eq null}">
						<li class="nav-item cta"><a href="login.do" class="nav-link"><span>Login</span></a></li>
					</c:if>
					<c:if
						test="${kakaoId ne null or naverId ne null or user ne null or googleId ne null}">
						<li class="nav-item cta"><a href="logout.do" class="nav-link"><span>Logout</span></a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<%-- NAV끝 --%>

	<%-- container시작 --%>
	<div class="col-sm-9" id="container">
		<div class="col-sm-3" style="float: left;">
			<div class="col-xs-12 title">
				<p>개인정보</p>
			</div>

			<div class="col-sm-9" id="profile">
				<img
					src="${pageContext.request.contextPath}/resources/images/account/profile.png">
			</div>
		</div>

		<%-- 개인정보조회 DIV 시작 --%>
		<div class="col-sm-9" style="float: left;">
			<div id="form_wrap">
					<div class="form-group">
					    <span style="color:#868686;">ID</span>
						<p style="color:black">${user.m_Id}</p>
					</div>

					<div class="form-group" style="margin-top:-12px;">
					    <span style="color:#868686;">E-MAIL</span>
						<p style="color:black">${user.m_Email}</p>
					</div>
					
					<form action="updatePwd.do" method="post">
					<div class="form-group">
					    <input type="hidden" name="m_Id" value="${user.m_Id}">
						<input type="password" required="required" value="${user.m_Pass}"
							id="password" name="m_Pass" /> <label for="input"
							class="control-label">PWD</label><i class="bar"> <span
							style="float: right; margin-top: -30px;" id="eye"> <i
								class="fas fa-eye"></i>
						</span>
						</i>
					</div>

					<div style="margin-left: 585px; margin-top:-25px;">
						<button type="submit" class="btn btn-primary btn-outline-primary" id="updatePWd">수 정</button>
					</div>
				</form>
			</div>
		</div>
		<%-- 개인정보조회 DIV 끝 --%>

		<%-- 항공예약조회 DIV 시작 --%>
		<div class="col-sm-12" style="float: left; margin-top: 35px;">
			<div class="title">
				<p>항공권 예약 정보</p>
			</div>
		</div>
		<c:choose>
			<c:when test="${empty airlist}">
				<div class="col-sm-12" style="width: 100%; text-align: center; float:left;">
				${user.m_Name}님의 예약된 항공권 정보가 존재하지 않습니다.</div>

				<div class="col-sm-6" style="margin-left: 430px; margin-top: 25px; float:left;">
					<button type="button" class="btn btn-primary btn-outline-primary"
						data-toggle="modal" data-target="#airplaneInfo">
						GO WRITE<i class="fas fa-pencil-alt" style="margin-left: 5px;"></i>
					</button>
				</div>
			</c:when>
			<c:otherwise>
			   <div style="float:right; margin-right:15px;">
			     <button type="button" data-toggle="modal" data-target="#airplaneInfo" style="border:0; outline:0; background-color:white;">
			        <span style="color:#fc3c3c; font-size:11px;">+ 추가하기</span>
			     </button>
			   </div>
			   <c:forEach items="${airlist}" var="air" varStatus="airstatus">
					<div class="col-sm-12">
						<div id="airplane_Info">
							<div id="airInfo_title">
								<span style="color: #fc3c3c; font-weight: bold;">
								${user.m_Name}님의 항공권 예약</span>정보입니다.
								<span style="margin-left:500px; cursor:pointer;">
								<button type="button" data-toggle="modal" data-target="#airplaneModify${airstatus.index}" style="border:0; outline:0; background-color:white; cursor:pointer;">
								<i class="far fa-edit"></i>
								</button>
								</span>
								<span style="margin-left:10px; cursor:pointer;"><i class="fas fa-times" onclick="location.href='air_delete.do?air_Code=${air.air_Code}'"></i></span>
							</div>

							<div class="col-sm-12" id="airInfo1">
								<div class="col-sm-2" id="info">
									<div id="info_title">
										<p>출국 출발지</p>
									</div>

									<div id="info_location">${air.dep_Loca1}</div>

									<div id="info_title">
										<p>출국 도착지</p>
									</div>

									<div id="info_location">${air.dep_Loca2}</div>
								</div>
								<div class="col-sm-4" id="info">
									<div id="info_title">
										<p>출국 출발일</p>
									</div>

									<div id="info_location">${air.dep_Date1}&nbsp;&nbsp;${air.dep_Time1}</div>

									<div id="info_title">
										<p>출국 도착일</p>
									</div>

									<div id="info_location">${air.dep_Date2}&nbsp;&nbsp;${air.dep_Time2}</div>
								</div>
								<div class="col-sm-2" id="info">
									<div id="info_title">
										<p>귀국 출발지</p>
									</div>

									<div id="info_location">${air.re_Loca1}</div>

									<div id="info_title">
										<p>귀국 도착지</p>
									</div>

									<div id="info_location">${air.re_Loca2}</div>
								</div>
								<div class="col-sm-4" id="info">
									<div id="info_title">
										<p>귀국 출발일</p>
									</div>

									<div id="info_location">${air.re_Date1}&nbsp;&nbsp;${air.re_Time1}</div>

									<div id="info_title">
										<p>귀국 도착일</p>
									</div>

									<div id="info_location">${air.re_Date2}&nbsp;&nbsp;${air.re_Time2}</div>
								</div>
							</div>

							<div class="col-sm-12" id="airInfo2">
								<i class="fas fa-barcode" style="font-size: 70px;"></i>
							</div>
						</div>
					</div>
					
		<form action="air_update.do" method="post">
		 <div class="modal fade" id="airplaneModify${airstatus.index}" tabindex="-1" role="dialog"
			aria-labelledby="airplaneInfoTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="airplaneInfoTitle">내 항공권 수정하기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					
					<div class="modal-body">
					       <input type="hidden" name="air_Code" value="${air.air_Code}">
						       출국지: <input type="text" name="dep_Loca1" value="${air.dep_Loca1}"><br>
						       출국 도착지 : <input type="text" name="dep_Loca2" value="${air.dep_Loca2}"><br>
						       출국날짜 : <input type="text" name="dep_Date1" value="${air.dep_Date1}" id="Start_date3"><br>
						       출국 도착날짜 : <input type="text" name="dep_Date2" value="${air.dep_Date2}" id="End_date3"><br>
						       출국 출발시간 : <input type="text" name="dep_Time1" value="${air.dep_Time1}"><br>
						       출국 도착시간 : <input type="text" name="dep_Time2" value="${air.dep_Time2}"><br>
						       귀국출발지 : <input type="text" name="re_Loca1" value="${air.re_Loca1}"><br>
						       귀국도착지 : <input type="text" name="re_Loca2" value="${air.re_Loca2}"><br>
						       귀국출발날짜 : <input type="text" name="re_Date1" value="${air.re_Date1}" id="Start_date4"><br>
						       귀국도착날짜 : <input type="text" name="re_Date2" value="${air.re_Date2}" id="End_date4"><br>
						       귀국출발시간 : <input type="text" name="re_Time1" value="${air.re_Time1}"><br>
						       귀국도착시간 : <input type="text" name="re_Time2" value="${air.re_Time1}">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btn-outline-primary" id="updateAirBtn">완 료</button>
					</div>
				</div>
			</div>
		</div>
	</form>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<%-- 항공예약조회 DIV 끝 --%>

		<%-- 호텔예약조회 DIV 시작 --%>
		<div class="col-sm-12" style="float: left; margin-top: 35px;">
			<div class="title">
				<p>호텔 예약 정보</p>
			</div>
			<div class="col-sm-12 page_left">
			  <c:choose>
			   	 <c:when test="${empty booking && empty hotel}">
				<div class="col-sm-12" style="width: 100%; text-align: center;">
				${user.m_Name}님의 예약된 숙소 정보가 존재하지 않습니다.</div>

				<div class="col-sm-6" style="margin-left: 366px; margin-top: 25px;">
					<button type="button" class="btn btn-primary btn-outline-primary" onclick="location.href='hotel.do'">
						GO RESERVATION<i class="far fa-calendar-check" style="margin-left: 5px;"></i>
					</button>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${booking}" var="book" varStatus="status">
				<div class="day-box" id="day_box">
					<div class="day_info_box">
						<div class="day_txt">INFO</div>

						<div class="day_info">
							<div class="day_info_left">
								<div class="date">
								  <div style="float:left;"> 
								     <input type="text" id="startDate" readonly="readonly" style="width:100px; border-bottom:0;"
								     value="${book.hb_Sdate}"/>~&nbsp;&nbsp;&nbsp;&nbsp;
								  </div>
								  <div style="float:left;">
								    <input type="text" id="endDate_${status.index}" readonly="readonly" style="width:100px; border-bottom:0;"
								     value="${book.hb_Edate}"/>
								  </div>
                                </div>
								<div class="day_title">방콕</div>
							</div>
							<div class="day_info_right" style="display: none;"></div>
							<div class="clear"></div>
						</div>
					</div>

					<div class="day_sch_box" id="day_sch_box">
						<div class="day_sch_num">
							<div class="sch_num">
							   <c:set var="code" value="${book.hb_Code}"/>
     							${fn:substring(code,2,3)}
     					    </div>
						</div>

						<div class="day_sch_content">
							<div class="spot_content_box">

								<div class="spot_name">
								  ${hotel[status.index].h_Name} 
								</div> 
							  	
								<div class="spot_info">
									<div class="tag">예약자 : ${book.hb_Name}</div>
									<div class="tag" style="margin-left:7px;">예약인원 : ${book.hb_People}</div>
									<div class="tag" style="margin-left:7px;">결제여부(Y/N) : ${book.hb_Check}</div>
								</div>
							</div>
						</div>
						
						<%-- 평점 시작 --%>
						   <div class="star">
						       <div class="star-rating__wrap">
						       
						       <%-- 평점대로 모양 유지 끝--%>
						         <c:if test="${rating[status.index].hrv_Starn ne null}">
							       <c:forEach begin="1" end="${rating[status.index].hrv_Starn}">
	 								 <i class="icon-star" style="color:#fc3c3c;"></i>
	 								</c:forEach>
	 								
	 								<c:forEach begin="1" end="${5 - rating[status.index].hrv_Starn}">
	   								  <i class="icon-star-o" style="color:#fc3c3c;"></i>
	   							    </c:forEach>
	   							  </c:if>
						         <%-- 평점대로 모양 유지 끝 --%>
						         
						         <c:if test="${rating[status.index].hrv_Starn eq null}"> 
						         <form action="star.do" method="post">
						          <input type="hidden" name="m_Code" value="${user.m_Code}"/>
						          <input type="hidden" name="hr_Code" value="${book.hr_Code }"/>
						          <input type="hidden" name="hb_Code" value="${book.hb_Code}"/>
						          <input type="hidden" name="h_Code" value="${book.h_Code}"/>

							      <input class="star-rating__input" type="radio" name="hrv_Starn" id="star-rating-5" value="5">
							      <label class="star-rating__ico far fa-star" for="star-rating-5"></label>
							      <input class="star-rating__input" type="radio" name="hrv_Starn" id="star-rating-4" value="4">
							      <label class="star-rating__ico far fa-star" for="star-rating-4"></label>
							      <input class="star-rating__input" type="radio" name="hrv_Starn" id="star-rating-3" value="3">
							      <label class="star-rating__ico far fa-star" for="star-rating-3"></label>
							      <input class="star-rating__input" type="radio" name="hrv_Starn" id="star-rating-2" value="2">
							      <label class="star-rating__ico far fa-star" for="star-rating-2"></label>
							      <input class="star-rating__input" type="radio" name="hrv_Starn" id="star-rating-1" value="1">
							      <label class="star-rating__ico far fa-star" for="star-rating-1"></label><br>

							      <button type="button" class="tag" style="cursor:pointer; margin-left:18px;" id="star">평점주기</button>
							      
							      <script type="text/javascript">
							      $(document).ready(function(){
							    		$("#star").click(function(){
							    			
							    			// 체크아웃 날짜
							    			var endDate = "20"+ $("#endDate_${status.index}").val().substring(0,10);
							    			console.log(endDate);
							    			
							    			var endDateArr = endDate.split("/");
							    			console.log(endDateArr);
							    			
							    			// 오늘 날짜
							    			var today = new Date().toISOString().substring(0,10);
							    			console.log(today);
							    			
							    			var todayArr = today.split("-");
							    			console.log(todayArr);
							    			
							    			var todayCompare = new Date(todayArr[0], parseInt(todayArr[1])-1, todayArr[2]);
							    			var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
							    			
							    			console.log(todayCompare);
							    			console.log(endDateCompare);
							    			
							    			// 오늘 날짜가 체크아웃 날짜보다 이전이라면
							    			if(todayCompare < endDateCompare) {
							    				alert("평점은 호텔 체크아웃 이후에 작성할 수 있습니다");
							    				return false;
							    			} else {
							    			 $("#star").attr("type","submit"); 
							    			}
							    		});
							    	});
							      
							      </script>
							      </form>
							     </c:if>
							   </div>
						   </div>
						<%-- 평점 끝 --%>
					</div>
				</div>
			  </c:forEach>
			  <div style="color:red; font-size:11px; margin-top:10px;">* 호텔 예약 건에 대한 변경 및 취소는 해당 호텔에 직접 연락바랍니다.</div>
			 </c:otherwise>
			</c:choose>
			</div>
		</div>
		<%-- 호텔예약조회 DIV 끝 --%>

		<%-- 일정 DIV시작 --%>
		<div class="col-sm-12" style="float:left; margin-top: 35px;">
			<div class="title">
				<p>나의 일정</p>
			</div>
		</div>
		
		<div class="col-sm-12" style="width: 100%; text-align: center; float:left;">
		   <c:choose>
		      <c:when test="${empty route}">
				   <div class="col-sm-12" style="width: 100%; text-align:center; float:left;">
	              ${user.m_Name}님의 일정이 존재하지 않습니다.
		          </div>

		         <div class="col-sm-6" style="margin-left: 240px; margin-top: 25px; float:left;">
			     <button type="button" class="btn btn-primary btn-outline-primary" onclick="location.href='plan.do'">
				     GO PLAN<i class="far fa-bookmark" style="margin-left: 5px;"></i>
			     </button>
		      </div>
		      </c:when>
		      
		      <c:otherwise>
				<a href="#" data-toggle="modal" data-target="#exampleModalCenter">
					<figure class="snip1433">
						<img src="${pageContext.request.contextPath}/resources/images/account/route1.jpg" width="150">
						<figcaption>
							<div>
								<h3></h3>
								<h3>작성한 일정 (${fn:length(route)}개) </h3>
							</div>
							<div>
								<h2>THAILAND</h2>
							</div>
						</figcaption>
					</figure>
				</a>
				</c:otherwise>
				</c:choose>
	           </div>
		<%-- 일정 DIV끝 --%>

		<%-- 찜 목록 DIV 시작 --%>
	   <div class="col-sm-12" style="float: left; margin-top: 30px;">
			<div class="title">
				<p>찜 목록</p>
			</div>
       </div>

    			<div class="col-sm-12" style="width: 100%; text-align: center; float:left;">
    			<c:choose>
    				    <c:when test="${empty like}">
    				      <div class="col-sm-12" style="width: 100%; text-align: center; float:left;">
				              ${user.m_Name}님의 찜 목록이 존재하지 않습니다.
				          </div>

				         <div class="col-sm-6" style="margin-left: 235px; margin-top: 25px; float:left;">
					     <button type="button" class="btn btn-primary btn-outline-primary" onclick="location.href='community.do'">
						     SEE OTHERS<i class="far fa-bookmark" style="margin-left: 5px;"></i>
					     </button>
				      </div>
    				    </c:when>
    				     <c:otherwise>
    				      <div class="destination-slider owl-carousel ftco-animate" style="margin-top:20px;">
    				        <c:forEach items="${like}" var="like">
    					    <div class="item">
		    				<div class="destination">
		    					<a href="communityDetail.do?ts_code=${like.ts_Code}" class="img d-flex justify-content-center align-items-center">
		    					   <img src="${pageContext.request.contextPath}/resources/images/plan/thumbnail/${like.ts_Thum}" style="height:100%; margin-left:12px;"/>
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="communityDetail.do?ts_code=${like.ts_Code}">${like.ts_Title}</a></h3>
		    						<span class="listing">VIEW : ${like.ts_View}</span>
		    					</div>
		    				</div>
	    				 </div>
	    				 </c:forEach>
	    				 </div>
	    			</c:otherwise>
	    			</c:choose>
    				</div>
		<%-- 찜 목록 DIV 끝 --%>

		<%-- 회원탈퇴 버튼 시작--%>
		<div style="margin-left: 880px; float:left;">
			<a href="#" class="btn btn-primary btn-outline-primary mt-4 px-4 py-3" data-toggle="modal" data-target="#deleteUser">회원탈퇴</a>
		</div>
		<%-- 회원탈퇴 버튼 끝 --%>
	</div>
	<%-- container끝 --%>
	
	<%-- 회원 탈퇴 모달 시작 --%>
	 <form action="deleteAccount.do">
	  <div class="modal fade" id="deleteUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalCenterTitle">회원탈퇴</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <input type="hidden" name="m_Code" value="${user.m_Code}">
		                    <h4 style="font-weight:bold; text-align:center;">${user.m_Id }님<br>정말 탈퇴 하시겠습니까?</h4>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취 소</button>
		        <button type="submit" class="btn btn-primary" id="deleteMe">확 인</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
	<%-- 회원 탈퇴 모달 끝 --%>

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
				  <c:forEach items="${route}" var="route">
					<div class="my_route" id="myroute" onclick="location.href='communityDetail.do?ts_code=${route.ts_Code}'">
						<div style="float: left; margin-top: -3px; display: inline;">
							<img src="${pageContext.request.contextPath}/resources/images/account/Ticket-icon.png" width="65">
						</div>
           
						<div style="float: left; display: inline; font-size: 20px; margin-left: 15px;">
							<b>${route.ts_Title}</b>
						</div>

						<div style="float: left; display: inline; font-size: 11px; margin-left: 40px;">
							<b>${route.ts_Sday}~${route.ts_Period}DAYS</b>
						</div>
					</div>
					</c:forEach>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btn-outline-primary"
						data-dismiss="modal">확 인</button>
				</div>
			</div>
		</div>
	</div>
	<%-- 일정 모달 DIV 끝 --%>

	<%-- 항공권 모달 DIV 시작 --%>
	<form action="air_insert.do" method="post">
		<div class="modal fade" id="airplaneInfo" tabindex="-1" role="dialog"
			aria-labelledby="airplaneInfoTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="airplaneInfoTitle">내 항공권 작성하기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" name="m_Code" value="${user.m_Code}">
						       출국지: <input type="text" name="dep_Loca1"><br>
						       출국 도착지 : <input type="text" name="dep_Loca2"><br>
						       출국날짜 : <input type="text" name="dep_Date1" id="Start_date"><br>
						       출국 도착날짜 : <input type="text" name="dep_Date2" id="End_date"><br>
						       출국 출발시간 : <input type="text" name="dep_Time1"><br>
						       출국 도착시간 : <input type="text" name="dep_Time2"><br>
						       귀국출발지 : <input type="text" name="re_Loca1"><br>
						       귀국도착지 : <input type="text" name="re_Loca2"><br>
						       귀국출발날짜 : <input type="text" name="re_Date1" id="Start_date2"><br>
						       귀국도착날짜 : <input type="text" name="re_Date2" id="End_date2"><br>
						       귀국출발시간 : <input type="text" name="re_Time1"><br>
						       귀국도착시간 : <input type="text" name="re_Time2">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btn-outline-primary" id="airBtn">완 료</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<%-- 항공권 모달 DIV 끝--%>
	
	<%-- 항공권 수정 모달 DIV 시작 --%>
	<%-- <form action="air_update.do" method="post">
	   <c:forEach items="${airlist}" var="airlist">
		<div class="modal fade" id="airplaneModify" tabindex="-1" role="dialog"
			aria-labelledby="airplaneInfoTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="airplaneInfoTitle">내 항공권 수정하기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					
					<div class="modal-body">
					   <input type="hidden" name="air_Code" value="${airlist.air_Code}">
						       출국지: <input type="text" name="dep_Loca1" value="${airlist.dep_Loca1}"><br>
						       출국 도착지 : <input type="text" name="dep_Loca2" value="${airlist.dep_Loca2}"><br>
						       출국날짜 : <input type="text" name="dep_Date1" value="${airlist.dep_Date1}" id="Start_date3"><br>
						       출국 도착날짜 : <input type="text" name="dep_Date2" value="${airlist.dep_Date2}" id="End_date3"><br>
						       출국 출발시간 : <input type="text" name="dep_Time1" value="${airlist.dep_Time1}"><br>
						       출국 도착시간 : <input type="text" name="dep_Time2" value="${airlist.dep_Time2}"><br>
						       귀국출발지 : <input type="text" name="re_Loca1" value="${airlist.re_Loca1}"><br>
						       귀국도착지 : <input type="text" name="re_Loca2" value="${airlist.re_Loca2}"><br>
						       귀국출발날짜 : <input type="text" name="re_Date1" value="${airlist.re_Date1}" id="Start_date4"><br>
						       귀국도착날짜 : <input type="text" name="re_Date2" value="${airlist.re_Date2}" id="End_date4"><br>
						       귀국출발시간 : <input type="text" name="re_Time1" value="${airlist.re_Time1}"><br>
						       귀국도착시간 : <input type="text" name="re_Time2" value="${airlist.re_Time1}">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btn-outline-primary" id="updateAirBtn">완 료</button>
					</div>
				</div>
			</div>
		</div>
	  </c:forEach>
	</form> --%>
	<%-- 항공권 수정 모달 DIV 끝--%>
	
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">	
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
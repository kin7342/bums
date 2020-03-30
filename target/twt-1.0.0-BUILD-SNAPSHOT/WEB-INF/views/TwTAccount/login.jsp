<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".info_box").hide();
});

// 회원가입 아이디 실시간 중복확인 ajax
function checkID() {
	
	$("#id_check").show();
	
	// input 태그에 입력한 내용 변수에 담음
	var input = $("input[name=m_Id]").val();
	
	$.ajax({
		url:"idChk.do?m_Id="+input,
		type:"GET",
		dataType:"json",
		contentType:"application/json",
		success : function(data){
			if(data.check == '1') {
				$("#id_check").text("이미 사용중인 아이디입니다.");
				$("#id_check").css("color","red");
				$("#submit").attr("disabled","true");
			} else {
				$("#id_check").text("사용 가능한 아이디입니다.");
				$("#id_check").css("color","green");
				$("#submit").removeAttr("disabled");
			}
		}, error:function(){
			console.log("에러입니다.");
		}
	});
}

// 회원가입 이메일 형식 실시간 검사 
function checkEmail() {
	$("#email_check").show();
	
	var email = $("input[name=m_Email]").val();
	console.log(email);
	
	if(email != 0){
		if(isValidEmailAddress(email)) {
			$("#email_check").css("color","green");
			$("#email_check").text("올바른 이메일 형식입니다.");
		} else {
			$("#email_check").css("color","red");
			$("#email_check").text("이메일 형식으로 확인해주세요.");
		}
	}
}

// 회원가입 이메일 형식 정규화
function isValidEmailAddress(emailAddress) {
	var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
	return pattern.test(emailAddress);
}

// 회원가입 이름 검사
function checkName() {
	$("#name_check").show();
	
	for(var i=0; i<$("input[name=m_Name]").val().length; i++){
		var name = $("input[name=m_Name]").val().substring(i,i+1);
		if(name.match(/[0-9]|[a-z]|[A-Z]/)) {
			$("#name_check").css("color","red");
			$("#name_check").text("이름을 정확히 입력해주세요");
		} else if(name.match(/([^가-힣\x20])/i)) {
			$("#name_check").css("color","red");
			$("#name_check").text("이름을 정확히 입력해주세요");
		} else if($("input[name=m_Name]").val() == "") {
			$("#name_check").css("color","red");
			$("#name_check").text("이름을 정확히 입력해주세요");
		} else if($("input[name=m_Name]").val().length <= 1) {
			$("#name_check").css("color","red");
			$("#name_check").text("이름을 정확히 입력해주세요");
		} else {
			$("#name_check").css("color","green");
			$("#name_check").text("이름을 정확히 입력하셨습니다");
		}
	}
}

// 회원가입 비밀번호 유효성 검사
function checkPwd() {
	$("#pass_check").show();
	
	var pwd = $("input[name=m_Pass]").val();
	
	 if(!/^[a-zA-Z0-9!@#$%^&*()?_~]{4,8}$/.test(pwd)) {
		$("#pass_check").css("color","red");
		$("#pass_check").text("비밀번호는 숫자, 영문, 특수문자 조합으로 4~8자리를 사용해야 합니다");
	 } else {
		 $("#pass_check").css("color","green");
		 $("#pass_check").text("사용 가능한 비밀번호입니다");
	 }
}

// 회원가입 비밀번호 재 검사
function checkPwd_Chk() {
	$("#pass_check2").show();
	
	if($("input[name=m_Pass]").val() != $("input[name=m_Pass_chk]").val()) {
		$("#pass_check2").css("color","red");
		$("#pass_check2").text("비밀번호를 확인해주세요");
	} else {
		$("#pass_check2").css("color","green");
		$("#pass_check2").text("비밀번호가 일치합니다");
	}
}

// 회원가입 폼 유효성 검사
function form_chk() {
	var id = $("input[name=m_Id]").val();
	var email = $("input[name=m_Email]").val();
	var name = $("input[name=m_Name]").val();
	var pwd = $("input[name=m_Pass]").val();
	var pwd2 = $("input[name=m_Pass_chk]").val();
	
	if(id == null || id == "") {
		alert("아이디를 입력해주세요");
		$("input[name=m_Id]").focus();
		return false;
	} else if (email == null || email == "") {
		alert("이메일을 입력해주세요");
		$("input[name=m_Email]").focus();
		return false;
	} else if (name == null || name == "") {
		alert("이름을 입력해주세요");
		$("input[name=m_Name]").focus();
		return false;
	} else if (pwd == null || pwd == "") {
		alert("비밀번호를 입력해주세요");
		$("input[name=m_Pass]").focus();
		return false;
	} else if (pwd2 == null || pwd2 == "") {
		alert("비밀번호 확인을 입력해주세요");
		$("input[name=m_Pass_chk]").focus();
		return false;
	} else {
		return true;
	}
}

// 로그인 유효성 검사
</script>
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	background-color: #F85959;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: 'Montserrat', sans-serif;
	height: 100vh;
	margin: 0;
}

h1 {
	font-weight: bold;
	margin: 0;
}

h2 {
	text-align: center;
}

p {
	font-size: 14px;
	font-weight: 100;
	line-height: 20px;
	letter-spacing: 0.5px;
	margin: 20px 0 30px;
}

span {
	font-size: 12px;
}

a {
	color: #333;
	font-size: 14px;
	text-decoration: none;
	margin: 15px 0;
}

button {
	border-radius: 20px;
	border: 1px solid #fc3c3c;
	background-color: #fc3c3c;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

button:active {
	transform: scale(0.95);
}

button:focus {
	outline: none;
}

button.ghost {
	background-color: transparent;
	border-color: #FFFFFF;
}

button.ghost2 {
	background-color: transparent;
	border: 2px solid #FFFFFF;
}

form {
	width: 600px;
	background-color: #FFFFFF;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 100px;
	height: 100%;
	text-align: center;
}

input {
	background-color: #f2f2f2;
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	position: relative;
	overflow: hidden;
	width: 960px;
	max-width: 100%;
	min-height: 600px;
}

.form-container {
	position: absolute;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-in-container {
	left: 0;
	width: 50%;
	z-index: 2;
}

.container.right-panel-active .sign-in-container {
	transform: translateX(100%);
}

.sign-up-container {
	left: 0;
	width: 50%;
	opacity: 0;
	z-index: 1;
}

.container.right-panel-active .sign-up-container {
	transform: translateX(75%);
	opacity: 1;
	z-index: 5;
	animation: show 0.6s;
}

@
keyframes show { 0%, 49.99% {
	opacity: 0;
	z-index: 1;
}

50%,
100%
{
opacity


:

 

1;
z-index


:

 

5;
}
}
.overlay-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 37.5%;
	height: 100%;
	overflow: hidden;
	transition: transform 0.6s ease-in-out;
	z-index: 100;
	margin-left: 120px;
}

.container.right-panel-active .overlay-container {
	transform: translateX(-167%);
}

.overlay {
	background-position: 0 0;
	color: #FFFFFF;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
	transform: translateX(50%);
}

.overlay-panel {
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
	text-align: center;
	top: 0;
	height: 100%;
	width: 50%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.overlay-left {
	width: 360px;
	background-image:
		url("${pageContext.request.contextPath}/resources/images/account/login_key.jpg");
	background-size: cover;
}

.container.right-panel-active .overlay-left {
	transform: translateX(0);
}

.overlay-right {
	right: 0;
	transform: translateX(0);
	width: 360px;
	background-image:
		url("${pageContext.request.contextPath}/resources/images/account/login_key.jpg");
	background-size: cover;
}

.container.right-panel-active .overlay-right {
	transform: translateX(20%);
}

.social-container {
	margin: 20px 0;
}

.social-container a {
	border: 1px solid #DDDDDD;
	border-radius: 50%;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	margin: 0 5px;
	height: 50px;
	width: 50px;
}

footer {
	background-color: #222;
	color: #fff;
	font-size: 14px;
	bottom: 0;
	position: fixed;
	left: 0;
	right: 0;
	text-align: center;
	z-index: 999;
}

footer p {
	margin: 10px 0;
}

footer i {
	color: red;
}

footer a {
	color: #3c97bf;
	text-decoration: none;
}

a:hover {
	color: #fc3c3c;
}

.info_box { width:100%; 
            height:20px;
            line-height:20px;
            font-size:10px;
            text-align:left !important;
            padding-left:20px;
          }
</style>
<title>TWT - Login</title>
</head>
<body>
	<div class="container" id="container">
	    <%-- 회원가입 시작 --%>
		<div class="form-container sign-up-container">
			<form action="createAccount.do" id="createAccount" method="post" onsubmit="return form_chk()">
				<img src="${pageContext.request.contextPath}/resources/images/account/register.png" width="40">
				<h1>Create Account</h1>
				<br>
					<input type="text" name="m_Id" oninput="checkID()" placeholder="ID" style="border-left: 3px solid #fc3c3c;" />
					<div class="info_box" id="id_check"></div>
					
					<input type="text" name="m_Email" oninput="checkEmail()" placeholder="Email" style="border-left: 3px solid #fc3c3c;" />
					<div class="info_box" id="email_check"></div>
					
					<input type="text" name="m_Name" oninput="checkName()" placeholder="Name" style="border-left: 3px solid #fc3c3c;" />
					<div class="info_box" id="name_check"></div>
					
					<input type="password" name="m_Pass" oninput="checkPwd()" placeholder="Password" style="border-left: 3px solid #fc3c3c;" />
					<div class="info_box" id="pass_check"></div>
					
					<input type="password" name="m_Pass_chk" oninput="checkPwd_Chk()" placeholder="Password Check" style="border-left: 3px solid #fc3c3c;" />
					<div class="info_box" id="pass_check2"></div>
					<br>
				<button id="submit" type="submit">Sign Up</button>
			</form>
		</div>
		<%-- 회원가입 끝 --%>
		
		<%-- 로그인 시작 --%>
		<div class="form-container sign-in-container">
			<form action="enter.do" method="post">
				<img src="${pageContext.request.contextPath}/resources/images/account/lock.png" width="40">
				<h1>LOGIN</h1>
				<div class="social-container">
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=58faa2c546eff8d4a5bed528981dba5b&redirect_uri=http://localhost:8787/twt/kakaologin.do&response_type=code" class="social" >
					<img src="${pageContext.request.contextPath}/resources/images/account/kakao.png" style="border-radius: 50px;">
					</a>
					<a href="${url}" class="social"><img src="${pageContext.request.contextPath}/resources/images/account/naver.png" style="border-radius: 50px;"></a>
					<a href="#" class="social"><img src="${pageContext.request.contextPath}/resources/images/account/google.png" style="border-radius: 50px;"></a>
				</div>
				<input type="text" name="m_Id" placeholder="ID" style="border-left: 3px solid #fc3c3c;" />
				<input type="password" name="m_Pass" placeholder="Password" style="border-left: 3px solid #fc3c3c;" />
				<a href="#" style="font-size: 12px; margin-right: -280px;" class="find">Forgot your password?</a>
				<button type="submit">Sign In</button>
			</form>
		</div>
		<%-- 로그인 끝 --%>
		
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your personal
						info</p>
					<button class="ghost2" id="signIn" style="margin-top: 280px;">Sign
						In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Enter your personal details and start journey with us</p>
					<button class="ghost2" id="signUp" style="margin-top: 190px;">Sign
						Up</button>
				</div>
			</div>
		</div>
	</div>

	<%-- 로그인 판넬 이동 자바스크립트 시작 --%>
	<script type="text/javascript">
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});
<%-- 로그인 판넬 이동 자바스크립트 끝 --%>
</script>
</body>
</html>
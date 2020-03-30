<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/chat.js"></script>

  <script src="http://localhost:3000/socket.io/socket.io.js"></script>

	<script>
	
		$(document).ready(function(){
			var userId = "<%=session.getAttribute("userId")%>"
			var room = ['defalt','방콕으로 여행~','치앙마이 모여라!','파타야에서 파티야~','푸켓풉키'];
			var num = 0;
			
			if(userId != "null"){
			    var socket = io("http://localhost:3000");

			    $("#room1").click(function(){
			    	$("#chat").empty();
			    	
			    	$('<div class="pic stark"></div>').appendTo(".contact bar");
			    	$('<div class="name"></div>').text(room[1]).appendTo(".contact bar");
					
			    	socket.emit('leaveRoom', num, userId);
					num = 1;
					socket.emit('joinRoom', num, userId);
				});
			    
			    $("#room2").click(function(){
			    	$("#chat").empty();
			    	
			    	$('<div class="pic stark"></div>').appendTo(".contact bar");
			    	$('<div class="name"></div>').text(room[2]).appendTo(".contact bar");
			    	
			    	socket.emit('leaveRoom', num, userId);
					num = 2;
					socket.emit('joinRoom', num, userId);
				});
			    
			    $("#room3").click(function(){
			    	$("#chat").empty();
			    	
			    	$('<div class="pic stark"></div>').appendTo(".contact bar");
			    	$('<div class="name"></div>').text(room[3]).appendTo(".contact bar");
			    	
			    	socket.emit('leaveRoom', num, userId);
					num = 3;
					socket.emit('joinRoom', num, userId);
				});
			    
			    $("#room4").click(function(){
			    	$("#chat").empty();
			    	
			    	$('<div class="pic stark"></div>').appendTo(".contact bar");
			    	$('<div class="name"></div>').text(room[4]).appendTo(".contact bar");
			    	
			    	socket.emit('leaveRoom', num, userId);
					num = 4;
					socket.emit('joinRoom', num, userId);
				});
	
	            $("#msg").keydown(function(key){
	                //해당하는 키가 엔터키(13) 일떄
	                if(key.keyCode == 13){
	                    //msg_process를 클릭해준다.
	                    msg_process.click();
	                }
	            });
	
	            //메세지 전송
	            $("#msg_process").click(function(){
	                //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
	                 socket.emit("send_msg", num, $("#msg").val(), userId);
	                //#msg에 벨류값을 비워준다.
	                $("#msg").val("");
	            });
	            
	            //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
	            socket.on('send_msg', function(msg, Id) {
	            	if(userId == Id){
		                //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
		                $('<div class="message parker"></div>').text(Id + " : " + msg).appendTo("#chat");
		                $("#chat").scrollTop($("#chat").innerHeight());
	            	} else {
		                $('<div class="message stark"></div>').text(Id + " : " + msg).appendTo("#chat");
		                $("#chat").scrollTop($("#chat").innerHeight());
	            	}
	            });
	            
	            socket.on('leaveRoom', function(num, Id){
	            	if(num != 0){
	            		$('<div class="time"></div>').text(Id+ ' 님이 ' + room[num] + '방에서 퇴장하였습니다.').appendTo("#chat");
	            	}
	            });
	            
				socket.on('joinRoom', function(num, Id){
					$('<div class="time"></div>').text(Id+ ' 님이 ' + room[num] + '방에 입장하였습니다.').appendTo("#chat");
	            });
			}
		});
	</script>

<script type="text/javascript">
$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	var chatPosition = parseInt($("#chats").css('top'));
	
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		var newPosition2 = scrollTop + chatPosition + "px";
		/* 애니메이션 없이 바로 따라감
		$("#floatMenu").css('top', newPosition);
		*/
		 
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);

		$("#chats").stop().animate({
		"top" : newPosition2
		}, 500);
		 
	}).scroll();
	
	hideChat();

	$('#prime').click(function() {
		var userId = "<%=session.getAttribute("userId")%>"
		if(userId == "null"){
			alert("로그인 페이지로 이동합니다.");
			location.href="login.do";
		} else{
			$(".center").toggle();
		}
	});

});

	/* chat */
	function hideChat() {
		$('.center').css('display', 'none');
	    };
	/* chat */
</script>
<style type="text/css">
#floatMenu {
position: absolute;
width: 4%;
height: 41%;
left: 93%;
bottom: 1%;
}
.side { 
width:55px;
height:55px;
border-radius:50%;
background-color:#393e46;
margin-bottom:20%;
cursor:pointer;
}
/* .side { 
width:55px;
height:55px;
border-radius:50%;
background-color:#393e46;
margin-bottom:20px;
cursor:pointer;
} */
</style>
</head>
<body>
<!-- chat -->
<div class="center" id="chats">
  <div class="contacts" style="overflow: auto;" id="chatlist">
    <div style="padding-bottom: 40px;">
    <i class="fas fa-bars fa-2x"><a href="#"></a></i>
	</div>
	
	<!-- 채팅방 start -->
    <div class="contact">
      <div class="pic Bangkok"></div>
<!--   
	  <div class="badge">
        14
      </div>
-->
      <div class="name">
		<h6>방콕으로 여행~</h6>
		<div style="text-align: right">
		<i class="fas fa-plus fa-2x" id="room1"><a href="#"></a></i>
		</div>
      </div>
<!--       
      <div class="message">
        That is America's ass 🇺🇸🍑
      </div>
-->
    </div>
    <div class="contact">
      <div class="pic ChiangMai"></div>
<!--   
	  <div class="badge">
        14
      </div>
-->
      <div class="name">
		<h6>치앙마이 모여라!</h6>
		<div style="text-align: right">
		<i class="fas fa-plus fa-2x" id="room2"><a href="#"></a></i>
		</div>
      </div>
<!--       
      <div class="message">
        That is America's ass 🇺🇸🍑
      </div>
-->
    </div>
    <div class="contact">
      <div class="pic Pattaya"></div>
<!--   
	  <div class="badge">
        14
      </div>
-->
      <div class="name">
		<h6>파타야에서 파티야~</h6>
		<div style="text-align: right">
		<i class="fas fa-plus fa-2x" id="room3"><a href="#"></a></i>
		</div>
      </div>
<!--       
      <div class="message">
        That is America's ass 🇺🇸🍑
      </div>
-->
    </div>
    <div class="contact">
      <div class="pic Phuket"></div>
<!--   
	  <div class="badge">
        14
      </div>
-->
      <div class="name">
		<h6>푸켓풉키</h6>
		<div style="text-align: right">
		<i class="fas fa-plus fa-2x" id="room4"><a href="#"></a></i>
		</div>
      </div>
<!--       
      <div class="message">
        That is America's ass 🇺🇸🍑
      </div>
-->
    </div>

    <!-- 채팅방 end -->
    
  </div>
  <div class="chat">
  	<!-- 채팅방 정보 -->
    <div class="contact bar">
<!-- 
      <div class="pic stark"></div>
      <div class="name">
        Tony Stark
      </div>
      <div class="seen">
        Today at 12:56
      </div>
-->
    </div>
    
    <div class="messages" id="chat" style="height: 100%">
      <!-- 날짜 -->
      <div class="time">
		채팅방에 참여하여  채팅을 시작해주세요
      </div>

<!-- 
      <div class="message stark">
        <div class="typing typing-1"></div>
        <div class="typing typing-2"></div>
        <div class="typing typing-3"></div>
      </div>

 -->
     </div>
    <div class="input">
      <!-- 
      <i class="fas fa-camera"></i>
      <i class="far fa-laugh-beam"></i>
       -->
      <input placeholder="메세지 입력" type="text" id="msg"/>
      <button id="msg_process" style="border: 0; outline: 0; background-color: rgba(0,0,0,0);"><i class="fas fa-comment"></i></button>
    </div>
  </div>
</div>
<!-- chat -->

<div id="floatMenu" style="z-index: 10">
   <a href="#body">
	   <div class="side">
	     <i class="fas fa-arrow-up fa-2x" style="color:white; margin-left:15px; margin-top:13px;"></i>
	   </div>
   </a>
   
   <div class="side" id="prime">
    <i class="far fa-comment-dots fa-2x" style="color:white; margin-left:13.5px; margin-top:12.5px;"></i>
   </div>
   
   <div id="frogue-container" class="position-right-bottom" style="margin-left:13.5px;"
      data-chatbot="9ab40948-b4ff-48bc-9d83-7c67a7809af9"
      data-user="사용자ID"
      data-init-key="value"
      ></div>
   
   <a href="#footer">
	   <div class="side">
	     <i class="fas fa-arrow-down fa-2x" style="color:white; margin-left:15px; margin-top:13px;"></i>
	   </div>
   </a>
</div>
<!-- <script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('d3c7b1de1797e1b67988df559b0c2a0c');
    function chatChannel() {
      Kakao.Channel.chat({
        channelPublicId: '_IxkKTxb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
      });
    }
  //]]> 
</script> -->

<!-- data-init-식별키=값 으로 셋팅하면 챗플로우에 파라미터와 연동가능. 식별키는 소문자만 가능 -->
<script>
(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));
</script>
</body>
</html>
var express = require('express');
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);

var room = ['defalt','room1','room2','room3','room4'];

//페이지를 get으로 요청을 했을때.
app.get('/', function (req, res) {
    //아래와 같은 메시지를 출력
    res.send('<h1>안녕하세요 "/" 경로 입니다.</h1>');
});

io.on('connection', function(socket){
	  console.log('user connected : ', socket.id);

	  socket.on('disconnect', function () {
    	  console.log('user disconnected : ', socket.id);
      });
	  
	  socket.on('joinRoom', function(num, name){
		  socket.join(room[num], function(){
			 console.log(name + 'join a ' + room[num]); 
			 io.to(room[num]).emit('joinRoom', num, name);
		  });
	  });
	  
	  socket.on('leaveRoom', function(num, name){
		  socket.leave(room[num], function(){
			  console.log(name + ' leave a ' + room[num]);
		      io.to(room[num]).emit('leaveRoom', num, name);
		  });
	  });
	  
	  
      socket.on('send_msg', function (num, msg, userId) {
          //콘솔로 출력을 한다.
          console.log(num, msg, userId);
          //다시, 소켓을 통해 이벤트를 전송한다.
          io.to(room[num]).emit('send_msg', msg, userId);
      });

	});
 
http.listen(3000, function () {
    //콘솔창에 출력
    console.log('listening on *:3000');
});


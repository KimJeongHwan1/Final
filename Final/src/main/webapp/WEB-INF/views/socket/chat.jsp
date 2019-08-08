<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>
.chatarea {

	/* margin-left : 20%; */
	margin : auto;
	width : 80%;
	height : 330px;
		
	font-size : 20px;
}
.chatbtn {
	width: 80%;
	height : 420px;
}
</style>



<!-- WebSocket : sock.js CDN -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script> -->

</head>
<body>



<!-- <div class="form-control chatarea"> -->
<!-- 	<ul class="list-group list-group-flush " id="data"> -->
	
	<c:forEach items="${view }" var="i">
	${i.sender} : ${i.content }<br>
	
	</c:forEach>
	
	
<!-- 	</ul> -->
<!-- </div> -->
<!-- <br><br><br> -->

<!-- <div class="chatbtn" > -->
<%--   <div id="id" style="width :10%; float:left; ">내아이디 : ${myid }</div> --%>
  
<!-- <div class="input-group mb-3" > -->
<!--   <input type="text" id="message" class="form-control" placeholder="Message" style=" width : 300px; float:left;">&nbsp;&nbsp; -->
<!--   <div class="input-group-append " style="padding: 0px; margin-left: 20px; width:15%; float: left;"> -->
<!--     <button id="sendBtn" class="btn btn-outline-secondary " type="button" >Send</button> -->
  
<!--   </div> -->
<!-- </div> -->
<!-- </div> -->

<script type="text/javascript">
$(document).ready(function() {
//        $("#sendBtn").click(function() {
//                sendMessage(); 
//                $('#message').val('')
//        });
//        $("#message").keydown(function(key) {
//                if (key.keyCode == 13) {// 엔터
//                       sendMessage();
//                       $('#message').val('')
//                }
//        });


	$("#sendBtn").click(function(e){
		sendMessage(); 
		$('#message').val('')
		
		$("#message").focus()
	});
	
    $("#message").keydown(function(key) {
        if (key.keyCode == 13) {// 엔터
        	sendMessage();
        	$('#message').val('')
        }
        
        $("#message").focus()

	});
});


// 웹소켓을 지정한 url로 연결한다.
// let ws = new WebSocket("ws://"+window.location.host+"${pageContext.request.contextPath}/echo"); //WebSocket사용
let ws = new SockJS("<c:url value='/echo'/>"); //SockJs 사용
ws.onopen = onOpen;
ws.onmessage = onMessage;
ws.onclose = onClose;

function onOpen(){
	console.log('websocket opened');
}

// 서버로부터 메시지를 받았을 때
function onMessage(msg) {
       var data = msg.data;
       $("#data").append(data + "<br>");
}

// 서버와 연결을 끊었을 때
function onClose(evt) {
       $("#data").append("연결 끊김");
}

//메시지 전송
function sendMessage() {
    ws.send($("#message").val());
}

</script>


</body>
</html>

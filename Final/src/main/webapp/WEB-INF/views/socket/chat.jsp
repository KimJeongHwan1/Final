<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
.chatarea {

	margin : auto;
	width : 500px;
	height : 500px;
	
	overflow : scroll;
	
	
}
.chatbtn {
	margin : auto;
}
</style>



<!-- WebSocket : sock.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>

</head>
<body>


<div>
	<ul class="list-group list-group-flush chatarea" id="data">
	
	<c:forEach items="${view }" var="i">
	${i.sender} : ${i.content }<br>
	
	</c:forEach>
	
	
	</ul>
</div>


<div class="input-group mb-3 chatbtn">
  <span id="id">${myid }</span>
  
  <input type="text" id="message" class="form-control" placeholder="Message">
  <div class="input-group-append" style="padding: 0px;">
    <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
  
  </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
       $("#sendBtn").click(function() {
               sendMessage(); 
               $('#message').val('')
       });
       $("#message").keydown(function(key) {
               if (key.keyCode == 13) {// 엔터
                      sendMessage();
                      $('#message').val('')
               }
       });
});


// 웹소켓을 지정한 url로 연결한다.
// var ws = new WebSocket("ws://"+window.location.host+"${pageContext.request.contextPath}/echo"); //WebSocket사용
var ws = new SockJS("<c:url value='/echo'/>"); //SockJs 사용
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


<c:import url="/WEB-INF/views/layout/footer.jsp" />


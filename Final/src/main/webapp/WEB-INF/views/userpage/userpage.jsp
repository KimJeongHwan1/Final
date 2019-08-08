<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#follow_btn").click(function(e){ 
		$.ajax({
			type: "get"
			, url: "/userpage/following?user_id=${user_id }"
			, data:	{}
			, dataType: "html"
			, success: function( res ) {
				$("#follow_msg").html(res);
				console.log("성공");
			
			}
			, error: function() {
				console.log("실패");
			}
		});   
	});
  }); 

// 채팅
$(document).ready(function() {
	
	$('#area').hide();
	$('#chat').click(function(){
		$.ajax({
			type : "get"
			, url : "/socket/chat?userid=${user_id}"
			, data :{}
			, dataType : "html"
			, success : function ( res ) {
				$("#data").html(res);
				console.log("성공");
			}		
			, error : function() {
				console.log("실패");
			}
		});

	    var state = $('#area').css('display');
	    if(state == 'none'){
	        $('#area').show();
	    }else{
	        $('#area').hide();
	    }

	});
	
// 	$("#sendBtn").click(function(e){
	
//      sendMessage(); 
//      $('#message').val('')
//      $("#message").focus()
// // 		$.ajax({
// // 			type : "get"
// // 			, url : "/socket/chat?userid=${user_id}"
// // 			, data :{}
// // 			, dataType : "html"
// // 			, success : function ( res ) {
// // 				$("#data").html(res);
// // 				console.log("성공");
// // 			}		
// // 			, error : function() {
// // 				console.log("실패");
// // 			}
// // 		});
// 	});
//     $("#message").keydown(function(key) {
//         if (key.keyCode == 13) {// 엔터
//                sendMessage();
//                $('#message').val('')
//         }
//         $("#message").focus()

// 	});
});

// var ws = new SockJS("<c:url value='/echo'/>"); //SockJs 사용
// ws.onopen = onOpen;
// ws.onmessage = onMessage;
// ws.onclose = onClose;

// function onOpen(){
// 	console.log('websocket opened');
// }

// // 서버로부터 메시지를 받았을 때
// function onMessage(msg) {
//        var data = msg.data;
//        $("#data").append(data + "<br>");
// }

// // 서버와 연결을 끊었을 때
// function onClose(evt) {
//        $("#data").append("연결 끊김");
// }

// //메시지 전송
// function sendMessage() {
//     ws.send($("#message").val());
// }






//윈도우 팝업
function wrapWindowByMask(){
	 
//화면의 높이와 너비를 구한다.
var maskHeight = $(document).height();  
var maskWidth = $(window).width();  

//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
$("#mask").css({"width":maskWidth,"height":maskHeight});  

//애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

$("#mask").fadeIn(0);      
$("#mask").fadeTo("slow",0.5);    

//윈도우 같은 거 띄운다.
$(".window").show();

}

$(document).ready(function(){
//검은 막 띄우기
$(".openMask").click(function(e){
 e.preventDefault();

 console.log($(this))
 console.log($(this).attr("href"))
 
 $.ajax({
	type:"get"
	, url: $(this).attr("href")
 	, dataType: "html"
 	, success: function( h ) {
 		console.log("s")
 		$(".window").html( h );
 	}
 	, error: function() {
 		console.log("e")
 	}
 });
 
 wrapWindowByMask();
});


//닫기 버튼을 눌렀을 때
$(".window .close").click(function (e) {  
 //링크 기본동작은 작동하지 않도록 한다.
 e.preventDefault();  
 $("#mask, .window").hide();  
});       

//검은 막을 눌렀을 때
$("#mask").click(function () {  
 $(this).hide();  
 $(".window").hide();  

});      


});

</script>

<style type="text/css">
/* 네비게이션바 테이블 */
table {
	border-collapse: collapse;
/* 	border-top: 3px solid black; */
/* 	border-bottom: 3px solid black; */
	width:auto;
	text-align : center;
	font-family: 'Jua', sans-serif;
	font-size:25px;
}
.table th, td{
/*  	border: 1px solid #ddd; */
 	padding: 10px;
 	text-align:center;
 	border-radius: 1px; 
}
/* #282c37 */
th{
	background-color : #FFFFFF;
	font-color : #FFFFFF;
}
.table th:hover{
	background: #FFFFFF;
}
.table th:first-child, td:first-child{
 	border-left: 0;
 	background-color:#E6E6E6;
}
.table th:last-child, td:last-child{
 	border-right: 0;
}
#userprofilimg{
	margin-right: 50px;
	width: 100px;
	height: 100px;
	margin-left : 50px;
}
#see_menu_menu2{
	margin-left : 300px;
	text-align : center;
}
#see_menu_table2 td{
	text-align : center;
}
#btn_div{
	text-align: center;
}
#btn_div button{
	width: 100px;
	height: 30px;
}
.list_img{
	width: 250px;
	height: 200px;
	margin: 0 auto;
	margin-bottom: 10px;
	margin-top: 10px;
}
#user_write_div{
	margin-left: 300px;
	width: 1000px;
}
#user_write_list{
	width: 280px;
	text-align: center;
	border: 1px solid black;
	float: left;
	margin-left: 50px;
	margin-bottom: 50px;
}


/* 윈도우 마스크 */
.container {
	border-left : 1px solid #eee;
	border-right : 1px solid #eee;
}


/* 마스크 뛰우기 */
#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 
/* 팝업으로 뜨는 윈도우 css  */ 

.window{
    display: none;
    position:absolute;  
    left:36.5%;
    top:50px;
    margin-left: -500px;
    width:1500px;
    height:800px;
    background-color:#FFF;
    z-index:10000;
    
    overflow: scroll;
 }
#content {
	height: 200px;
	width: 250px;
}

.chatarea {
	/* margin-left : 20%; */
	margin : auto;
	width : 80%;
	height : 330px;
	
	font-size : 20px;
	overflow: scroll;
}
.chatbtn {
	margin : auto;
}
#area {
	border: 1px solid black;
	position: fixed;
	top: 500px;
	right: 50px;
	width : 420px;
	height : 450px;
	background-color: #F2F2F2;
}
</style>

<div id="see_menu_menu2">
<table id="see_menu_table2" style="margin-top: 50px;">
<tr>
	<c:if test="${bool == false }">
		<td rowspan="2" style="padding: 10px;"><img src="${paceContext.request.contextPath}/resources/img/img4.jpg" id="userprofilimg"/></td>
		<td>${user_id }
			<c:if test="${check == 1 }">
				<button id="follow_btn" type="button"><span id="follow_msg">팔로우</span></button>
			</c:if>
			<c:if test="${check == 0 }">
				<button id="follow_btn" type="button"><span id="follow_msg">언팔로우</span></button>
			</c:if>
		</td>
		<td><a id="chat">채팅하기</a></td>
	</c:if>	
	<c:if test="${bool == true }">
		<td rowspan="2" style="padding: 10px;"><img src="/upload/${img.storedname }" id="userprofilimg"/></td>
		<td>${user_id }
			<c:if test="${check == 1 }">
				<button id="follow_btn" type="button"><span id="follow_msg">팔로우</span></button>
			</c:if>
			<c:if test="${check == 0 }">
				<button id="follow_btn" type="button"><span id="follow_msg">언팔로우</span></button>
			</c:if>
		</td>
		<td ><a id="chat">채팅하기</a></td>
	</c:if>
</tr>
</table>
<table>
<tr>
	<td style="padding: 10px;"><label style="width: 200px;font-size: 15px; font-weight: 50;">이름</label> </td>
	<td style="padding: 10px;">${member.member_name }</td>
</tr>


<tr>
	<td style="padding: 10px;"><label style="width: 200px; font-size: 15px; font-weight: 50;">이메일</label> </td>
	<td style="padding: 10px;">${member.member_email }</td>
</tr>

</table>
</div>
<hr>

<div  >
<div id="user_write_div">
<c:set var="n" value="0"/>
<c:set var="m" value="1"/>
<c:forEach items="${write }" var="i">
<c:set var="sum" value="${n + m }"/>
<div id="user_write_list">

<c:if test="${i.originname != null }">
<a href="/userpage/view?content_no=${i.content_no }" class="openMask"><img src="/uppage/${i.storedname }" id="file_img${sum }" class="list_img"/></a><br>
</c:if>
<c:if test="${i.originname eq null }">
<a href="/userpage/view?content_no=${i.content_no }" class="openMask"><img src="${paceContext.request.contextPath}/resources/img/NoImg.png"class="list_img"/></a><br>
</c:if>

<span id="" class="glyphicon glyphicon-heart-empty"> ${i.hit } </span>
<span id="" class="glyphicon glyphicon-pencil"> ${i.comm_count } </span>
<span id="" class="glyphicon glyphicon-star-empty"> ${i.good }  </span>
</div>
<c:set var="n" value="${sum }"/>
</c:forEach>

<div id="block" style="width: 100%; clear: both;"></div>

<div id="area">

<div id="chatarea"></div>


<div class="form-control chatarea" style="margin-top: 15px;">
	<ul class="list-group list-group-flush " id="data">
	
	<c:forEach items="${view }" var="i">
	${i.sender} : ${i.content }<br>
	
	</c:forEach>
	
	
	</ul>
</div>
<br><br><br>

<div class="chatbtn" style="margin: 0 auto; margin-bottom: 15px;">
  <span id="id" style="float: left; font-size: 20px;">${myid }</span>
  
  <input type="text" id="message" class="form-control" placeholder="Message" style=" margin-left: 10px; width : 200px; float: left;">
  
<!-- <div class="input-group mb-3" > -->
  
  <span class="input-group-append " style="padding: 0px; margin-left: 20px; width:25%;">
    <button id="sendBtn" class="btn btn-outline-secondary " type="button" >Send</button>
  
<!--   </div> -->
  
  
</span>
</div>


</div>
</div>
<div id ="container">
<div id="mask"></div>
<div class="window">
   <p style="text-align:center; background:#ffffff; padding:20px;"><a href="#" class="close">닫기X</a></p>
</div>
</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />


<script type="text/javascript">
$(document).ready(function() {
	/* InitializeStaticMenu(); */
	
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
/* 메뉴 네비게이션바 */

#STATICMENU {
	width: 200px;
	margin: 0pt;
	width: 200px;
	padding: 0pt;  
	position: absolute; 
	left: 50px;
	top: 0px;
}
/* 네비게이션바 테이블 */
table {
	border-collapse: collapse;
/* 	border-top: 3px solid black; */
/* 	border-bottom: 3px solid black; */
	width:auto;
	text-align : center;
}
.table th, td{
/*  	border: 1px solid #ddd; */
 	padding: 10px;
 	text-align:center;
}

th{
	background-color : #282c37;
	color : #282c37;
}
.table th:hover{
	background: #F2F2F2;
}
.table th:first-child, td:first-child{
 	border-left: 0;
 	background-color:#d9e1e8;
}
.table th:last-child, td:last-child{
 	border-right: 0;
}
.statictable{
	font-size: 13px;
 	color: #ccc; 
}
/* 네비게이션바 테이블 */

.reservestep {
	margin: 0 5% 5% 230px;
	width: auto;
	text-align: left;
/* 	height: 60%; */
}
#choose_menu div{
	height: 5px;
}
#choose_menu label{
	font-size: 20px;
	font-weight: bold;
	margin-top: 10px;
	margin-left: 15px;
}
img{
	margin-right: 50px;
	width: 100px;
	height: 100px;
	margin-left : 50px;
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
/* #see_menu_table tr{ */
/* 	margin-top: 30px; */
/* } */
/* #see_menu_table2 tr{ */
/* 	margin-top: 30px; */
/* } */
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


</style>

<div id="see_menu_menu2">
<form action="/member/updateInfo" method="post" enctype="multipart/form-data">
<table id="see_menu_table2" style="margin-top: 50px;">

<tr>
	<c:if test="${bool == false }">
		<td rowspan="2"><img src="${paceContext.request.contextPath}/resources/img/img4.jpg" id="userprofilimg"/></td>
		<td>${user_id }
			<c:if test="${check == 1 }">
				<button id="follow_btn" type="button"><span id="follow_msg">팔로우</span></button>
			</c:if>
			<c:if test="${check == 0 }">
				<button id="follow_btn" type="button"><span id="follow_msg">언팔로우</span></button>
			</c:if>
		</td>
	</c:if>	
	<c:if test="${bool == true }">
		<td rowspan="2"><img src="/upload/${img.storedname }" id="userprofilimg"/></td>
		<td>${user_id }
			<c:if test="${check == 1 }">
				<button id="follow_btn" type="button"><span id="follow_msg">팔로우</span></button>
			</c:if>
			<c:if test="${check == 0 }">
				<button id="follow_btn" type="button"><span id="follow_msg">언팔로우</span></button>
			</c:if>
		</td>
	</c:if>
</tr>

</table>
<table>
<tr>
	<td><label style="width: 200px;font-size: 15px; font-weight: 50;">이름</label> </td>
	<td>${member.member_name }</td>
</tr>


<tr>
	<td><label style="width: 200px; font-size: 15px; font-weight: 50;">이메일</label> </td>
	<td>${member.member_email }</td>
</tr>

</table>

</form>
</div>


<hr>

<div id="user_write_div">
<c:set var="n" value="0"/>
<c:set var="m" value="1"/>
<c:forEach items="${write }" var="i">
<c:set var="sum" value="${n + m }"/>
<div id="user_write_list">
<a href="/userpage/view?content_no=${i.content_no }" class="openMask"><img src="/uppage/${i.storedname }" id="file_img${sum }" class="list_img"></a><br>

<span id="" class="glyphicon glyphicon-heart-empty"> ${i.hit } </span>
<span id="" class="glyphicon glyphicon-pencil"> ${i.comm_count } </span>
<span id="" class="glyphicon glyphicon-star-empty"> ${i.good }  </span>
</div>
<c:set var="n" value="${sum }"/>
</c:forEach>


<div id ="container">
<div id="mask"></div>
<div class="window">
   <p style="text-align:center; background:#ffffff; padding:20px;"><a href="#" class="close">닫기X</a></p>
</div>
</div>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
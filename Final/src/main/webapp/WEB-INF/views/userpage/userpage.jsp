<%@page import="web.dto.UserPage"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />





<script type="text/javascript">
$(document).ready(function() {
	InitializeStaticMenu();
});
//////////////////////////네비게이션 바 //////////////////////////
var stmnLEFT = 10; // 오른쪽 여백 
var stmnGAP1 = 0; // 위쪽 여백 
var stmnGAP2 = 250; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
var stmnBASE = 200; // 스크롤 시작위치 
var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
var stmnTimer; 

function RefreshStaticMenu() { 
var stmnStartPoint, stmnEndPoint; 
stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
	if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
	if (stmnStartPoint != stmnEndPoint) { 
		stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
		document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
		stmnRefreshTimer = stmnScrollSpeed; 
	}
	stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
}

function InitializeStaticMenu() {
	document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
	document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
	RefreshStaticMenu();
}


//----------------------

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


<div id="STATICMENU">
	<table class="table statictable">
			<tr>
				<th><a href="/admin/blacklist">게시물 </a></th>
			</tr>
			
			<tr>
				<th><a href="/admin/blacklist">태그 </a></th>
			</tr>
			
			<tr>
				<th><a href="/admin/board_1to1">그룹</a></th>
			</tr>
			
			<tr>
				<th><a href="/answer/list">즐겨찾기</a></th>
			</tr>
	</table>
</div>

<div id="see_menu_menu2">
<form action="/member/updateInfo" method="post" enctype="multipart/form-data">
<table id="see_menu_table2" style="margin-top: 50px;">

<tr>
	<c:if test="${bool == false }">
		<td rowspan="2"><img src="${paceContext.request.contextPath}/resources/img/img4.jpg" id="userprofilimg"/></td>
		<td>${user_id }</td>
	</c:if>	
	<c:if test="${bool == true }">
		<td rowspan="2"><img src="/upload/${img.storedname }" id="userprofilimg"/></td>
		<td>${user_id }</td>
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
<!-- <script type="text/javascript">
$(document).ready(function(){
	$("#file_img${sum }").click(function(){
		var popUrl = "/userpage/view?content_no=${i.content_no }";	//팝업창에 출력될 페이지 URL
	
		var popOption = "width=800, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);
	});
});
</script> -->
<span id="" class="glyphicon glyphicon-heart-empty"> ${i.hit } </span>
<span id="" class="glyphicon glyphicon-pencil"> 댓글수 </span>
<span id="" class="glyphicon glyphicon-star-empty"> ${i.like_index }  </span>
</div>
<c:set var="n" value="${sum }"/>
</c:forEach>


<div id ="container">
<div id="mask"></div>
<div class="window">
<%-- 	<c:param name="boast_board_no" value="${i.boast_board_no }"/> --%>
<%-- <c:import url="/board/boast/view"> --%>
<%-- </c:import> --%>
   <p style="text-align:center; background:#ffffff; padding:20px;"><a href="#" class="close">닫기X</a></p>
</div>
</div>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
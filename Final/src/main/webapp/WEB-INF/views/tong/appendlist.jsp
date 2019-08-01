<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<script type="text/javascript">

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


<c:set var="n" value="0"/>
<c:set var="m" value="1"/>
<c:forEach items="${mypagelist }" var="i">
<c:set var="sum" value="${n + m }"/>

<div id="user_write_list">
<a href="/tong/tongview?content_no=${i.content_no }" class="openMask"	><img src="/uppage/${i.storedname }" id="file_img${sum }" class="list_img"></a><br>
<!-- <script type="text/javascript">
$(document).ready(function(){
	$("#file_img${sum }").click(function(){
		var popUrl = "/mypage/view?content_no=${i.content_no }";	//팝업창에 출력될 페이지 URL
	
		var popOption = "width=800, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);
	});
});
</script> -->
<span id="" class="glyphicon glyphicon-heart-empty"> ${i.hit } </span>
<span id="" class="glyphicon glyphicon-pencil"> 댓글수 </span>
<span id="" class="glyphicon glyphicon-star-empty"> ${i.like_index }  </span>
<c:set var="n" value="${sum }"/>
</div>
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


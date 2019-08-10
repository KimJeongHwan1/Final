<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<script type="text/javascript">
	//윈도우 팝업
	function wrapWindowByMask() {

		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$("#mask").css({
			"width" : maskWidth,
			"height" : maskHeight
		});

		//애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

		$("#mask").fadeIn(0);
		$("#mask").fadeTo("slow", 0.5);

		//윈도우 같은 거 띄운다.
		$(".window").show();

	}

	$(document).ready(function() {
		//검은 막 띄우기
		$(".openMask").click(function(e) {
			e.preventDefault();

			console.log($(this))
			console.log($(this).attr("href"))

			$.ajax({
				type : "get",
				url : $(this).attr("href"),
				dataType : "html",
				success : function(h) {
					console.log("s")
					$(".window").html(h);
				},
				error : function() {
					console.log("e")
				}
			});

			wrapWindowByMask();
		});

		//닫기 버튼을 눌렀을 때
		$(".window .close").click(function(e) {
			//링크 기본동작은 작동하지 않도록 한다.
			e.preventDefault();
			$("#mask, .window").hide();
		});

		//검은 막을 눌렀을 때
		$("#mask").click(function() {
			$(this).hide();
			$(".window").hide();

		});

	});
</script>
<style type="text/css">
#background{
	background-image:url('/resources/img/tong1.jpg');
	position:absolute;
	width:100%;
	height:100%;
	background-size:100%;
}

.list_img{
	width: 300px;
	height: 250px;
	margin: 0 auto;
	margin-bottom: 10px;
	margin-top: 10px;
	border-radius: 10px;
}
#user_write_div{
	margin-left: 7%;
	width: 1500px;
}
#user_write_list{
	width: 320px;
	text-align: center;
	float: left;
	margin-left: 150px;
	margin-bottom: 50px;
	border-radius: 10px;
	margin-top:70px;
	background-color: #FFEEE4;
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

#img1 {
	float:left;
	margin-left: 9% ;
}
#img2 {
	float: left ;
	margin-left: 9% ;
}
#img3 {
	float: left ;
	margin-left: 9% ;
}
#text2{
	border-radius:10px;
	border:1px solid #ccc ;
	align-content: center;
	text-align: center;
	color: white;
	margin-top:100px ;
	padding: 10px ;
	font-size: 30px ;
	width: 50%;
	margin-left: 25% ;
	font-family: 'Jua', sans-serif;
}
</style>
<!--  style="background-color: #d8e9ef; -->
<body id="background">
<div id="user_write_div">
<c:set var="n" value="0"/>
<c:set var="m" value="1"/>
<c:forEach items="${timeLine }" var="i">
<c:set var="sum" value="${n + m }"/>
<div id="user_write_list">
<c:if test="${i.originname != null }">
<a href="/userpage/view?content_no=${i.content_no }" class="openMask"><img src="/uppage/${i.multimainstoredname }" id="file_img${sum }" class="list_img"/></a><br>
</c:if>
<c:if test="${i.originname eq null }">
<a href="/userpage/view?content_no=${i.content_no }" class="openMask"><img src="${paceContext.request.contextPath}/resources/img/NoImg.png"class="list_img"/></a><br>
</c:if>
<span id="spanmsg1${sum }" class="glyphicon glyphicon-heart-empty"> ${i.hit } </span>
<span id="spanmsg2${sum }" class="glyphicon glyphicon-pencil"> ${i.comm_count } </span>
<span id="spanmsg3${sum }" class="glyphicon glyphicon-star-empty"> ${i.good }  </span>
<c:if test="${i.storedname != i.multimainstoredname }">
<span id="spanmsg4${sum }"class="glyphicon glyphicon-book"> 멀티파일</span>
</c:if>
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

<c:if test="${timeLine eq '[]' }">
<!-- 기본으로 보이는 문구 -->
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<div style="background-color: white;">
	<div id="img1"><img src="/resources/img/TimeLineImg1.jpg" style="width: 400px; height: 400px;" /></div>
	<div id="img2"><img src="/resources/img/TimeLineImg2.jpg" style="width: 400px; height: 400px;" /></div>
	<div id="img3"><img src="/resources/img/TimeLineImg3.jpg" style="width: 400px; height: 400px;"/></div>
</div><div style="clear: both;"></div>
<div id="text2"><font>관심있는 항목을 검색하여 팔로우하면 게시물을 받아볼 수 있습니다</font></div>
<!-- 기본으로 보이는 문구 끝 -->
</c:if>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
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

<style>
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


<h1><a href="/black/list" style="color: black;">블랙리스트</a></h1>
<hr>


<div class="list" style="width: 100%; " >
<table style="text-align: center;" class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%; text-align: center;">번호</th>
		<th style="width: 10%; text-align: center;">신고자</th>		
		<th style="width: 10%; text-align: center;">블랙리스트</th>
		<th style="width: 10%; text-align: center;">글번호</th>
		<th style="width: 50%; ">내용</th>
		<th style="width: 10%; ">신고 날짜</th>
	</tr>
</thead>

<c:set var="i" value="0"/>
<c:set var="l" value="1"/>

<c:forEach items="${blacklist}" var="b">
	<tr>
		<td><c:set var="sum" value="${i+l }"/>${sum }</td>
		<td>${b.black_reporter }</td>
		<td>${b.black_perpetrator }</td>
		<td><a href="/userpage/view?content_no=${b.content_no }" class="openMask">${b.content_no }</a></td>
		<td style="text-align:left; ">${b.black_content }</td>
		<td style="text-align:left;" ><fmt:formatDate value="${b.black_report_date }" pattern="yyyy-MM-dd" /></td>
		<td><button class="btn btn-info" id="btnDelete"  type="button" onclick="location.href='/black/delete?black_no=${b.black_no }'">목록제거</button></td>
		<td><button class="btn btn-danger" id="btnDelete" type="button" onclick="location.href='/black/deleteMember?member_code=${b.member_code }'">회원탈퇴</button></td>
	</tr>
																	
	<c:set var="i" value="${sum }"/>
	
</c:forEach>

</table>

</div>
<div id ="container">
<div id="mask"></div>
<div class="window">
<%-- 	<c:param name="boast_board_no" value="${i.boast_board_no }"/> --%>
<%-- <c:import url="/board/boast/view"> --%>
<%-- </c:import> --%>
   <p style="text-align:center; background:#ffffff; padding:20px;"><a href="#" class="close">닫기X</a></p>
</div>
</div>
<c:import url="/WEB-INF/views/layout/BlackListPaging.jsp" />
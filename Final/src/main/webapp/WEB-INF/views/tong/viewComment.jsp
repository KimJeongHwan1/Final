<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 2.2.4 -->
<!-- <script type="text/javascript" -->
<!--  src="http://code.jquery.com/jquery-2.2.4.min.js"></script> -->

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>
#usercommimg{
	width: 40px;
	height: 40px;
	border-radius: 40px;
	
	margin-left: 5px;
	margin-right: 15px;
	margin-top: 5px;
}
#userface{
	font-size: 40px;
}
</style>
</head>
<body>

<div id="userscomment">
<c:set  var="n" value="0"/>
<c:set  var="m" value="1"/>

<c:set  var="cocon" value="0"/>
<c:set  var="cocom" value="1"/>

<c:forEach items="${list }" var="i">
<c:set var="sum" value="${n + m}"/>
<span id="userface${sum }" class="glyphicon glyphicon-user"  style="font-size: 40px;"></span>
<c:forEach items="${userImg }" var="l">
<c:if test="${l.member_code == i.member_code }">
	<img id="usercommimg" src="/upload/${l.storedname }"/>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#userface${sum }").hide();
	});
	</script>
</c:if>
</c:forEach>

${i.member_id }<br>
${i.content }<br>
<fmt:formatDate value="${i.writtendate }" pattern="yyyy년 MM월 dd일 hh:mm:ss" /> &nbsp;&nbsp;&nbsp;&nbsp;
<label id="nextcomentwrite${sum }">댓글</label>&nbsp;&nbsp;&nbsp;&nbsp;

<c:if test="${loginid == i.member_id }">
<a href=""><span id="delete_msg${sum }">삭제</span></a><br><br>
</c:if>
<script type="text/javascript">
$(document).ready(function() {
	$("#delete_msg${sum }").click(function() {
		$.ajax({
			type: "get"
			, url: "/userpage/commDelete?page_no=${i.page_no }&&comment_no=${i.comment_no }"
			, data:  {} 
			, dataType: "html"
			, success: function( res ) {
				$("#delete_msg${sum }").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		});
	});
});
</script>

<c:if test="${loginid != i.member_id }">
<br><br>
</c:if>
<script type="text/javascript">
$(document).ready(function() {
	$("#show_cocoment_div${sum }").hide();
//	$("#cocoment_write_btn${sum }").hide();
		
	$("#nextcomentwrite${sum }").click(function() {
	var state = $('#show_cocoment_div${sum }').css('display');
	if(state == 'none'){
		$("#show_cocoment_div${sum }").show();
// 		$("#cocoment_write_btn${sum }").show();
	} else {
	  		$("#show_cocoment_div${sum }").hide();
// 	   		$("#cocoment_write_btn${sum }").hide();
		}	
	});
});
</script>
<div id="show_cocoment_div${sum }" style="background-color: #F2F2F2">
<div id="ajax_cocoment_show${sum }" style="background-color: #F2F2F2">

<c:set value="0" var="ccm1"/>
<c:set value="1" var="ccm2"/>
<c:forEach items="${cocomentList }" var="coco">
<c:set value="${ccm1 + ccm2 }" var="ccmsum"/>
<c:if test="${i.comment_no == coco.comment_no }">
<c:set var="cocosum" value="${cocon + cocom}"/>
<span id="cocouserface${cocosum }" class="glyphicon glyphicon-user"></span>
<c:forEach items="${userImg }" var="cocouserimg">
<c:if test="${cocouserimg.member_code == coco.member_code }">
	<img id="usercommimg" src="/upload/${cocouserimg.storedname }"/>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#cocouserface${cocosum }").hide();
	});
	</script>
</c:if>
<c:set  var="cocon" value="${cocosum }"/>
</c:forEach>

${coco.member_id }<br>
${coco.content }<br>
<fmt:formatDate value="${coco.writtendate }" pattern="yyyy년 MM월 dd일 hh:mm:ss" />&nbsp;&nbsp;&nbsp;&nbsp;

<c:if test="${loginid == coco.member_id }">
<a href=""><span id="delete_coco_msg${ccmsum }">삭제</span></a><br><br>
</c:if>
<c:if test="${loginid != coco.member_id }">
<br><br>
</c:if>
<script type="text/javascript">
$(document).ready(function() {
	$("#delete_coco_msg${ccmsum }").click(function() {
		$.ajax({
			type: "get"
			, url: "/userpage/cocommDelete?cocomment_no=${coco.cocomment_no }"
			, data:  {} 
			, dataType: "html"
			, success: function( res ) {
				$("#delete_coco_msg${ccmsum }").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		});
	});
});
</script>
</c:if>
<c:set value="${cocosum }" var="ccm1"/>
</c:forEach>
</div>


<textarea rows="2" style="width: 100%; resize: none;" name="cocomment_content" id="cocomment_content${sum }" placeholder="댓글입력"></textarea>
<button id="cocoment_write_btn${sum }">작성</button>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#cocoment_write_btn${sum }").click(function() {
		$.ajax({
			type: "get"
			, url: "/userpage/coComment?comment_no=${i.comment_no }"
			, data:  $("#cocomment_content${sum }") 
			, dataType: "html"
			, success: function( res ) {
				$("#ajax_cocoment_show${sum }").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		});
		$('#cocomment_content${sum }').val('');
	});
});
</script>
<c:set  var="n" value="${sum }"/>
</c:forEach>
</div>

</body>
</html>
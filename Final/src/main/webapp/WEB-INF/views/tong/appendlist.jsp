<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<c:set var="n" value="0"/>
<c:set var="m" value="1"/>
<c:forEach items="${mypagelist }" var="i">
<c:set var="sum" value="${n + m }"/>

<div id="user_write_list">
<a href="/mypage/view?content_no=${i.content_no }";	><img src="/uppage/${i.storedname }" id="file_img${sum }" class="list_img"></a><br>
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

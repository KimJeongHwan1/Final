<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
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
</style>
<h3>사람</h3>
<div id="user_write_div">
<c:set var="n" value="0"/>
<c:set var="m" value="1"/>
<c:forEach items="${memberList }" var="i">
<c:set var="sum" value="${n + m }"/>
<div id="user_write_list${sum }" style="width: 280px; text-align: center; border: 1px solid black; float: left;	margin-left: 50px; margin-bottom: 50px;">
<%-- <img src="/uppage/${i.storedname }" id="file_img${sum }" class="list_img"><br> --%>

<span>${i.member_id }</span><br>
<span>${i.member_name }</span><br>
<span>${i.member_gender }</span>

</div>
<script type="text/javascript">

$(document).ready(function(){
	$("#user_write_list${sum }").click(function() {
		var logid = "${loginid }";
		var searchid = "${i.member_id }";
		
		if( logid == searchid){
			$(location).attr("href", "/tong/mypage?member_id=${i.member_id }");
		} else{
			$(location).attr("href", "/userpage/userpage?member_id=${i.member_id }");
		}
		
	});
});
</script>

<c:set var="n" value="${sum }"/>
</c:forEach>

</div>

<div id="block" style="width: 100%; height: 2px; border: 1px solid black; clear: both;"></div>

<h3>게시물</h3>
<div id="user_write_div">
<c:set var="n" value="0"/>
<c:set var="m" value="1"/>
<c:forEach items="${userpageList }" var="i">
<c:set var="sum" value="${n + m }"/>
<div id="user_write_list">
<img src="/uppage/${i.storedname }" id="file_img${sum }" class="list_img"><br>

<span id="spanmsg1${sum }" class="glyphicon glyphicon-heart-empty"> ${i.hit } </span>
<span id="spanmsg2${sum }" class="glyphicon glyphicon-pencil"> 댓글수 </span>
<span id="spanmsg3${sum }" class="glyphicon glyphicon-star-empty"> ${i.good }  </span>
</div>
<c:set var="n" value="${sum }"/>
</c:forEach>

</div>



<c:import url="/WEB-INF/views/layout/footer.jsp" />
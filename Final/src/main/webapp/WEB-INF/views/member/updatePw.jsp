<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/memberside.jsp" />
<style>
img{
	margin-right: 100px;
	width: 100px;
	height: 100px;
}
#pw_check_div{
	text-align: center;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#change_pw").click(function() {
		$.ajax({
			type: "get"
			, url: "/member/pwChange"
			, data:  $("#member_pw0, #member_pw1, #member_pw2") 
			, dataType: "html"
			, success: function( res ) {
				$("#pw_check_msg").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		});
	});
});
</script>
<div id="see_menu">
<div id="see_menu_menu">
<table id="see_menu_table" style="margin-top: 50px;">
<tr>
	<c:if test="${bool == false }">
		<td rowspan="2"><img src="${paceContext.request.contextPath}/resources/img/img4.jpg"/></td>
		<td>사용자ID ${loginid }</td>
	</c:if>
	<c:if test="${bool == true }">
		<td rowspan="2"><img src="/upload/${img.storedname }"/></td>
		<td>사용자ID ${loginid }</td>
	</c:if>
</tr>
</table>


<table style="margin-top: 20px;">
<tr>
	<td><label style="width: 200px; margin-top: 30px; font-size: 25px; font-weight: 100;">이전 비밀번호</label> </td>
	<td><input type="text" name="member_pw0" id="member_pw0" style="width: 400px; height: 30px; margin-top: 24px;" value="${member.member_name }"/></td>
</tr>
<tr>
	<td><label style="width: 200px; margin-top: 30px; font-size: 25px; font-weight: 100;">새 비밀번호</label> </td>
	<td><input type="text" name="member_pw1" id="member_pw1" style="width: 400px; height: 30px; margin-top: 24px;"/></td>
</tr>
<tr>
	<td><label style="width: 200px; margin-top: 30px; font-size: 25px; font-weight: 100;">새 비밀번호 확인</label> </td>
	<td><input type="text" name="member_pw2" id="member_pw2" style="width: 400px; height: 30px; margin-top: 24px;"/></td>
</tr>
</table>

<div id="btn_div" style= "margin-top: 40px;">
<button type="button" id="change_pw" class="btn btn-success">변경</button>
<button class="btn btn-danger" onclick="location.href='/member/mypage'">취소</button>
</div>

<div id="pw_check_div" style= "margin-top: 40px;">
	<span id="pw_check_msg"></span>
</div>

</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
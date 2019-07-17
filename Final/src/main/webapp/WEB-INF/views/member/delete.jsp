<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style>
#delete{
	text-align: center;
}
#pw_check_div{
	text-align: center;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#logpw_span").hide();
	$("#delete_btn").click(function() {
		var pwd1=$("#logpw_span").val();
		
		console.log(pwd1);
		if($("#pw").val()!=$("#logpw_span").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}else {
			$(this).parents("form");
		}
		
	});
	
});
</script>
<div id="delete">
<input type="text" id="logpw_span" value="${logpw }"/>
<h1><span>회원탈퇴</span></h1>
<h5><span>회원 정보 확인 후 탈퇴가 완료 됩니다.</span></h5><br><br>

<form action="/member/resultdelete" method="post">
<input type="text" name="pw" id="pw" placeholder="비밀번호"/><br>
<div id="pw_check_div" style= "margin-top: 40px;">
	<span id="pw_check_msg"></span>
</div>
<br>
<button id="delete_btn">탈퇴완료</button>
<button type="button" id="back_btn" onclick="location.href='/member/main'">탈퇴취소</button><br>
</form>

</div>



<c:import url="/WEB-INF/views/layout/footer.jsp" />
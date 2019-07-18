<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
#login_div{
	background-color: #FAFAFA;
	width: 400px;
	text-align: center;
	margin: 0 auto;
	border-radius: 50px;
}
#login_div button{
	background-color: #6E6E6E;
	color: white;
	border: 0px;
	width: 100px;
	height: 30px;
	font-weight: bold;
	border-radius: 5px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#ok_id_btn").click(function() {
		$.ajax({
			type: "get"
			, url: "/member/findSuccessId"
			, data:  $("#id_name, #id_email") 
			, dataType: "html"
			, success: function( res ) {
				$("#login_div").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		});
	});
	
	$("#ok_pw_btn2").click(function() {
		$.ajax({
			type: "get"
			, url: "/member/findSuccessPw"
			, data:  $("#pw_name, #pw_id, #pw_email") 
			, dataType: "html"
			, success: function( res ) {
				$("#login_div").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		});
	});
});
</script>
<br><br>
<div id="login_div">

<span class="glyphicon glyphicon-pencil" style="font-size: 60px; margin-bottom: 40px; margin-top: 20px;"></span>

<div id="find_ID_div">
<label style="margin-right: 110px;"><span class="glyphicon glyphicon-search"> </span> 아이디 찾기</label><br>
<label><input type="text" id="id_name" name="id_name" placeholder=" 이름을 입력해주세요" style="width: 200px; font-weight: lighter; border-radius: 10px;"/></label><br>
<label><input type="text" id="id_email" name="id_email" placeholder=" 이메일을 입력해주세요" style="width: 200px; font-weight: lighter; border-radius: 10px;"/></label><br><br>

<button id="ok_id_btn">확인</button>
<button id="not_btn" type="button">취소</button>
</div>
<br>

<div id="find_PW_div">
<label style="margin-right: 95px;"><span class="glyphicon glyphicon-search"> </span> 비밀번호 찾기</label><br>
<label><input type="text" id="pw_name" name="pw_name" placeholder=" 이름을 입력해주세요" style="width: 200px; font-weight: lighter; border-radius: 10px;"/></label><br>
<label><input type="text" id="pw_id" name="pw_id" placeholder=" 아이디를 입력해주세요" style="width: 200px; font-weight: lighter; border-radius: 10px;"/></label><br>
<label><input type="text" id="pw_email" name="pw_email" placeholder=" 이메일을 입력해주세요" style="width: 200px; font-weight: lighter; border-radius: 10px;"/></label><br><br>

<button id="ok_pw_btn2">확인</button>
<button id="not_btn" type="button">취소</button>
</div>

<br>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
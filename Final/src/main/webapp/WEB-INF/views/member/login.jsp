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
#login_btn{
	background-color: #6E6E6E;
	color: white;
	border: 0px;
	width: 100px;
	height: 30px;
	font-weight: bold;
	border-radius: 5px;
}
</style>
<br><br>
<div id="login_div">

<span class="glyphicon glyphicon-home" style="font-size: 60px; margin-bottom: 40px; margin-top: 20px;"></span>
<form action="/member/login" method="post">

<label><input type="text" name="member_id" placeholder=" 아이디" style="width: 200px; font-weight: lighter; border-radius: 10px;"/></label><br>
<label><input type="text" name="member_pw" placeholder=" 비밀번호" style="width: 200px; font-weight: lighter; border-radius: 10px;"/></label><br><br>

<button id="login_btn">로그인</button>
</form>
<hr>

<a href=""><span style="font-weight: bold;">아이디 찾기 또는 비밀번호 찾기</span></a><br><br>
<a href=""><span style="font-weight: bold;">회원가입</span></a>
<br><br>
</div>


</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
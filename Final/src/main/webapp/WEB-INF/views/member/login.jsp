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
<script type="text/javascript">
$(document).ready(function() {
	$("#code").hide();
});
</script>
<br><br>
<div id="login_div">
<input type="text" value="abc" name="code" id="code"/>


<span class="glyphicon glyphicon-home" style="font-size: 60px; margin-bottom: 40px; margin-top: 20px;"></span>
<form action="/member/login" method="post">

<label><input type="text" name="member_id" placeholder=" 아이디" style="width: 200px; font-weight: lighter; border-radius: 10px;"/></label><br>
<label><input type="text" name="member_pw" placeholder=" 비밀번호" style="width: 200px; font-weight: lighter; border-radius: 10px;"/></label><br><br>

<button id="login_btn">로그인</button>
</form>

<br>

<!-- 네이버 로그인 -->
<!-- 네이버 로그인 창으로 이동 -->
<div id="naver_id_login" style="text-align:center"><a href="${url}">
<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
<br>

<!-- 카카오  -->
<div class="form-group socialimage" id="kakaoBtn">
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=286734fe70f9a68239874c82d0f2f0b8&redirect_uri=http://localhost:8088/member/main3&response_type=code">
		<img id="socialimage" src="/resources/img/kakao_account_login_btn_medium_narrow.png" height="100%"/>
			</a>
		</div>



<a href="/member/findIdPw"><span style="font-weight: bold;">아이디 찾기 또는 비밀번호 찾기</span></a><br><br>

<a href="/member/join"><span style="font-weight: bold;">회원가입</span></a>
<br><br>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
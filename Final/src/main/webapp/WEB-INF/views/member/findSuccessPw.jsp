<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#login_div{
	background-color: #FAFAFA;
	width: 400px;
	text-align: center;
	margin: 0 auto;
	border-radius: 50px;
}
</style>
</head>
<body>
<div id="findId">
<br>
<c:if test="${pw == null }">
<h2 style="color: red;">비밀번호 찾기 실패</h2>
</c:if>
<c:if test="${pw != null }">
<h2>비밀번호 찾기 성공 :  <span style="color: blue;">${pw }</span></h2>
</c:if>
<br><br>
<a href="/member/findIdPw"><span style="font-weight: bold;">ID 찾기</span></a><br>
<a href="/member/login"><span style="font-weight: bold;">로그인 하기</span></a>
<br><br><br>
</div>


</body>
</html>



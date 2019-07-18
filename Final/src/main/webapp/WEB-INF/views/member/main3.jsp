<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

카카오 성공<br>
${sessionScope.token }<br>

<button type="button" onclick="location.href='/kakao/logout'">로그아웃</button>

</body>
</html>
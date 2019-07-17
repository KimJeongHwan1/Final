<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result == 0 }">
<span style="color : blue;">비밀번호 변경 성공</span>
</c:if>

<c:if test="${result == 1 }">
<span style="color : red;">이전 비밀번호와 새 비밀번호가 일치하지 않습니다.</span>
</c:if>

<c:if test="${result == 2 }">
<span style="color : red;">새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.</span>
</c:if>

<c:if test="${result == 3 }">
<span style="color : red;">사용중인 비밀번호가 일치하지 않습니다.</span>
</c:if>

<c:if test="${result == 4 }">
<span style="color : red;">입력하신 내용이 전부 일치하지 않습니다.</span>
</c:if>

</body>
</html>
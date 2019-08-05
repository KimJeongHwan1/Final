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
<c:if test="${check == 1 }">
즐겨찾기취소
</c:if>


<c:if test="${check == 0 }">
즐겨찾기추가
</c:if>
</body>
</html>
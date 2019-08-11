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
<span>즐겨찾기<span style="color: red;">취소</span></span>
</c:if>


<c:if test="${check == 0 }">
<span>즐겨찾기<span style="color: blue;">추가</span></span>
</c:if>

</body>
</html>
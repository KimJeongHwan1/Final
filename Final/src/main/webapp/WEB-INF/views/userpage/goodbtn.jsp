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
<c:if test="${goodcheck == 1}">
<span class="glyphicon glyphicon-star-empty"></span>
</c:if>
<c:if test="${goodcheck == 0}">
<span class="glyphicon glyphicon-star"></span>
</c:if>

</body>
</html>
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
<c:if test="${check == 0}"  >
<span style="color : red">사용 불가능합니다.</span>
</c:if>

<c:if test="${check == 1 }">
<span style="color : blue">사용 가능합니다.</span>
</c:if>

<c:if test="${chk == 0}"  >
<span style="color : red">사용 불가능합니다.</span>
</c:if>

<c:if test="${chk == 1 }">
<span style="color : blue">사용 가능합니다.</span>
</c:if>
</body>
</html>
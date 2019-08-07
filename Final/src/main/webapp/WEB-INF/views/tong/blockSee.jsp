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

<c:if test="${blockSee == 0 }">
<span id="blockSee" style="color: blue;"><span id="blockSee_msg">공개</span></span>
</c:if>
<c:if test="${blockSee == 1 }">
<span id="blockSee" style="color: red;"><span id="blockSee_msg">비공개</span></span>
</c:if>

</body>
</html>
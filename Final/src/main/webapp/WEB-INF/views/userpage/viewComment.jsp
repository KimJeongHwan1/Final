<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="userscomment">
<c:forEach items="${list }" var="i">

${i.content }
<fmt:formatDate value="${i.writtendate }" pattern="yyyy년 MM월 dd일 hh:mm:ss" /><br>
</c:forEach>
</div>



</body>
</html>
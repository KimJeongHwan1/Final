<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>

#img {
	float: left;
}
#content{
	float: left;
}

</style>

<h1>혀누타임 게시판</h1>
<hr>

<div>
	<div id="img">
	<img src="${paceContext.request.contextPath}/htimg/abc.PNG" alt="htImg" width="220px;" height="350px;"></div>
	<div id="content">내용1</div><br>
	<div id="content2">상세내용</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
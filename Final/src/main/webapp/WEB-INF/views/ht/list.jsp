<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>

#img {
	float: left;
	margin-left: 700px ;
}
#content{
	float: left;
	margin-left: 40px ;
	margin-top: 10px ;
}
</style>

<div style="width: 40%; text-align: center; margin-left: 30%;">
<h1>베스트 게시판</h1>
<hr><br>
</div>

<div id="list">
	<div id="img">
	<img src="${paceContext.request.contextPath}/htimg/abc.PNG" alt="htImg" width="70px;" height="70px;"></div>
	<div id="content">내용1<br><br>
	상세내용</div><div style="clear: both;"></div>
	<hr style="width: 40%; margin-left: 30%;">
</div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />
<c:import url="/WEB-INF/views/layout/footer.jsp" />
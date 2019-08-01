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
<div>
<c:set var="n" value="0"/>
<c:set var="m" value="1"/>
<c:forEach items="${list }" var="i">
<c:set var="sum" value="${n + m }"/>
<div id="list">
	<div id="img">
	<img src="${paceContext.request.contextPath}/uppage/${i.storedname }" alt="htImg" width="70px;" height="70px;"></div>
	<div id="content"><a href="/best/view?content_no=${i.content_no }">내용1</a><br><br>
	상세내용</div><div style="clear: both;"></div>
	<hr style="width: 40%; margin-left: 30%;">
</div>
<c:set var="n" value="${sum }"/>
</c:forEach>
</div>
<c:import url="/WEB-INF/views/layout/paging.jsp" />
<c:import url="/WEB-INF/views/layout/footer.jsp" />
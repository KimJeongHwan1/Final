<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">

<style>

#img {
	float: left;
	margin-left: 35% ;
}
#content{
	float: left;
	margin-left: 40px ;
	margin-top: 10px ;
	font-family: 'Jua', sans-serif;
	
}
a:link , a:visited , a:active , a:hover {
   color: black ;
}
</style>

<div style="width: 40%; text-align: center; margin-left: 30%;">
<h1 style="font-family: 'Jua', sans-serif">베스트 게시판</h1>
<hr><br>
</div>
<div>
<c:set var="n" value="0"/>
<c:set var="m" value="1"/>
<c:forEach items="${list }" var="i">
<c:set var="sum" value="${n + m }"/>
<div id="list">
	<div id="img">
	<a href="/best/view?content_no=${i.content_no }">
	<img src="${paceContext.request.contextPath}/uppage/${i.multimainstoredname }" alt="htImg" width="70px;" height="70px;">
	</a></div>
	<div id="content"><a href="/best/view?content_no=${i.content_no }">${i.content_title}</a><br><br>
	<a href="/best/view?content_no=${i.content_no }">${i.content}</a></div><div style="clear: both;"></div>
	<hr style="width: 40%; margin-left: 30%;">
</div>
<c:set var="n" value="${sum }"/>
</c:forEach>
</div>
<c:import url="/WEB-INF/views/layout/paging.jsp" />
<c:import url="/WEB-INF/views/layout/footer.jsp" />
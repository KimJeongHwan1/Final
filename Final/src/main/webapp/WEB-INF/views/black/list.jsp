<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
 src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">


</style>

</head>
<body>

<h1><a href="/black/list" style="color: black;">블랙리스트</a></h1>
<hr>


<div class="list" style="width: 100%; " >
<table style="text-align: center;" class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%; text-align: center;">번호</th>
		<th style="width: 10%; text-align: center;">신고자</th>		
		<th style="width: 10%; text-align: center;">블랙리스트</th>
		<th style="width: 10%; text-align: center;">글번호</th>
		<th style="width: 50%; ">내용</th>
		<th style="width: 10%; ">신고 날짜</th>
	</tr>
</thead>

<c:set var="i" value="0"/>
<c:set var="l" value="1"/>

<c:forEach items="${blacklist}" var="b">

	
	
	
	<tr>
		<td><c:set var="sum" value="${i+l }"/>${sum }</td>
		<td>${b.black_reporter }</td>
		<td>${b.black_perpetrator }</td>
		<td><a href="/userpage/view?content_no=${b.content_no }">${b.content_no }</a></td>
		<td style="text-align:left; ">${b.black_content }</td>
		<td style="text-align:left;" ><fmt:formatDate value="${b.black_report_date }" pattern="yyyy-MM-dd" /></td>
		<td><button class="btn btn-info" id="btnDelete"  type="button" onclick="location.href='/black/delete?black_no=${b.black_no }'">목록제거</button></td>
		<td><button class="btn btn-danger" id="btnDelete" type="button" onclick="location.href='/black/deleteMember?member_code=${b.member_code }'">회원탈퇴</button></td>
	</tr>
																	
	<c:set var="i" value="${sum }"/>
	
</c:forEach>

</table>

</div>


<c:import url="/WEB-INF/views/layout/BlackListPaging.jsp" />
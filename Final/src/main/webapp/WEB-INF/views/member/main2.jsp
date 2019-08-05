<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<c:import url="/WEB-INF/views/layout/header.jsp" />
<h1>테스트</h1>
<hr>

로그인 아이디 : ${loginid }<br><br>
<a href="/member/login">로그인</a><br>

<a href="/member/logout">로그아웃</a><br><br>

<a href="/member/join">회원가입</a><br>

<a href="/member/delete">회원탈퇴</a><br><br>

<a href="/member/updateInfo">정보수정</a><br><br>

<a href="/tong/mypage">마이페이지</a><br>

<a href="/member/mypage">마이페이지 정보수정</a><br>

<a href="/tong/timeLinePage">타임라인페이지</a><br><br>

<a href="/tong/write">글쓰기</a><br><br>


<a href="/black/list">블랙리스트</a><br><br>

<a href="/map/mapInsert">맵api</a><br><br>

<a href="/best/list">베스트 게시판</a><br><br>

<div id="useridList">
<span>유저 페이지</span>
<table>
<c:forEach items="${list }" var="i">

<tr>
	<td><a href="/userpage/userpage?member_id=${i.member_id }">${i.member_code }</a></td>
	<td>${i.member_id }</td>
</tr>
</c:forEach>
</table>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
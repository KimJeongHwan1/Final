<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<c:import url="/WEB-INF/views/layout/header.jsp" />

<h1>테스트</h1>
<hr>

로그인 아이디 : ${loginid }<br><br>
<a href="/member/login">로그인</a><br>
<a href="/member/logout">로그아웃</a><br><br>

<c:if test="${not login }">
<a href="/member/login">정보수정</a><br><br>
</c:if>
<c:if test="${login }">
<a href="/member/updateInfo">정보수정</a><br><br>
</c:if>

<a href="/member/join">회원가입</a><br>
<a href="/member/delete">회원탈퇴</a>

</body>
</html>


</body>
</html>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
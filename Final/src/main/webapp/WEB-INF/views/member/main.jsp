<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 로그인 상태 -->
<c:if test="${login} ">
	<a href="/member/logout"><button>로그아웃</button></a>
</c:if>

<!-- 비로그인 상태 -->
<c:if test="${empty login} ">
	<a href="/member/login"><button>로그인</button></a>
	<a href="/member/join"><button>로그인</button></a>
</c:if>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<c:import url="/WEB-INF/views/layout/header.jsp" />

<h1>테스트</h1>
<hr>

네이버 닉네임 : ${nickname }<br><br>
네이버 이메일 : ${email }<br>
${result }

<br>
<button type="button" onclick="location.href='/member/logout'">로그아웃</button>

</body>
</html>


</body>
</html>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
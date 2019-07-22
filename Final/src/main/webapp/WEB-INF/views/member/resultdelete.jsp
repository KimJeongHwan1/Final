<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style>
#delete{
	text-align: center;
}

</style>
<div id="delete">

<h1><span>회원탈퇴가 완료되었습니다.</span></h1>
<h5><span style="font-weight: bold;">그동안 서비스를 이용해 주셔서 감사합니다.</span></h5>
<h5><span>보다 나은 서비스로 찾아 뵙겠습니다.</span></h5><br><br><br><br>

<button type="button" id="back_btn" onclick="location.href='/member/main2'">첫 화면</button><br>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
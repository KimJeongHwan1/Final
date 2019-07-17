<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style>
#choose_menu{
	border: 1px solid black;
	float: left;
	width: 20%;
	height: 900px;
}
#choose_menu div{
	height: 50px;
}
#choose_menu label{
	font-size: 20px;
	font-weight: bold;
	margin-top: 10px;
	margin-left: 15px;
}
#see_menu{
	border: 1px solid black;
	border-left: none;
	float: left;
	width: 80%;
	height: 900px;
}
img{
	width: 100px;
	height: 100px;
}
#see_menu_menu{
	margin: 0 auto;
	width: 50%;
}
#see_menu_menu button{
	text-align: center;
}
#see_menu_table tr{
	margin-top: 30px;
}
#btn_div{
	text-align: center;
}
</style>
<br>
<div id="choose_menu">
<div style="width: 100%"><a href="/member/updateInfo"><label>프로필 편집</label></a></div>
<div style="width: 100%"><a href="/member/updatePw"><label>비밀번호 변경</label></a></div>
<div style="width: 100%"><a href=""><label>공개범위 및 보안</label></a></div>

</div>

<div id="see_menu">
<div id="see_menu_menu">
<form>
<table id="see_menu_table" style="margin-top: 50px;">
<tr>
	<td rowspan="2"><img src="${pageContext.request.contextPath}/resources/img/img4.jpg"/></td>
	<td>사용자ID ${loginid }</td>
</tr>
</table>


<table>
<tr>
	<td><label style="width: 120px; margin-top: 20px;">이전 비밀번호</label> </td>
	<td><input type="text" name="name" id="name" style="width: 400px;  margin-top: 20px;""/></td>
</tr>
<tr>
	<td><label style="width: 120px; margin-top: 20px;">새 비밀번호</label> </td>
	<td><input type="text" name="email" id="email" style="width: 400px; margin-top: 20px;""/></td>
</tr>
<tr>
	<td><label style="width: 120px; margin-top: 20px;">새 비밀번호 확인</label> </td>
	<td><input type="text" name="address" id="address" style="width: 400px; margin-top: 20px;""/></td>
</tr>

</table>
<div id="btn_div" style= "margin-top: 40px;">
<button>변경</button>
<button>취소</button>
</div>
</form>
</div>

</div>


</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
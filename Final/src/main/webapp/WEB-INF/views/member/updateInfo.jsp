<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<script>
$(document).ready(function(){
	$("#member_birth").datepicker({
	    dateFormat: 'yy년 mm월 dd일'
	    ,changeYear: true
	    ,changeMonth: true
	    ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
	    ,dayNamesMin: ['일','월','화','수','목','금','토']
	 });
});
</script>
<br>
<div id="choose_menu">
<div style="width: 100%"><a href="/member/updateInfo"><label>프로필 편집</label></a></div>
<div style="width: 100%"><a href="/member/updatePw"><label>비밀번호 변경</label></a></div>
<div style="width: 100%"><a href=""><label>공개범위 및 보안</label></a></div>

</div>

<div id="see_menu">
<div id="see_menu_menu">
<form action="/member/updateInfo" method="post" enctype="multipart/form-data">
<table id="see_menu_table" style="margin-top: 50px;">
<tr>
		<td rowspan="2"><img src="/upload/${img.storedname }"/></td>
		<td>사용자ID ${loginid }</td>
</tr>
<tr>
	<td><input type="file" name="file" id="file"/></td>
</tr>
</table>


<table>
<tr>
	<td><label style="width: 80px; margin-top: 20px;">이름</label> </td>
	<td><input type="text" name="member_name" id="member_name" style="width: 400px;  margin-top: 20px;" value="${member.member_name }"/></td>
</tr>
<tr>
	<td><label style="width: 80px; margin-top: 20px;">이메일</label> </td>
	<td><input type="text" name="member_email" id="member_email" style="width: 400px; margin-top: 20px;" value="${member.member_email }"/></td>
</tr>
<tr>
	<td><label style="width: 80px; margin-top: 20px;">주소</label> </td>
	<td><input type="text" name="member_address" id="member_address" style="width: 400px; margin-top: 20px;" value="${member.member_address }"/></td>
</tr>
<tr>
	<td><label style="width: 80px; margin-top: 20px;">생년월일</label> </td>
	<td><input type="text" name="member_birth" id="member_birth" style="width: 400px; margin-top: 20px;" value="<fmt:formatDate value="${member.member_birth }" pattern="yyyy/MM/dd" />"/>
	
	</td>
</tr>
<tr>
	<td><label style="width: 80px; margin-top: 20px;">전화번호</label> </td>
	<td><input type="text" name="member_phone" id="member_phone" style="width: 400px; margin-top: 20px;" value="${member.member_phone }"/></td>
</tr>
<tr>
	<td><label style="width: 80px; margin-top: 20px;">성별</label> </td>
	<td>
		<select style="width:200px; margin-top: 20px;" id="member_gender" name="member_gender">
	  		<option>${member.member_gender }</option>
	  		<option>남</option>
	 		<option>여</option>
		</select>
	</td>
</tr>


</table>
<div id="btn_div" style= "margin-top: 40px;">
<button>작성</button>
<button>취소</button>
</div>
</form>
</div>

</div>


</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
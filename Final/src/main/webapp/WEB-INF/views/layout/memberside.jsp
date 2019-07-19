<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
#see_menu_menu{
	margin: 0 auto;
	width: 80%;
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
#btn_div button{
	width: 100px;
	height: 30px;
}
</style>
<br>
<div id="choose_menu">
<div style="width: 100%"><a href="/member/mypage"><label>마이페이지</label></a></div>
<div style="width: 100%"><a href="/member/updateInfo"><label>프로필 편집</label></a></div>
<div style="width: 100%"><a href="/member/updatePw"><label>비밀번호 변경</label></a></div>
<div style="width: 100%"><a href=""><label>댓글 필터링</label></a></div>
</div>

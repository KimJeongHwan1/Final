<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/memberside.jsp" />
 <!-- 캘린더 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"> </script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>

img{
	margin-right: 100px;
	width: 100px;
	height: 100px;
}
</style>

<script>
$(document).ready(function(){
	$("#member_Birth").datepicker({
	    dateFormat: 'yy/mm/dd'
	    ,changeYear: true
	    ,changeMonth: true
	    ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
	    ,dayNamesMin: ['일','월','화','수','목','금','토']
	});
	
	 $("#btnAddr").click(function(){
		    new daum.Postcode({
		    	oncomplete: function(data) {
		    		
		    		var fullAddr = ''; // 최종 주소 변수
		    		var extraAddr = ''; // 조합형 주소 변수
			
		    		if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		    			fullAddr = data.roadAddress;
			
			    	} else { // 사용자가 지번 주소를 선택했을 경우(J)
			    		fullAddr = data.jibunAddress;
			    	}

		    		if(data.userSelectedType === 'R'){
		    			//법정동명이 있을 경우 추가한다.
		    			if(data.bname !== ''){
		    				extraAddr += data.bname;
		    			}
		    			// 건물명이 있을 경우 추가한다.
		    			if(data.buildingName !== ''){
		    				extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		    			}
		    			// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		    			fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		    		}
					

					document.getElementById('member_addressnum').value = data.zonecode+" "+fullAddr;	
					
					document.getElementById('member_address').focus();    
					
		    	}}).open();
		  	 });
});
</script>
<div id="see_menu">
<div id="see_menu_menu">
<form action="/member/updateInfo" method="post" enctype="multipart/form-data">
<table id="see_menu_table" style="margin-top: 50px;">
<tr>
	<c:if test="${bool == false }">
		<td rowspan="2"><img src="${paceContext.request.contextPath}/resources/img/img4.jpg"/></td>
		<td>사용자ID ${loginid }</td>
	</c:if>
	<c:if test="${bool == true }">
		<td rowspan="2"><img src="/upload/${img.storedname }"/></td>
		<td>사용자ID ${loginid }</td>
	</c:if>
</tr>
<tr>
	<td><input type="file" name="file" id="file"/></td>
</tr>
</table>


<table>
<tr>
	<td><label style="width: 200px; margin-top: 30px; font-size: 25px; font-weight: 100;">이름</label> </td>
	<td><input type="text" name="member_name" id="member_name" style="width: 400px; height: 30px; margin-top: 24px;" value="${member.member_name }"/></td>
</tr>
<tr>
	<td><label style="width: 200px; margin-top: 30px; font-size: 25px; font-weight: 100;">이메일</label> </td>
	<td><input type="text" name="member_email" id="member_email" style="width: 400px; height: 30px; margin-top: 24px;" value="${member.member_email }"/></td>
</tr>
<tr>
	<td><label style="width: 200px; margin-top: 30px; font-size: 25px; font-weight: 100;">주소</label> </td>
	<td>
		<input type="text" id="member_addressnum" name="member_addressnum" placeholder="우편번호" style="width: 400px; margin-top: 30px;" value="${member.member_addressnum }"><br>
	 	<input type="text" id="member_address" name="member_address" placeholder="상세주소" style="width: 400px; margin-top: 10px;" value="${member.member_address }">
	</td>
	<td><button type="button" id="btnAddr" style="width: 45px; margin-top: 18px; margin-left: 10px; height: 35px;">검색</button></td>
</tr>
<tr>
	<td><label style="width: 200px; margin-top: 30px; font-size: 25px; font-weight: 100;">전화번호</label> </td>
	<td><input type="text" name="member_phone" id="member_phone" style="width: 400px height: 30px; margin-top: 24px;" value="${member.member_phone }"/></td>
</tr>


</table>
<div id="btn_div" style= "margin-top: 40px;">
<button>작성</button>
<button>취소</button>
</div>
</form>
</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
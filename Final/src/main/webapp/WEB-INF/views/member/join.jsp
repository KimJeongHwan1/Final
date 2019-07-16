<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
 src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 <script>
      function sample6_execDaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var fullAddr = ''; // 최종 주소 변수
                     var extraAddr = ''; // 조합형 주소 변수

                     // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.roadAddress;

                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;
                     }

                     // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                     if (data.userSelectedType === 'R') {
                        //법정동명이 있을 경우 추가한다.
                        if (data.bname !== '') {
                           extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if (data.buildingName !== '') {
                           extraAddr += (extraAddr !== '' ? ', '
                                 + data.buildingName
                                 : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' ('
                              + extraAddr + ')' : '');
                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('member_address').value = data.zonecode; //5자리 새우편번호 사용
                     document.getElementById('member_address').value = fullAddr;

                  }
               }).open();
      }
   </script>

<script type="text/javascript">
function inputCheck(){
	
	var join=document.joinForm;
	
	if(join.member_id.value==""){
		alert("아이디를 입력해주세요");
		join.member_id.focus();
		return false;
	}
	if(join.member_pw.value==""){
		alert("비밀번호를 입력해주세요");
		join.member_pw.focus();
		return false;
	}
	if(join.member_pw.value!=join.member_pwCheck.value){
		alert("비밀번호를 동일하게 입력해주세요");
		join.member_pwCheck.focus();
		return false;
	}
	if(join.member_name.value==""){
		alert("이름을 입력해주세요");
		join.member_name.focus();
		return false;
	}
	if(join.member_birth.value==""){
		alert("생년월일을 입력해주세요");
		join.member_birth.focus();
		return false;
	}
	if(join.member_email.value==""){
		alert("이메일을 입력해주세요");
		join.member_email.focus();
		return false;
	}
	if(join.member_phone.value==""){
		alert("핸드폰번호를 입력해주세요");
		join.member_phone.focus();
		return false;
	}
// 	if(join.member_address.value==""){
// 		alert("주소를 입력해주세요");
// 		join.member_address.focus();
// 		return false;
// 	}
}
$(document).ready(function() {
	
	$('#check_id').hide();

	$("#idck").click(function() {

        var state = $('#check_id').css('display');
        if(state == 'none'){
            $('#check_id').show();
        }
		
		$.ajax({
			type: "get"
			, url: "/member/idCheck"
			, data: $("#idcheck")
			, dataType: "html"
			, success: function( res ) {
				$("#check_id").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		})
	});

});

</script>

<form action="/member/join" name="joinForm" method="POST" onsubmit="return inputCheck()">
		<!-- 아이디 -->
		<div class="form-group">
			<label for="member_id">아이디</label>
				<input type="text" class="form-control" id="idcheck" name="member_id" placeholder="ID" onkeydown="inputIdCheck()" required>
			<button type="button" id="idck">중복확인</button>&nbsp;&nbsp;&nbsp;<span id="check_id"></span><br>
			
			<div class="check_font" id="id_check"></div>

		</div>
		
		<!-- 비밀번호 -->
		<div class="form-group">
			<label for="member_pw">비밀번호</label>
				<input type="password" class="form-control" name="member_pw" placeholder="PASSWORD" required>
<!-- 			<div class="check_font" id="pw_check"></div> -->
		</div>
		<!-- 비밀번호 재확인 -->
		<div class="form-group">
			<label for="member_pw2">비밀번호 확인</label>
				<input type="password" class="form-control" name="member_pwCheck" placeholder="Confirm Password" required>
<!-- 			<div class="check_font" id="pw2_check"></div> -->
			
		</div>
		<!-- 이름 -->
		<div class="form-group">
			<label for="member_name">이름</label>
				<input type="text" class="form-control" id="member_name" name="member_name" placeholder="Name" required>
			<div class="check_font" id="name_check"></div>
		</div>
		<!-- 성별 -->
		<h3 class="join_title">
				<label for="member_gender">성별</label>
			</h3>
			<div class="genderdiv">
				<select id="member_gender" name="member_gender" class="gen">
					<option value="0" selected>성별</option>
					<option value="M">남자</option>
					<option value="F">여자</option>
				</select>
			</div>
			<span class="error" id="member_gender"> 필수 정보입니다 </span>
		<!-- 생년월일 -->
		<div class="form-group required">
			<label for="member_birth">생년월일</label>
				<input type="text" class="form-control" id="member_birth" name="member_birth" placeholder="ex) 19990415" required>
			<div class="check_font" id="birth_check"></div>
		</div>
		<!-- 본인확인 이메일 -->
		<div class="form-group">
			<label for="member_email">이메일</label>
				<input type="email" class="form-control" name="member_email" id="member_email" placeholder="E-mail" required>
				<!-- <input type="text" style="margin-top: 5px;"class="email_form" name="email_confirm" id="email_confirm" placeholder="인증번호를 입력해주세요!" required>
					<button type="button" class="btn btn-outline-danger btn-sm px-3" onclick="confirm_email()">
						<i class="fa fa-envelope"></i>&nbsp;인증
					</button>&nbsp;
					<button type="button" class="btn btn-outline-info btn-sm px-3">
						<i class="fa fa-envelope"></i>&nbsp;확인
					</button>&nbsp; -->
				<div class="check_font" id="email_check"></div>
		</div>
		<!-- 휴대전화 -->
		<div class="form-group">
			<label for="member_phone">휴대전화 ('-' 없이 번호만 입력해주세요)</label>
			<input type="text" class="form-control" id="member_phone" name="member_phone" placeholder="Phone Number" required>
			<div class="check_font" id="phone_check"></div>
		</div>
		
		<!-- 주소-->
		<div class="form-group">
			<label for="member_address">주소</label>
			<input type="text" class="form-control" id="member_address" name="member_address" placeholder="우편번호" required>
	 		<input type="text" class="form-control" id="member_address" name="member_address" placeholder="상세주소" required>
			<input type="button" class="btn btn-primary"
                              style="background-color: #32B16C !important; padding: 1% 10;"
                              onclick="sample6_execDaumPostcode()" class="form-control"
                              value="주소 찾기">
		</div>
		
		<div class="reg_button">
			<a class="btn btn-danger px-3" href="${pageContext.request.contextPath}">
				<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
			</a>&emsp;&emsp;
			<button class="btn btn-primary px-3" id="reg_submit">
				<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
			</button>
		</div>
	</form>

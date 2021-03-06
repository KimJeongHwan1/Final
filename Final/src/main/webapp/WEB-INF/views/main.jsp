<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<c:import url="/WEB-INF/views/layout/beforeheader.jsp" />

<style>



#imagedisplay div img { 
	
	padding-left: 0px;
	margin-left: 0px;
		
	width: 100%;
	height: 990px;
} 


#imagedisplay{

	position: relative;
}


#imageText div h1 {
	
	text-align: center;
	position: absolute;
	color: white;
	
	top: 240px;
	left: 700px;
	width: 100%;
	margin: 0 auto;
	width: 650px;
	height: 50px;
	
	font-size: 70px;

}


#imageText div span {
	
	text-align: center;
	position: absolute;
	color: white;
	
	top: 450px;
	left: 625px;
	
	margin: 0 auto;
	

	height: 50px;
	
	font-size: 25px;
	font-weight: bold;

}


#imageText div button {
	
	text-align: center;
	position: absolute;
	color: black;
	background-color: white;
	
	top: 300px;
	left: 240px;
	width: 100%;
	margin: 0 auto;
	
	width: 150px;
	height: 50px;
	
	font-size: 20px;
	font-weight: bold;
	border-radius: 10px;
	
}

#imagedisplay .active {
	 
}




</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(function(){
	 var cur = 0;
	 var count = $('.slider_item').length;

	 $('.slider_item').hide();
	 $('.slider_item').eq(0).show();

	 setInterval(function() {    
	  $('.slider_item').eq(cur).fadeOut(function () {
	   $(this).removeClass('active');
	   cur = (cur + 1) % count;
	   $('.slider_item').eq(cur).addClass('active').fadeIn();
	  });
	 }, 5000);
	 
	});

	

</script>


<div style="margin: 0px;">
	
<div id="imagedisplay">
    <div class="slider_item active" ><img src="/resources/img/main_01.jpg"/></div>
    <div class="slider_item"><img src="/resources/img/main_02.jpg"/></div>
    <div class="slider_item"><img src="/resources/img/main_03.jpg"/></div>
    <div class="slider_item last"><img src="/resources/img/main_04.jpg"/></div>
</div>

<div id="imageText" style="text-align: center;">
	<div><h1> 참신한 생각이 필요하세요 ? </h1></div>
	<div><span> 요리통 커뮤니티에 참여하여 수 많은 사진과 각종 정보들을 만나보세요. </span></div>
	<div><h1><button type="button" onclick="location.href='/member/login'">시작하기</button></h1></div>
</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
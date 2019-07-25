<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 2.2.4 -->
<script type="text/javascript"src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
var page = 1;	// 전역변수선언

$('#boardlist').ready(function() {
	newPage();	// 객체선언
	
    var win = $(window);
 
    win.scroll(function() {
        if ($(document).height() - win.height() == win.scrollTop()) {
        	newPage();	// 스크롤이벤트 발생시 뉴페이지 객체 실행
        }
    });
});

function newPage() {
	
    $.ajax({
        url: '/tong/appendlist',	// 주소
        data: {curPage: page++},	// 현재페이지에 스크롤 이벤트 발생할 때 마다 페이지 증강
        dataType: 'html',
        success: function(html) {
        	$('#user_write_div').append(html);	// Tbody에 appendlist를 추가한다
          
        	 
        }	

    });
    
}

</script>
</head>
</html>
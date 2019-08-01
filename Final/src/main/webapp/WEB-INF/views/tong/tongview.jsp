<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- jQuery 2.2.4 -->
<!-- <script type="text/javascript" -->
<!--  src="http://code.jquery.com/jquery-2.2.4.min.js"></script> -->

<!-- Bootstrap 3 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<script type="text/javascript">
$(document).ready(function() {
	InitializeStaticMenu();
	
	$("#follow_btn").click(function(e){ 
		$.ajax({
			type: "get"
			, url: "/userpage/following?user_id=${user_id }"
			, data:	{}
			, dataType: "html"
			, success: function( res ) {
				$("#follow_msg").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		});   
	});
});
</script>

<style type="text/css">

#main_div{
	width: 60%;
	border: 1px solid black;
	margin: 0;
	float: left;
}

#write_div{
	width: 39%;
	
	border: 1px solid blue;
	margin: 0;
	float: left;
}
img{
	width: 100%;
	height: 400px;
}
#uploadImg{
	width: 100%;
	height: 400px;
}

#title_area{
	width: 100%;
}
#content_area{
	width: 100%;
}
#head_area{
	width: 100%;
	height: 100%;
	border-bottom: 1px solid black;
	text-align: center;
}
#tag_area{
	width: 100%;
	height: 100%;
	border-bottom: 1px solid black;
	text-align: center;
}
#comment_area_see{
	width: 100%;
	height: 300px;
	border-bottom: 1px solid black;
	overflow: scroll;
}
#hit_like_area{
	width: 100%;
	height: 100%;
	border-bottom: 1px solid black;
}
#comment_area{
	width: 100%;
	height: 100%;
	border-bottom: 1px solid black;
}
#comment_area button{
	margin-bottom: 5px;
	margin-left: 10px;
}
#userimg{
	width: 40px;
	height: 40px;
	
	border-radius: 40px;
	margin-left: 5px;
	margin-right: 15px;
	margin-top: 5px;
}
#usercommimg{
	width: 40px;
	height: 40px;
	border-radius: 40px;
	
	margin-left: 5px;
	margin-right: 15px;
	margin-top: 5px;
}
#userface{
	font-size: 40px;
}
#kakao{
	height:6%;
	width:6%;
	
}
/* 윈도우 마스크 */
.container {
	border-left : 1px solid #eee;
	border-right : 1px solid #eee;
}


/* 마스크 뛰우기 */
#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 
/* 팝업으로 뜨는 윈도우 css  */ 

.window{
    display: none;
    position:absolute;  
    left:36.5%;
    top:50px;
    margin-left: -500px;
    width:1500px;
    height:800px;
    background-color:#FFF;
    z-index:10000;
    
    overflow: scroll;
 }

</style>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#good_btn").click(function() {
		
		$.ajax({
			type: "get"
			, url: "/userpage/good?content_no=${userpage.content_no}"
			, data: { }
			, dataType: "html"
			, success: function( res ) {
				$("#good_span").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		})
		
		$.ajax({
			type: "get"
			, url: "/userpage/goodbtn?content_no=${userpage.content_no}"
			, data: { }
			, dataType: "html"
			, success: function( res ) {
				$("#1").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		})
	});	
});
</script>


<div id="main_div">
<img src="/uppage/${userpage.storedname }" id="uploadImg"/>

</div>

<div id="write_div">
<div id="head_area">
<span class="glyphicon glyphicon-user"> ${id } </span>
<span class="glyphicon glyphicon-plus">팔로우 </span>
<span class="glyphicon glyphicon-align-justify"></span>
</div>
<div id="tag_area">
<c:if test="${tagList !=null }">
<c:forEach items="${tagList }" var="tag">
	<a href="/userpage/tag?tag=${tag }"><span>#</span>${tag }</a>
</c:forEach>
</c:if>
</div>

<div id="comment_area_see">

<div id="content_area">
<table>
<c:if test="${bool == false }">
<tr>
	<td rowspan="2"><img id="userimg" src="${paceContext.request.contextPath}/resources/img/img4.jpg"/></td>
	<td>${userpage.content }</td>
</tr>
</c:if>
<c:if test="${bool == true }">
<tr>
	<td rowspan="2"><img id="userimg" src="/upload/${img.storedname }"/></td>
	<td>${userpage.content }</td>
</tr>
</c:if>
</table>
<span style="margin-left: 15px;">${id }</span>
<hr>
<div id="userscomment">
<c:set  var="n" value="0"/>
<c:set  var="m" value="1"/>

<c:set  var="cocon" value="0"/>
<c:set  var="cocom" value="1"/>

<c:forEach items="${list }" var="i">
<c:set var="sum" value="${n + m}"/>
<span id="userface${sum }" class="glyphicon glyphicon-user"  style="font-size: 40px;"></span>
<c:forEach items="${userImg }" var="l">
<c:if test="${l.member_code == i.member_code }">
	<img id="usercommimg" src="/upload/${l.storedname }"/>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#userface${sum }").hide();
	});
	</script>
</c:if>
</c:forEach>

${i.member_id }<br>
${i.content }<br>
<fmt:formatDate value="${i.writtendate }" pattern="yyyy년 MM월 dd일 hh:mm:ss" /> &nbsp;&nbsp;&nbsp;&nbsp;
<label id="nextcomentwrite${sum }">댓글</label>&nbsp;&nbsp;&nbsp;&nbsp;

<c:if test="${loginid == i.member_id }">
<a href=""><span id="delete_msg${sum }">삭제</span></a><br><br>
</c:if>
<script type="text/javascript">
$(document).ready(function() {
	$("#delete_msg${sum }").click(function() {
		$.ajax({
			type: "get"
			, url: "/userpage/commDelete?page_no=${i.page_no }&&comment_no=${i.comment_no }"
			, data:  {}
			, dataType: "html"
			, success: function( res ) {
				$("#delete_msg${sum }").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		});
	});
});
</script>

<c:if test="${loginid != i.member_id }">
<br><br>
</c:if>
<script type="text/javascript">
$(document).ready(function() {
	$("#show_cocoment_div${sum }").hide();
//	$("#cocoment_write_btn${sum }").hide();
		
	$("#nextcomentwrite${sum }").click(function() {
	var state = $('#show_cocoment_div${sum }').css('display');
	if(state == 'none'){
	   	$("#show_cocoment_div${sum }").show();
// 	   	$("#cocoment_write_btn${sum }").show();
	} else {
	   		$("#show_cocoment_div${sum }").hide();
// 	   		$("#cocoment_write_btn${sum }").hide();
		}	
	});
});
</script>
<div id="show_cocoment_div${sum }" style="background-color: #F2F2F2">

<div id="ajax_cocoment_show${sum }" style="background-color: #F2F2F2">

<c:set value="0" var="ccm1"/>
<c:set value="1" var="ccm2"/>
<c:forEach items="${cocomentList }" var="coco">
<c:set value="${ccm1 + ccm2 }" var="ccmsum"/>
<c:if test="${i.comment_no == coco.comment_no }">
<c:set var="cocosum" value="${cocon + cocom}"/>
<span id="cocouserface${cocosum }" class="glyphicon glyphicon-user"  style="font-size: 40px;"></span>
<c:forEach items="${userImg }" var="cocouserimg">
<c:if test="${cocouserimg.member_code == coco.member_code }">
	<img id="usercommimg" src="/upload/${cocouserimg.storedname }"/>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#cocouserface${cocosum }").hide();
	});
	</script>
</c:if>
<c:set  var="cocon" value="${cocosum }"/>
</c:forEach>

${coco.member_id }<br>
${coco.content }<br>
<fmt:formatDate value="${coco.writtendate }" pattern="yyyy년 MM월 dd일 hh:mm:ss" />&nbsp;&nbsp;&nbsp;&nbsp;

<c:if test="${loginid == coco.member_id }">
<a href=""><span id="delete_coco_msg${ccmsum }">삭제</span></a><br><br>
</c:if>
<c:if test="${loginid != coco.member_id }">
<br><br>
</c:if>
<script type="text/javascript">
$(document).ready(function() {
	$("#delete_coco_msg${ccmsum }").click(function() {
		$.ajax({
			type: "get"
			, url: "/userpage/cocommDelete?cocomment_no=${coco.cocomment_no }"
			, data:  {} 
			, dataType: "html"
			, success: function( res ) {
				$("#delete_coco_msg${ccmsum }").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		});
	});
});
</script>
</c:if>
<c:set value="${cocosum }" var="ccm1"/>
</c:forEach>

</div>


<textarea rows="2" style="width: 100%; resize: none;" name="cocomment_content" id="cocomment_content${sum }" placeholder="댓글입력"></textarea>
<button id="cocoment_write_btn${sum }">작성</button>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#cocoment_write_btn${sum }").click(function() {
		$.ajax({
			type: "get"
			, url: "/userpage/coComment?comment_no=${i.comment_no }"
			, data:  $("#cocomment_content${sum }") 
			, dataType: "html"
			, success: function( res ) {
				$("#ajax_cocoment_show${sum }").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		});
		$('#cocomment_content${sum }').val('');
	});
});
</script>
<c:set  var="n" value="${sum }"/>
</c:forEach>
</div>



</div>

</div>

<div id="hit_like_area">


<c:if test="${goodCheck == 1}">
<button type="button" id="good_btn"><span id = "1" class="glyphicon glyphicon-star"></span></button>
</c:if>
<c:if test="${goodCheck == 0}">
<button type="button" id="good_btn"><span id = "1" class="glyphicon glyphicon-star-empty"></span></button>
</c:if>
<span id="good"><span id="good_span">좋아요${good_no }</span></span>


<span id="kakao1"><script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<a href="javascript:shareStory()">
<img id="kakao" src="https://developers.kakao.com/sdk/js/resources/story/icon_small.png"/>
</a>
<script type='text/javascript'>
//   //<![CDATA[
//     // 사용할 앱의 JavaScript 키를 설정해 주세요.
//     Kakao.init('b737021ce8920b6a7fdac62cfcfc837d');
//     function shareStory() {
//       Kakao.Story.share({
//         url: 'http://localhost:8088/userpage/view?content_no=1',
//         text: '게시물 공유 #개발테스트 #공유 :)'
//       });
//     }
//   //]]>
</script>
<script type="text/javascript">
$(document).ready(function() {
	$("#write_btn").click(function() {
		$.ajax({
			type: "get"
			, url: "/userpage/viewComment?content_no=${userpage.content_no}"
			, data:  $("#comment") 
			, dataType: "html"
			, success: function( res ) {
				$("#userscomment").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		});
		$('#comment').val('');
	});
});
</script>공유하기
 </span>

<br>
<span>조회수</span> ${userpage.hit }<br>
<span>작성일</span> <fmt:formatDate value="${userpage.write_date }" pattern="yyyy년 MM월 dd일 hh:mm:ss" /><br>
</div>

<div id="comment_area">

<textarea rows="4" style="width: 100%; resize: none;" name="comment" id="comment" placeholder="댓글입력"></textarea>

<button id="write_btn">작성</button>
<button id="no_btn">취소</button>

</div>

</div>



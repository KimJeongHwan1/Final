<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
#main_div {
	width: 60%;
	border: 1px solid black;
	margin: 0;
	float: left;
}

#write_div {
	width: 40%;
	border: 1px solid black;
	margin: 0;
	float: left;
}

#uploadImg {
	width: 900px;
	height: 620px;
}

#title_area {
	width: 100%;
}

#content_area {
	width: 100%;
}

#head_area {
	width: 100%;
	height: 100%;
	border-bottom: 1px solid black;
	text-align: center;
}

#tag_area {
	width: 100%;
	height: 100%;
	border-bottom: 1px solid black;
	text-align: center;
}

#comment_area_see {
	width: 100%;
	height: 325px;
	border-bottom: 1px solid black;
	overflow: scroll;
}

#hit_like_area {
	width: 100%;
	height: 100%;
	border-bottom: 1px solid black;
}

#comment_area {
	width: 100%;
	height: 100%;
	border-bottom: 1px solid black;
}

#comment_area button {
	margin-bottom: 5px;
	margin-left: 10px;
}

#userimg {
	width: 40px;
	height: 40px;
	border-radius: 40px;
	margin-left: 5px;
	margin-right: 15px;
	margin-top: 5px;
}

#usercommimg {
	width: 40px;
	height: 40px;
	border-radius: 40px;
	margin-left: 5px;
	margin-right: 15px;
	margin-top: 5px;
}

#userface {
	font-size: 40px;
}

/* 윈도우 마스크 */
.container {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}

/* 마스크 뛰우기 */
#mask {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}
/* 팝업으로 뜨는 윈도우 css  */
.window {
	display: none;
	position: absolute;
	left: 36.5%;
	top: 50px;
	margin-left: -500px;
	width: 1500px;
	height: 620px;
	background-color: #FFF;
	z-index: 10000;
	overflow: hidden;
}
.slide {
 	width: 900px;
 	position: relative;
	height: 620px;
	overflow: hidden;
	margin: 0px;
}

#multi_ul {
	height: 620px;
	position: absolute;
	top: 0;
	left: 0;
	font-size: 0;
	margin: 0px;
	padding: 0px;
	display: inline-block;
	list-style: none;
}

#multi_li {
	display: inline-block;
	margin: 0px;
	padding: 0px;
}

#multi_back {
	position: absolute;
	top: 250px;
	left: 0;
	cursor: pointer;
	z-index: 1;
}

#multi_next {
 	position: absolute;
	top: 250px;
	right:0px;
	cursor: pointer;
	z-index: 1;
}
</style>

<script type="text/javascript">
	function button_event() {
		if (confirm("정말 삭제하시겠습니까??") == true) { //확인
			$(location).attr("href",
					"/tong/delete?content_no=${userpage.content_no}");
		} else { //취소
			return;
		}
	}
</script>

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
				$("#good_btn").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		})
	});
	
	$("#blockSee").click(function() {
			
		$.ajax({
			type: "get"
			, url: "/tong/blockSee?content_no=${userpage.content_no }"
			, data: {}
			, dataType: "html"
			, success: function( res ) {
				$("#blockSee_msg").html(res);
				console.log("성공");
			}
			, error: function() {
				console.log("실패");
			}
		})
	});	
});
</script>

<script type="text/javascript">
    $(document).ready(function(){
      var imgs;
      var img_count;
      var img_position = 1;

      imgs = $("#multi_ul");
      img_count = imgs.children().length;
      //버튼을 클릭했을 때 함수 실행
      $('#multi_back').click(function () {
        back();
      });
      $('#multi_next').click(function () {
        next();
      });

      function back() {
        if(1<img_position){
          imgs.animate({
            left:'+=900px'
          });
          img_position--;
        }
      }
      function next() {
        if(img_count>img_position){
          imgs.animate({
            left:'-=900px'
          });
          img_position++;
        }
      }

    });
</script>

<div id="main_div" class="multiple-items">
<c:if test="${userpage.originname !=  null}">
<c:if test="${multiImgSize > 1 }">
	<div class="slide">
		<img width="100" id="multi_back" alt="" src="${paceContext.request.contextPath}/resources/img/back.png">
		<ul id="multi_ul">
			<c:forEach items="${multiImg }" var="i">
				<li id="multi_li"><img src="/uppage/${i }" id="uploadImg" /></li>
			</c:forEach>
		</ul>
		<img width="100" id="multi_next" alt="" src="${paceContext.request.contextPath}/resources/img/next.png">
	</div>
</c:if>
<c:if test="${multiImgSize == 1 }">
	<c:forEach items="${multiImg }" var="i">
		<li id="multi_li"><img src="/uppage/${i }" id="uploadImg" /></li>
	</c:forEach>
</c:if>
</c:if>

<c:if test="${userpage.originname ==  null}">
<img src="${paceContext.request.contextPath}/resources/img/NoImg.png" id="uploadImg"/>
</c:if>

</div>

<div id="write_div">
<div id="head_area">
<span class="glyphicon glyphicon-user" style="margin-left: 20px; font-size: 15px;"> ${id } </span>
<span style="margin-left: 20px; font-size: 15px;">공개여부 : </span>
<c:if test="${userpage.blockSee == 0 }">
<span id="blockSee" style="color: blue;"><span id="blockSee_msg">공개</span></span>
</c:if>
<c:if test="${userpage.blockSee == 1 }">
<span id="blockSee" style="color: red;"><span id="blockSee_msg">비공개</span></span>
</c:if>
<span>(클릭시 변경)</span>
</div>
<div id="tag_area">
<c:if test="${tagList !=null }">
<c:forEach items="${tagList }" var="tag">
	<a href="/userpage/tag?tag=${tag }"><span style="color: blue;">#${tag }</span></a>
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
<span id="delete_msg${sum }">삭제</span><br><br>
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
<span id="delete_coco_msg${ccmsum }">삭제</span><br><br>
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
<button id="cocoment_write_btn${sum }" class="btn btn-success">작성</button>
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
<button type="button" id="good_btn" class="btn btn-primary" ><span class="glyphicon glyphicon-star"></span></button>
</c:if>
<c:if test="${goodCheck == 0}">
<button type="button" id="good_btn" class="btn btn-primary" ><span class="glyphicon glyphicon-star-empty" ></span></button>
</c:if>
<span id="good"><span id="good_span">${userpage.good }</span></span>&nbsp;&nbsp;&nbsp;


<!-- 게시글 삭제하기 -->
<input type="button" id="deleteBtn" value="수정" onclick="location.href='/tong/update?content_no=${userpage.content_no }'" class="btn btn-info"/>
<input type="button" id="deleteBtn" value="삭제" onclick="button_event();" class="btn btn-danger"/>

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
</script>

<br><br>
&nbsp;${userpage.address }
<c:if test="${userpage.address != null }">
<span id="map" class="glyphicon glyphicon-map-marker"></span>
</c:if>

<div>

<script type="text/javascript">
$(document).ready(function(){
	$("#map").click(function(){
		var popUrl = "/userpage/map?content_no=${userpage.content_no }";	//팝업창에 출력될 페이지 URL
	
		var popOption = "width=500, height=400, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);
	});
});
</script>
 
</div>




<br>
<span>조회수</span> ${userpage.hit }<br>
<span>작성일</span> <fmt:formatDate value="${userpage.write_date }" pattern="yyyy년 MM월 dd일 hh:mm:ss" /><br>
</div>
<div id="comment_area">

<textarea rows="4" style="width: 100%; resize: none;" name="comment" id="comment" placeholder="댓글입력"></textarea>

<button id="write_btn" class="btn btn-success">작성</button>

</div>
</div>



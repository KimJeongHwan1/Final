<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
 src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style type="text/css">

#title {
	color: white;
	font-size: 20px;
}

.navbar-form {
	padding-right : 10px;
}

#bell {
	font-size : 25px;
}

#cloud {
	font-size : 25px;
}

#ssnav{
	padding-right : 10px;
}

#mymenu {
	font-size: 25px;
}


</style>

</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <c:if test="${not login }">
      <a class="navbar-brand" href="/main" id="title">요리Tong</a>
      </c:if>
      <c:if test="${login }">
      <a class="navbar-brand" href="/tong/timeLinePage" id="title">요리Tong</a>
      </c:if>
 
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li ><a href="/best/list">베스트게시판<span class="sr-only">(current)</span></a></li>
        
        <c:if test="${mem.member_type eq 2 }" >
        <li><a href="/black/list">블랙리스트</a></li>
        </c:if>
      </ul>

     
      <ul class="nav navbar-nav navbar-right" id="ssnav">
        <li><a href="/tong/write"><span class="glyphicon glyphicon-cloud-upload" id="cloud"></span></a></li>
        
      
      
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-align-justify" id="mymenu"></span></a>
          <ul class="dropdown-menu" role="menu">
			<tr>
				<c:if test="${bool == false }">
<!-- 					<td rowspan="2"><img src="/resources/img/img4.jpg"/> -->
			<!-- 		<input type="file" name="file" id="file"/></td> -->
					<td>${loginid }</td>	
					
				</c:if>
				
				<c:if test="${bool == true }">
<%-- 					<td rowspan="2"><img src="/upload/${img.storedname }"/></td> --%>
					<td>${loginid }</td>
				</c:if>
			</tr>
			
			</table>
            <li class="divider"></li>
            <li><a href="/tong/mypage">마이페이지</a></li>
            <li class="divider"></li>
            <li><a href="/member/mypage">정보수정</a></li>
            <li><a href="/member/logout">로그아웃</a></li>
          </ul>
        </li>
      </ul>
      
      <form class="navbar-form navbar-right" role="search" action="/layout/search" method="post">
        <div class="form-group">
          <input type="text" id="text" name="text" class="form-control" placeholder="사진 인물 또는 그룹" />
          
        </div>
        <button type="submit" class="btn btn-default">검색</button>
      </form>
      
      
      
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

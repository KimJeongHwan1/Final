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

#searchsize {

	margin-left: 60px;

   width: 1000px;

}

</style>

</head>
<body>

<nav class="navbar navbar-inverse" style="margin:0; width: 1920px;">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/main" id="title">요리Tong</a>
      <a class="navbar-brand" id="title"></a>
        <a class="navbar-brand" id="title"></a>
        <a class="navbar-brand" id="title"></a>
    
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      
      </ul>

     
      <button type="button" class="btn btn-default navbar-btn navbar-right" onclick="location.href='/member/login'">로그인</button>
      
      
      
      
      
       <form class="navbar-form" role="search" >
        <div class="form-group" style="margin-left: 60px;" >
          <input type="text" class="form-control" placeholder="사진 인물 또는 그룹" id="searchsize"/>
          
        </div>
        <button type="submit" class="btn btn-default">검색</button>
      </form>
      
      
      
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
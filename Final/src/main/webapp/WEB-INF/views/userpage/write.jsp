<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#write_div{
	margin: 0 auto;
	width: 1100px;
}
</style>
<body>


<h1>게시글 쓰기</h1>
<hr>

<div id="write_div">

<form action="/userpage/write" method="post" enctype="multipart/form-data">
<table style="width: 100%">
<tr>
	<td style="width: 20%">제목</td>
	<td style="width: 80%"><input type="text" name="content_title" id="content_title" placeholder="내용을 입력해주세요" style="width: 498px;"/></td>
</tr>
<tr>
	<td>태그하기</td>
	<td><input type="text" name="tag" id="tag" placeholder="사람, 내용 태그" style="width: 498px;"/></td>
</tr>

<tr>
	<td>위치</td>
	<td><input type="text" name="content_map" id="" placeholder="위치 " style="width: 498px;"/></td>
</tr>
<tr>
	<td>사진선택</td>
	<td><input type="file" name="file" placeholder="내용을 입력해주세요" style="width: 498px;"/></td>
</tr>
<tr>
	<td>내용</td>
</tr>
<tr>
	<td colspan="2">
		<textarea rows="20" cols="100" name="content"></textarea>
	</td>
</tr>
</table>

<button>작성</button>
<button type="button" onclick="location.href='/member/main2'">취소</button>
</form>

</div>

</body>
</html>
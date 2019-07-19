<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/memberside.jsp" />

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['수', 'Log'],
          ['작성 댓글', 11],
          ['작성 게시물', 50],
          ['즐겨찾기', 2],
          ['팔로잉' , 5],
          ['팔로워' , 5]
        ]);

        var options = {
          title: 'My Log',
          pieHole: 0.4,
          legend: 'none' ,
          pieSliceText: 'label'
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
</script>

<style>
img{
	margin-right: 100px;
	width: 100px;
	height: 100px;
}
#right_menu{
	border: 1px solid black ;
	float: left ;
	width: 30% ;
	height: 900px;
}
</style>

<div id="chart_div"></div>
<div id="see_menu" style="width: 50%; border-right: none ;">
<div id="see_menu_menu" style="margin: 0 auto; width: 68%; ;">
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
</table>

<table>
<tr>
	<td><label style="width: 200px; margin-top: 30px; font-size: 25px; font-weight: 100;">이름</label> </td>
	<td><label style="width: 400px; height: 30px; margin-top: 30px; font-weight: normal;">${member.member_name }</label></td>
</tr>
<tr>
	<td><label style="width: 200px; margin-top: 30px; font-size: 25px; font-weight: 100;">이메일</label> </td>
	<td><label style="width: 400px; height: 30px; margin-top: 30px; font-weight: normal;">${member.member_email }</label></td>
</tr>
<tr>
	<td><label style="width: 200px; margin-top: 30px; font-size: 25px; font-weight: 100;">주소</label> </td>
	<td>
		<label style="width: 400px; height: 30px; margin-top: 30px; font-weight: normal;">${member.member_address }</label>
	</td>
</tr>
<tr>
	<td><label style="width: 200px; margin-top: 30px; font-size: 25px; font-weight: 100;">생년월일</label> </td>
	<td><label style="width: 400px; height: 30px; margin-top: 30px; font-weight: normal;"><fmt:formatDate value="${member.member_birth }" pattern="yyyy년 MM월 dd일" /></label></td>
</tr>
<tr>
	<td><label style="width: 200px; margin-top: 30px; font-size: 25px; font-weight: 100;">전화번호</label> </td>
	<td><label style="width: 400px; height: 30px; margin-top: 30px; font-weight: normal;">${member.member_phone }</label></td>
</tr>
<tr>
	<td><label style="width: 200px; margin-top: 30px; font-size: 25px; font-weight: 100;">성별</label> </td>
	<td>
		<label style="width: 400px; height: 30px; margin-top: 30px; font-weight: normal;">${member.member_gender }</label>
	</td>
</tr>
</table>
</div>
</div>
<div id="right_menu">
<div id="donutchart" style="width: 500px; height: 500px;"></div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
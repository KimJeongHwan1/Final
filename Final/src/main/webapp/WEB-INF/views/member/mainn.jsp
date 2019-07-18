<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	InitializeStaticMenu();

// 	var match_date = document.getElementById("matchdate").value;
// 	console.log(match_date);
// 	var cancle_date=parse(match_date);
// 	console.log(cancle_date);

	
// 	cancle_date.setHours(cancle_date.getHours()-3);
// 	var cancle=getFormatDate(cancle_date);
// 	console.log(cancle);
	
// 	document.getElementById("cancledate").innerHTML+=cancle;
	var match_date = document.getElementsByName("matchdate");
	var c = document.getElementsByName("cancledate");
	
	for(var i=0; i<match_date.length; i++){
		var cancle_date = parse(match_date[i].value)
// 		console.log(match_date[i].value)
		
		cancle_date.setHours(cancle_date.getHours()-3);
		var cancle = getFormatDate(cancle_date);
		
		c[i].innerHTML += cancle;
	}
});

function parse(str){
	var y=str.substr(0,4);
	var m=str.substr(4,2);
	var d=str.substr(6,2);
	var h=str.substr(9,2);
	var mi=str.substr(12,2);
	
	return new Date(y,m-1,d,h,mi);
}

function getFormatDate(cancle_date){
	var hours=cancle_date.getHours();
	var mi=cancle_date.getMinutes();
	
	return hours+':'+mi;
}
//////////////////////////네비게이션 바 //////////////////////////
var stmnLEFT = 10; // 오른쪽 여백 
var stmnGAP1 = 0; // 위쪽 여백 
var stmnGAP2 = 250; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
var stmnBASE = 200; // 스크롤 시작위치 
var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
var stmnTimer; 

function RefreshStaticMenu() { 
var stmnStartPoint, stmnEndPoint; 
stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
if (stmnStartPoint != stmnEndPoint) { 
stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
stmnRefreshTimer = stmnScrollSpeed; 
}
stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
}

function InitializeStaticMenu() {
document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
RefreshStaticMenu();

}
</script>

<style type="text/css">
/* 메뉴 네비게이션바 */
#STATICMENU {
	width: 200px;
	margin: 0pt;
	width: 200px;
	padding: 0pt;  
	position: absolute; 
	left: 0px;
	top: 0px;
}

/* 네비게이션바 테이블 */
table {
	border-collapse: collapse;
	border-top: 3px solid black;
	border-bottom: 3px solid black;
	width:auto;
}
.table th, td{
 	border: 1px solid #ddd;
 	padding: 10px;
 	text-align:center;
}
.table th:hover{
	background: #D5D5D5;
}
.table th:first-child, td:first-child{
 	border-left: 0;
}
.table th:last-child, td:last-child{
 	border-right: 0;
}
/* 네비게이션바 테이블 */

/* 하이퍼링크 밑줄 제거 */
#STATICMENU a { text-decoration:none; color:#000000; }

.mypagemain {
	margin: 0 5% 0 250px;
}

.myteam div{	/* class가 myteam인 것의 하위요소 중 div요소만 선택 */
	width:600px;
	height:220px;
}
.myteam img{
	width:170px;
	height:165px;
	margin-top:30px;
	margin-left:50px;
}
.userInfo{
	position: absolute;
	left:530px;
	top:360px;
	color:white;
	font-size:30px;
	font-weight:bold;
}
.reservation table, th, td{
	height:50px;
	text-align: center;
	border:1px solid #ccc;
	border-collapse:collapse; /* 각각의 셀들의 테두리가 겹치는 부분을 하나의 선으로 합침 */
}
.reservation th{
	background:#D9E1E8;
}

td[name="cancledate"]{
	color: #0080ff;
	font-size: 13px;
}

a {
	color: #0080ff;
}

</style>

<div id="STATICMENU">
	<table class="table statictable">
		<tr>
			<th><a href="/mypage/main" >예매 확인/취소</a></th>
		</tr>
		<tr>
			<th><a href="/member/my1to1">내 1:1 문의 내역 확인</a></th>
		</tr>
		<tr>
			<th><a href="/member/modify">회원 정보 수정</a></th>
		</tr>
	</table>
</div>

<div class="mypagemain">

<h1>마이페이지</h1>
<hr>

<div class="myteam">
<c:choose>
	<c:when test="${myteam eq 'KIA' }"><div style="background:#F01E23"><img src="/img/teamLogo/kia.png"/></div></c:when>
	<c:when test="${myteam eq 'KT' }"><div style="background:#000000"><img src="/img/teamLogo/kt.png"/></div></c:when>
	<c:when test="${myteam eq 'LG' }"><div style="background:#C30452"><img src="/img/teamLogo/lg.png"/></div></c:when>
	<c:when test="${myteam eq 'NC' }"><div style="background:#315288"><img src="/img/teamLogo/nc.png"/></div></c:when>
	<c:when test="${myteam eq 'SK' }"><div style="background:#F20017"><img src="/img/teamLogo/sk.png"/></div></c:when>
	<c:when test="${myteam eq '두산' }"><div style="background:#131230"><img src="/img/teamLogo/doosan.png"/></div></c:when>
	<c:when test="${myteam eq '롯데' }"><div style="background:#002856"><img src="/img/teamLogo/lotte.png"/></div></c:when>
	<c:when test="${myteam eq '삼성' }"><div style="background:#074CA1"><img src="/img/teamLogo/samsung.png"/></div></c:when>
	<c:when test="${myteam eq '키움' }"><div style="background:#820024"><img src="/img/teamLogo/kiwoom.png"/></div></c:when>
	<c:when test="${myteam eq '한화' }"><div style="background:#FF6600"><img src="/img/teamLogo/hanwha.png"/></div></c:when>
	<c:otherwise><div style="background:#ccc"><img src="/img/teamLogo/noteam.png"/></div></c:otherwise>
</c:choose>
</div>

<span class="userInfo">
	아이디 : ${userid }<br>
	닉네임 : ${usernick }<br>
	마이팀 : <c:if test="${myteam ne '0' }">${myteam }</c:if>
			<c:if test="${myteam eq '0' }"><a href="/member/modify">설정하기</a></c:if>
</span>

<div class="reservation" >

<h3>예매 확인/취소</h3>
<hr>
<span>예매 별 <u style="color:#0080ff;" >예매번호</u>를 클릭하면 예매 상세내용을 확인 할 수 있습니다.</span><br>
<span>예매 별 <u style="color:#0080ff;">상태</u>를 클릭하면 취소여부와 예매 취소를 할수 있습니다.</span><br><br>

<table>
<colgroup width="150px"></colgroup>
<colgroup width="300px"></colgroup>
<colgroup width="150px"></colgroup>
<colgroup width="60px"></colgroup>
<colgroup width="130px"></colgroup>
<colgroup width="150px"></colgroup>
<colgroup width="100px"></colgroup>

<thead>
	<tr>
		<th>예매번호</th>
		<th>티켓명</th>
		<th>관람일시</th>
		<th>매수</th>
		<th>좌석번호</th>
		<th>취소가능일</th>
		<th>상태</th>
	</tr>
</thead>
<c:forEach items="${reservecodeList}" var="i" varStatus="Istatus">

	<!-- setting부분 -->
 	<c:forEach items="${reserveList }" var="j">
		<c:if test="${i.reserve_code eq j.reserve_code }">
			<c:set value="${j.ticket_code }" var="each_ticketcode"/>
		</c:if>
	</c:forEach>
 	<c:forEach items="${ticketList }" var="j">
		<c:if test="${j.ticket_code eq each_ticketcode }">
			<c:set value="${j.match_code }" var="each_matchcode"/>
			<c:set value="${j.seat_code }" var="each_seatcode"/>
		</c:if>
	</c:forEach>
	
	<tr>
		<td><a href="/mypage/ticket?reserve_code=${i.reserve_code }">${i.reserve_code }</a></td>
		<td>
			<c:forEach items="${matchList }" var="m" varStatus="Mstatus">
				<c:if test="${Istatus.index eq Mstatus.index }">
				[2019 신한은행 MY CAR KBO 리그]<br>${m.hometeam_name } vs ${m.awayteam_name }
				</c:if>
			</c:forEach>
		</td>
		<td>
			<c:forEach items="${matchList }" var="m" varStatus="Mstatus">
				<c:if test="${Istatus.index eq Mstatus.index }">
				<fmt:formatDate value="${m.match_date}" pattern="yyyy-MM-dd(E) HH:mm"/>
				</c:if>
			</c:forEach>
		</td>
		<td>
			<c:forEach items="${seatCntList }" var="s" varStatus="Sstatus">
				<c:if test="${Istatus.index eq Sstatus.index }">
				${s }장
				</c:if>
			</c:forEach>
		</td>
		<td>
			<c:forEach items="${ticketList }" var="t" varStatus="tStatus">
				<c:if test="${t.match_code eq each_matchcode }">
				<c:forEach items="${seatList }" var="s" varStatus="Sstatus">
					<c:if test="${tStatus.index eq Sstatus.index && t.seat_code eq s.seat_code }">
						${s.seat_block }블럭 ${s.seat_number }석<br>
					</c:if>
				</c:forEach>
				</c:if>
 			</c:forEach>
		</td>
		<td name="cancledate">
			<c:forEach items="${matchList }" var="m">
				<c:if test="${m.match_code == each_matchcode}"> 
					<fmt:formatDate var="matchdate" value="${m.match_date}" pattern="yyyyMMdd HH:mm" />
					<input type="hidden" id="matchdate" name="matchdate" value="${matchdate }" />
					<fmt:formatDate value="${m.match_date }" pattern="yyyy-MM-dd" />
				</c:if>
			</c:forEach>
		</td>
		<td><a href="/mypage/ticket?reserve_code=${i.reserve_code }">예매 완료</a></td>
	</tr>
</c:forEach>
</table>
</div>
</div>

<c:import url="/WEB-INF/views/layout/mypage_paging.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />
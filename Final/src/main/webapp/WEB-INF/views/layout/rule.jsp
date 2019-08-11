<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/beforeheader.jsp" />

<style type="text/css">

#title3 {

	margin-left: 100px;
	margin-right: 300px;
	width: 1500px;
	 
}

#wrap {
	
	margin-left: 100px;
	margin-right: 300px;
	width: 1500px;
	height: 700px;
	white-space: normal;
	overflow: auto;
	
	
	font-style: inherit;
	
}

#content{

	white-space: pre-line;
	font-size: small;
	
}

#end{
	margin-left: 100px;
	margin-right: 300px;
	width: 1500px;
	

}

#prev{
	
	float: right;
	margin-right: 300px;
	
}

</style>
</head>
<body>


<div id="title3">
	<h3>개인정보 보호 정책 </h3>
	<hr>
</div>


<div id="wrap" >

<pre id="content">	


<span style="font-weight:bold">제1조(목적)</span>
이 규정은 요리통 인터넷 홈페이지 설치, 유지 및 제반 관리에 필요한 사항을 정하여 본 홈페이지 사용자들에게 다양한 정보를 제공함은 물론 요리통 대외홍보에 기여하는 것을 목적으로 한다.

<span style="font-weight:bold">제2조(관리대상)</span>
② 본 홈페이지와 연결되는  홈페이지에 대해서는 통일된 기준에 의해 설치,운영되도록 하며, 구성원의 자발적인 참여를 유도한다.

<span style="font-weight:bold">제3조(관리범위)</span>
본 홈페이지에서 관리하는 정보 내용은 다음 각호와 같다.

1. 요리통 홍보 관련 사항
2. 요리통 각종 행사 안내 및 공지사항
3. 요리통 각종 규정류
4. 요리통 행정 조직 및 구성원 정보
5. 홈페이지상의 문의사항 또는 민원사항 처리
6. 기타 필요하다고 인정되는 정보 등

<span style="font-weight:bold">4조(업무분장)</span>
① 홈페이지 관리운영부서 (이하 “운영부서”라 한다)는 홍보디자인센터로 하며, 운영부서는 다음 각 호의 업무를 담당한다. 
1. 전체 홍보에 관련된 콘텐츠 관리 및 홈페이지 운영에 필요한  업무
2. 홈페이지 개설 등록과 폐쇄에 관한 업무
3. 홈페이지에 구성에 관한 표준안 수립
4. 홈페이지 운영에 필요한 기술지원 및 자료 게시, 정보 갱신 업무
5. 홈페이지의 유지 발전을 위한 정기적 기능 개선 업무


<span style="font-weight:bold">제5조(콘텐츠 관리)</span>
홈페이지 게시판은 최대한 자유롭게 의견을 제시하고 공유할 수 있도록 하는 것을 원칙으로 한다. 단, 저속한 표현, 반사회적인 내용, 광고류 또는 요리통의 명예를 훼손하거나 특정인에 대한 비방행위 등에 해당하는 게시물에 대하여는 이를 삭제할 수 있다.

<span style="font-weight:bold">제5조의 2(홈페이지 업무의뢰)</span>
홈페이지를 통한 각종 행사 안내 및 공지 사항, 정보 갱신 등의 요청은 업무 협조전 양식을 통하여 운영부서 담당자에게 게재 예정일 6일 전까지 의뢰함을 원칙으로 한다. 단, 팝업창 제작 및 홍보메일 발송에 관한 사항은 협조전 접수 후 운영부서장의 판단에 따라 제작 및 발송을 결정 한다.

<span style="font-weight:bold">제7조(비밀번호 부여 및 관리)</span>
① 자료관리 책임자는 비밀번호 누설로 인한 자료 변경 등 자료의 훼손을 방지하여야 한다.
② 비밀 번호는 분기별로 변경 사용함을 원칙으로 한다.

<span style="font-weight:bold">8조(운영실적 분석)</span>
① 운영부서는 홈페이지의 효율적인 운영을 위해 분기별 웹 사이트 운영실적  등을 분석, 관리하여야 한다.
② 운영부서는 운영실적 분석결과를  공지하여 홈페이지개선 방안 등에 반영토록 하여야 한다.





</pre>
</div>

<div id="end">
	<hr>
</div>

<button id="prev" class="btn btn-danger" onclick="location.href='/main'">이전으로</button>
<br><br><br><br><br><br><br>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<c:import url="/WEB-INF/views/layout/header.jsp" />



<style>
#write_div{
   margin: 0 auto;
   width: 1100px;
}   
#h1{
	margin-left: 21% ;

}
#hr{
	width: 60%
}
</style>

<h1 id="h1">게시글 쓰기</h1>
<hr id="hr">


<div id="write_div">

<form action="/tong/write" method="post" enctype="multipart/form-data" style="height: 100%;">
<table style="width: 100%;">
<tr>
   <td style="width: 20%">제목</td>
   <td style="width: 80%"><input type="text" name="content_title" id="content_title" placeholder="내용을 입력해주세요" style="width: 498px;"/></td>
</tr>
<tr>
   <td style="width: 20%">공개여부</td>
   <td style="width: 80%"><input type="radio" value="0" name="blockSee" id="blockSee" checked="checked"/>공개
   						  <input type="radio" value="1" name="blockSee" id="blockSee"/>비공개
   	</td>
</tr>
<tr>
   <td>태그하기</td>
   <td><input type="text" name="tag" id="tag" placeholder="사람, 내용 태그" style="width: 498px;"/></td>
</tr>

<tr>
   <td>위치</td>
   <td><input type="text" name="address" id="address" value="${userpage.address }">
	<input type="text" name="x" id="x" value="${userpage.x }">
	<input type="text" name="y" id="y" value="${userpage.y }">
	<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"></td>
</tr>
<tr>
   <td>사진선택</td>
   <td><input multiple="multiple" type="file" name="file" style="width: 498px;"/></td>
</tr>
<tr>
   <td>내용</td>
</tr>
<tr>
   <td colspan="2">
      <!-- <textarea  rows="20" cols="100" name="content"></textarea> -->
      <textarea class="form-control" id="editor1" name="content"></textarea>
      <script>      
      CKEDITOR.replace('editor1' );
      </script>
      
   </td>
</tr>
</table>

<div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e538de94727e959fea35c4a35a1727a5&libraries&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
 
    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
 
 
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 주소 정보를 해당 필드에 넣는다.
//                 document.getElementById("sample5_address").value = fullAddr;
                
                document.getElementById("address").value = fullAddr;
                
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
 
                        var result = results[0]; //첫번째 결과의 값을 활용
 
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        
                        document.getElementById('y').value = result.y;
                        document.getElementById('x').value = result.x;
                        
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>

<button>작성</button>
<button type="button" onclick="location.href='/member/main2'">취소</button>
</form>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Insert title here</title>
</head>
<body>

<div id="map" style="width:100%;height:300px;margin-top:10px;"></div>
<label style="width: 100%;">${map.address }</label>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e538de94727e959fea35c4a35a1727a5&libraries&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(${map.y }, ${map.x }), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
 
    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(${map.y }, ${map.x }),
        map: map
    });
</script>

</body>
</html>
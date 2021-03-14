<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#info{
		color : #848484;
	}
	#info>p:last-child {
		color : black;
		text-align: right;
	}
	.vehicle{
		height : 70px;
		width : 70px;
		float: left;
	}
	.gray{
		color : #848484;
	}
</style>
<title>삼부도서관 : 도서관안내</title>
</head>
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>
<link rel="stylesheet" href="resources/css/slick.css">
<body>
<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<div id='body'>
   <div id='sidemenu'>
      <div class="title">
         <h2>도서관안내</h2>
      </div>
      <ul>
      <li><a href="/info/greeting">인사말</a></li>
         <li><a href="/info/libStatus">도서관현황</a></li>
         <li><a href="/info/userGuide">이용안내</a></li>
         <li><a href="/info/comingWay">오시는길</a></li>
      </ul>
      <div class="lastchild"></div>
   </div>

		<div id='layer'>
			<h3>오시는 길</h3>
			<div style="width: 100%; height: 20px;">
				<ul>
					<li>도서관안내　>　</li>
         <li>오시는 길</li>
				</ul>

			</div>
			<hr style="margin-top: 30px;">
			<div id="map" style="width: 100%; height: 400px;"></div>
			<br>
			<h3>주소</h3>
			<p>서울시 강남구 학동로67길 11 (청담동 35-10) 청담평생학습관 3층</p>
			<br>
			<h3>교통편</h3>
			<img src="../resources/images/subway.png" class="vehicle">
			<p>　7호선 강남구청역 4번 출구 도보 5분</p>
			<p class="gray">　(강남세무서(구)방향->영진약국 골목길-> 청담평생학습관3층 정다운도서관)</p>
			<br>
			<img src="../resources/images/bus.png" class="vehicle"> 
			<p>　강남구청역 하차 (강남구청역 지하철 3번출구 지하연결)</p>
			<p class="gray">　 -간선 301, 401, 640</p>
			<p class="gray">　　 　 　　-지선 3011, 3219, 3414</p>
			<p class="gray">　 　  　　　-순환 41번 버스</p>
			<br><br><br><br><br><br><br>
		</div>
		
</div>
<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>
<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7db9f0988b259153f26610f825dbd05"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.519033660633575, 127.04637655375501), // 지도의 중심좌표
		level : 4
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var imageSrc = '../resources/images/sbpin.png', // 마커이미지의 주소입니다    
	imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	imageOption = {
		offset : new kakao.maps.Point(27, 69)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
			imageOption), markerPosition = new kakao.maps.LatLng(
			37.519033660633575, 127.04637655375501); // 마커가 표시될 위치입니다

	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition,
		image : markerImage
	// 마커이미지 설정 
	});

	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
</script>
</body>
</html>
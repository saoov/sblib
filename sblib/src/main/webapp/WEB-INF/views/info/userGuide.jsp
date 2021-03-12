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
</style>
<title>삼부도서관</title>
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
      	<li><a href="/info/greeting">인삿말</a></li>
         <li><a href="/info/libStatus">도서관현황</a></li>
         <li><a href="/info/userGuide">이용안내</a></li>
         <li><a href="/info/comingWay">오시는길</a></li>
      </ul>
      <div class="lastchild"></div>
   </div>
   
   <div id='layer'>
      <h3>이용안내</h3>
      <div style="width:100%; height:20px;">
      <ul>
         <li>도서관안내　>　</li>
         <li>이용안내</li>
      </ul>
    
   </div>
   <hr style="margin-top:30px;">
		<div id="info">
			<p>안녕하세요. 삼부도서관 홈페이지에 오신 것을 환영합니다.</p>
			<p>삼부도서관은 2021년 개관한 서울특별시 소속 무인도서관으로 지역주민들의 지식정보 및 문화활동과 평생학습
				증진을 위해 최선의 노력을 기울이고 있습니다.</p>
			<p>언제 어디서나 누구나 원하는 자료와 정보를 얻을 수 있도록 하며, 평생학습도시 강남구와 함께 다양한 강좌 및
				전시회 등을 통하여 지역주민의 삶의 질 향상에 기여하고자 합니다.</p>
			<p>우리도서관은 ‘창의적 민주시민을 기르는 혁신미래 교육’이라는 서울교육 방향에 발맞춰 도서관을 이용하시는 모든 분
				들이 도서관을 통해 미래를 꿈꾸고 만들어 갈 수 있도록 지원하겠습니다.</p>
			<p>지역사회를 아우르는 소통과 감동이 있는 삼부도서관이 될 수 있도록 최선을 다하겠습니다.</p>
			<p>-서울특별시 삼부도서관장-</p>
		</div>
		</div>
</div>

<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>
<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
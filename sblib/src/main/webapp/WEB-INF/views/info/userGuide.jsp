<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삼부도서관</title>
<style>
	.info{
		color : #848484;
	}
</style>
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
			<h3>이용안내</h3>
			<div style="width: 100%; height: 20px;">
				<ul>
					<li>도서관안내　>　</li>
         <li>인사말</li>
				</ul>

			</div>
			<hr style="margin-top: 30px;">
				<h3>도서 대출</h3>
				<br>
				<div class="info">
				<!-- content -->
				<p>▶대출권수 : 도서 5권<br>
				　(서울특별시교육청 산하 도서관 및 평생학습관의 총 대출권수 :30권)</p>
				<p>▶대출기간 : 14일</p>
				<p>▶대출방법 : 대출 시 반드시 통합대출회원카드 제시, 본인만 대출가능<br>
				　(대출카드를 제시하지 않으면반납은 가능하나 대출은 불가능)</p>
				<p>▶재대출 : 반납과 동시에 재대출 가능(단, 예약된 도서는 재대출 불가)</p>
				<p>▶대출제한도서 : 귀중자료(고서, 희귀본 등), 참고자료(서지류, 사전류, 도감류 등), 기타 대출제한이 필요하다고 인정되는 자료,<br>
				　도서검색시 소장된 자료실이 '순회문고'로 구분된 자료</p>
				<p>▶대출자료연체 : 연체자료에 대해 연체료납부와 대출정지를 선택<br>
				　※서울특별시립도서관 및 평생학습 사용료징수 등 에 관한 조례<br>
				　- 대출자료의 반납을 연체하였을 때에는 1책당 1일 100원의 연체료를 부과하되,<br>
				　　부과금액이 해당자료의 시가를 초과할 수 없다.<br>
				　　예) 10권 2일 연체 시 → 10권×2일×100원=2000원 연체료 부과<br>
				　- 연체료를 납부하지 않을 경우에는 사유가 발생한 날부터 1책당 연체일 수만큼 대출을 일시 정지하되, 대출정지기간은 1년 이내로 한다.<br>
				　　예) 10권 2일 연체 시 → 10권×2일=20일 정지<br>
				　　분실도서 변상 : 분실 및 훼손도서는 동일 도서로 변상함을 원칙으로 하며,동일도서를 구할 수 없을 경우 도서의현 시가로 변상</p>
				</div>
				<br>
				<h3>반납</h3><br>
				<div class="info">
				<p>▶반납예정일까지 대출한 자료실에 반납</p>
				<p>▶휴관일 및 자료실 이용시간 이후에는 현관입구에 있는 무인반납시스템 이용</p>
				<p>▶무인반납시스템 운영시간 : 평일 20:00 이후, 주말 17:00 이후(반납된 도서는 소급하여 처리)</p>
				<br><br><br><br><br><br><br>
				</div>
				<!-- content -->
			
		</div>
	</div>

	<!-- js -->
	<tiles:insertAttribute name="js"></tiles:insertAttribute>
	<!-- footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
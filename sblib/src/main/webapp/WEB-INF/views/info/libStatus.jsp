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
       	 <li><a href="/info/greeting">인사말</a></li>
         <li><a href="/info/libStatus">도서관현황</a></li>
         <li><a href="/info/userGuide">이용안내</a></li>
         <li><a href="/info/comingWay">오시는길</a></li>
      </ul>
      <div class="lastchild"></div>
   </div>
   
   <div id='layer'>
      <h3>도서관현황</h3>
      <div style="width:100%; height:20px;">
      <ul>
         <li>도서관안내　>　</li>
         <li>도서관현황</li>
      </ul>
    
   </div>
   <hr style="margin-top:30px;">
		<div id="info">
			<img src="../resources/images/dataStatus.PNG">
			<img src="../resources/images/dataStatus1.PNG">
		</div>
		<br><br><br><br><br><br><br>
		</div>
</div>

<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>
<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
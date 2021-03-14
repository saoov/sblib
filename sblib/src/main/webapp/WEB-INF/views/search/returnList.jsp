<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>삼부도서관</title>
</head>
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>
<link rel="stylesheet" href="resources/css/slick.css">
<body>    

<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<body>
<!-- sidebar -->
	<div id='body'>
		<div id='sidemenu'>
			<div class="title">
				<h2>MyLibrary</h2>
			</div>
			<ul>
	 			<li><a href="/search/rentList">내서재</a></li>
	 			<li><a href="/search/returnList">대출내역</a>
                <li><a href="/search/cartList">장바구니</a></li>
                <li><a href="/question/myList">내질문답변</a></li>
                <li><a href="/bookstory/myList">내책이야기</a></li>
			</ul>
			<div class="lastchild"></div>
		</div>
		<!-- sidebar -->
		<!-- content -->
		<div id='layer'>
			<h3>대출내역</h3>
			<div style="width: 100%; height: 20px;">
				<ul>
				    <li>MyLibrary　>　</li>
					<li>대출내역</li>
				</ul>
			</div>
			<hr style="margin-top: 30px;">

<table border="1">
				<colgroup>
					<col width="50%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<tr>
		<td>제목</td>
		<td>대출일</td>
		<td>반납일</td>
		<td>상태</td>
	</tr>
	<c:forEach items="${rentList }" var="rentList">
	<tr>
		<td>${rentList.title }</td>
		<td><fmt:formatDate value="${rentList.rentDate }" pattern="yyy/MM/dd"/></td>
		<td><fmt:formatDate value="${rentList.returnDate }" pattern="yyy/MM/dd"/></td>
		<td>${rentList.status }</td>
	</tr>
	</c:forEach>
</table>
</div>
	</div>
<!-- js -->
	<tiles:insertAttribute name="js"></tiles:insertAttribute>
	<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
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
<title>Insert title here</title>
</head>
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>
<link rel="stylesheet" href="resources/css/slick.css">
<body>    

<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<h1>대출이력</h1>
<body>
<table border="1">
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
<!-- js -->
	<tiles:insertAttribute name="js"></tiles:insertAttribute>
	<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
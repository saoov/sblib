<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<ul>
		<c:forEach items="${rentList}" var="rentList">
			<li>
				<div>
					<p>대여정보 : ${rentList.rentId }</p>
					<p>회원번호 : ${rentList.member_no }</p>
					<p>대여도서 : ${rentList.bno } 번 - 제목 : ${rentList.title}
					<p>대출일 : ${rentList.rentDate }</p>
					<p>반납일 : <c:out value="${rentList.returnDate }"/></p>
					<p>상태 : ${rentList.status }</p>
				</div>
			</li>
		</c:forEach>
	</ul>
	<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
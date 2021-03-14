<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삼부도서관</title>
</head>
<body>
	<img style="width:200px" src='<c:out value="${book.image } "/>'>
	<hr>
	<c:out value="${book.title } "/>
	<hr>
	출판사 : <c:out value="${book.publisher } "/>
	<hr>
	지은이 : <c:out value="${book.author } "/>
	<hr>
	ISBN : <c:out value="${book.isbn } "/>
	<hr>
	가격 : <c:out value="${book.price } "/>원
	<hr>
	출간일 : <c:out value="${book.pubdate } "/>
	<hr>
	<c:out value="${book.description } "/>
	<hr>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<td>제목</td>
				<td>이미지</td>
				<td>작가</td>
				<td>가격</td>
				<td>출판사</td>
				<td>ISBN</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="#{books }" var="book">
			<tr>
				<td>${book.title }</td>
				<td><img src='${book.image }'></td>
				<td>${book.author }</td>
				<td>${book.price }</td>
				<td>${book.publisher }</td>
				<td>${book.isbn }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>
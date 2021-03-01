<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jqeury-latest.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>내용</td>
				<td>작성자</td>
				<td>등록일</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="#{list }" var="bookstory">
				<tr>
					<td>${bookstory.story_no }</td>
					<td><a href='/bookstory/get?story_no=<c:out value="${bookstory.story_no }"/>'><c:out value="${bookstory.story_title }"></c:out></a></td>
					<td>${bookstory.story_content }</td>
					<td>${bookstory.story_author }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${bookstory.story_regDate }"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script>
		$(document).ready(function(){
			var result = '<c:out value="${result}"/>';
		})
	</script>
</body>
</html>
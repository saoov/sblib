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
	<form role="form" action="/bookstory/modify" method="post">
		<div>
			<label>글번호</label> 
			<input type="text" name="story_no" value='<c:out value="${vo.story_no }"/>' readonly />
		</div>
		<div>
			<label>제목</label> 
			<input type="text" name="story_title" value='<c:out value="${vo.story_title }"/>'/>
		</div>
		<div>
			<label>내용</label> 
			<input type="text" name="story_content" value='<c:out value="${vo.story_content }"/>'/>
		</div>
		<button type="submit" data-oper='modify'>변경</button>
		<button type="submit" data-oper='remove'>삭제</button>
		<button type="submit" data-oper='list'>목록</button>
	</form>
</body>
</html>
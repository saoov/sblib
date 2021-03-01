<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="register" method="post">
		<label>제목</label>
		<input type="text" name="story_title">
		<label>내용</label>
		<input type="text" name="story_content">
		<label>작성자</label>
		<input type="text" name="story_author">
		<button type="submit">전송</button>
	</form>
</body>
</html>
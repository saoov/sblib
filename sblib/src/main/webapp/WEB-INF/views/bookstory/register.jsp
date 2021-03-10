<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/bookstory/register" method="post">
	
	    <div class="form-group">
		<label>제목</label>
		<input class="form-control" name="story_title">
		</div>
		<div class="form-group">
		<label>내용</label>
		<textarea rows="5" cols="50" name="story_content" class="form-control"></textarea>
		</div>
		<div class="form-group">
		<label>작성자</label>
		<input class="form-control" name="story_author">
		</div>
        <button type="submit" class="btn btn-default">전송</button>
        <button type="reset" class="btn btn-default">수정</button>
	</form>
</body>
</html>
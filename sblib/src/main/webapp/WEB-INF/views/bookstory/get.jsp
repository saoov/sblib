<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<label>글번호</label>
		<input type="text" value='<c:out value="${vo.story_no }"/>' readonly/>
	</div>
	<div>
		<label>제목</label>
		<input type="text" value='<c:out value="${vo.story_title }"/>' readonly/>
	</div>
	<div>
		<label>내용</label>
		<input type="text" value='<c:out value="${vo.story_content }"/>' readonly/>
	</div>
	<div>
		<label>작성일</label>
		<input type="text" value='<fmt:formatDate value="${vo.story_regDate }"/>' readonly/>
	</div>
		<button type="submit" data-oper='modify'>수정</button>
		<button type="submit" data-oper='remove'>삭제</button>
		<button type="submit" data-oper='list'>목록</button>
</body>
</html>
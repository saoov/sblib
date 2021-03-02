<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
		<button type="submit" data-oper='list'>목록</button>
		<form id='operForm' action="/bookstory/modify" method="get">
			<input type='hidden' id='story_no' name="story_no" value='<c:out value="${vo.story_no }"/>'>
			<input type='hidden' name='pageNum' value='<c:out value="${page.pageNum }"/>'>
			<input type='hidden' name='amount' value='<c:out value="${page.amount }"/>'>
			<input type="hidden" name="type" value="<c:out value='${page.type }'/>">
			<input type="hidden" name="keyword" value="<c:out value='${page.keyword }'/>">		
		</form>
</body>
<script>
	$(document).ready(function(){
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action","/bookstory/modify").submit();
		});
		
		$("button[data-oper='list']").on("click",function(e){
			operForm.find("#story_no").remove();
			operForm.attr("action","/bookstory/list");
			operForm.submit();
		});
	});
</script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form role="form" action="/bookstory/modify" method="post">
			<input type='hidden' name='pageNum' value='<c:out value="${page.pageNum }"/>'>
			<input type='hidden' name='amount' value='<c:out value="${page.amount }"/>'>
			<input type="hidden" name="type" value="<c:out value='${page.type }'/>">
		<input type="hidden" name="keyword" value="<c:out value='${page.keyword }'/>">		
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
	<script>
		$(document).ready(function(){
			var formObj = $("form");
			
			$('button').on("click",function(e){
				e.preventDefault();
			
			var operation = $(this).data("oper");
			
			if(operation === 'remove'){
				formObj.attr("action", "/bookstory/remove");
			} else if(operation === 'list'){
				formObj.attr("action", "/bookstory/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(typeTag);
				formObj.append(keywordTag);
			}
			
			formObj.submit();
			});
		})
	</script>
</body>
</html>
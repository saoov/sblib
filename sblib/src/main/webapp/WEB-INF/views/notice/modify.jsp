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
	<form role="form" action="/notice/modify" method="post">
			<input type='hidden' name='pageNum' value='<c:out value="${page.pageNum }"/>'>
			<input type='hidden' name='amount' value='<c:out value="${page.amount }"/>'>
			<input type="hidden" name="type" value="<c:out value='${page.type }'/>">
		<input type="hidden" name="keyword" value="<c:out value='${page.keyword }'/>">		
		<div>
			<label>글번호</label> 
			<input class="form-control" name="notice_no" readonly="readonly" value='<c:out value="${noticeVO.notice_no }"/>'>
		</div>
		<div>
			<label>제목</label> 
			<input class="form-control" name="notice_title" value='<c:out value="${noticeVO.notice_title }"/>'/>
		</div>
		<div>
			<label>내용</label> 
			<textarea rows="5" cols="50" name="notice_content" class="form-control"><c:out value="${noticeVO.notice_content}"/></textarea>
		</div>
		<button class="btn btn-default" data-oper='modify'>변경</button>
		<button class="btn btn-danger" data-oper='remove'>삭제</button>
		<button class="btn btn-info" data-oper='list'>목록</button>
	</form>
	<script>
		$(document).ready(function(){
			var formObj = $("form");
			
			$('button').on("click",function(e){
				e.preventDefault();
			
			var operation = $(this).data("oper");
			
			if(operation === 'remove'){
				formObj.attr("action", "/notice/remove");
			} else if(operation === 'list'){
				formObj.attr("action", "/notice/list").attr("method","get");
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
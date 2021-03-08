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

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">책이야기 글</h1>
  </div>
 <!-- /.col-lg-12 -->
</div>
   <!-- /.row -->
     <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                              작성글 내용입니다.
                 </div>

 <!-- /.panel-heading -->
 <div class="panel-body">

	<div class="form-group">
		<label>글번호</label>
		<input class="form-control" name="story_no" readonly="readonly" value='<c:out value="${bookstory.story_no }"/>'>
		<!-- input쓸때 name속성(=파라미터로 수집되는 이름) 명심해야함  -->
	</div>
	<div class="form-group">
		<label>제목</label>
		<input class="form-control" name="story_title" readonly="readonly" value='<c:out value="${bookstory.story_title }"/>'>
	</div>
	<div class="form-group">
		<label>내용</label>
		<textarea rows="5" cols="50" name="story_content" class="form-control"><c:out value="${bookstory.story_content}"/></textarea>
	</div>
	
	<div class="form-group">
        <label>작성자</label>
        <input class="form-control" name="story_author" value='<c:out value="${bookstory.story_author}"/>'>
    </div>
	
	<div class="form-group">
		<label>작성일</label>
		<input type="text" value='<fmt:formatDate value="${vo.story_regdate }"/>' readonly/>
	</div>
		<button type="reset" class="btn btn-default" data-oper='modify'>수정</button>
		<button type="submit" class="btn btn-default" data-oper='list'>목록</button>
		
 </div>
 <!-- /.panel-body -->
 </div>
 </div>
 </div>
         
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

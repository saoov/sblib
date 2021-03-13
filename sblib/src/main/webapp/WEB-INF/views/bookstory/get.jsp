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

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

</head>
<body>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">책이야기 작성글 내용</h1>
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
 
 <div class="table table-responsive">
 
    <table class="table">
    
    <tr>	
		<th class="success" style="background-color: #ffedd7">글번호</th>
		<td><c:out value="${bookstory.story_no }"/></td>
		<th class="success" style="background-color: #ffedd7">조회수</th>
		<td><c:out value="${bookstory.story_readcount }"/></td>	
	</tr>
	
	<tr>	
        <th class="success" style="background-color: #ffedd7">작성자</th>
        <td><c:out value="${bookstory.story_author}"/></td>
        <th class="success" style="background-color: #ffedd7">작성일</th>
        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${bookstory.story_regdate }" /></td>
    </tr>
	
	<tr>
		<th class="success" style="background-color: #ffedd7">제목</th>
		<td colspan="3"><c:out value="${bookstory.story_title }"/></td>
	</tr>
	
	<tr>
		<th class="success" style="background-color: #ffedd7">내용</th>
		<td colspan="3"><textarea rows="5" cols="50" style="border: none"><c:out value="${bookstory.story_content}"/></textarea></td>
	</tr>
	

    
    <form id='actionForm' action="/bookstory/list" method='get'>
       <input type='hidden' name='pageNum' value = '${page.pageNum}'>
       <input type='hidden' name='amount' value = '${page.amount}'>
       <input type='hidden' name='story_no' value = '${bookstory.story_no}'>
       <input type='hidden' name='type' value = '${page.type}'>
       <input type='hidden' name='keyword' value = '${page.keyword}'>
   </form>
   
   <tr>
   <td colspan="4">
	<button type="button" class="btn btn-default listBtn"><a href='/bookstory/list'>목록</a></button>
    <button type="button" class="btn btn-default modBtn"><a href='/bookstory/modify?story_no=<c:out value="${bookstory.story_no}"/>'>수정</a></button>
   </td>
   </tr>
    </table>
    <!-- 댓글 JS -->
    <script src="/resources/js/reply.js"></script>
    
    <script>  
    
    var operForm = $("#operForm");
    	
    $("button[data-oper='modify']").on("click", function(e){
    	
    	operForm.attr("action", "/bookstory/modify").submit();
    });
    	
                             
     var actionForm = $("#actionForm");
                             
     $(".listBtn").click(function(e){
        e.preventDefault();
        actionForm.find("input[name='story_no']").remove();
        actionForm.submit();
     });
                             
     $(".modBtn").click(function(e){
        e.preventDefault();
        actionForm.attr("action","/bookstory/modify");
        actionForm.submit();
     });
                            
                             
    </script>
    
    </div>
    <!-- /.panel-body -->
    </div>
   </div>
  </div>
  
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
        <h1 class="page-header">책이야기 게시판 목록</h1>                                                           
      </div>
    <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-heading">
                    이곳은 책에 관한 이야기를 자유롭게 나누는 게시판입니다.
           <button id="regBtn" type="button" class="btn btn-xs pull-right">글쓰기</button>
          </div>

	<form id='actionForm' action="/bookstory/list" method="get">
		<input type="hidden" name="pageNum" value="${page.page.pageNum }">
		<input type="hidden" name="amount" value="${page.page.amount }">
		<input type="hidden" name="type" value="<c:out value='${page.page.type }'/>">
		<input type="hidden" name="keyword" value="<c:out value='${page.page.keyword }'/>">		
	</form>
	
	<!-- table -->
	<div class="panel-body">
		<table width="100%" class="table table-striped table-bordered table-hover">
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
					<tr class="odd gradeX">
						<td>${bookstory.story_no }</td>
						<td><a href='/bookstory/get?story_no=<c:out value="${bookstory.story_no }"/>'><c:out value='${bookstory.story_title }'/></a></td>
						<td>${bookstory.story_content }</td>
						<td>${bookstory.story_author }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${bookstory.story_regdate }"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		</div>
		</div>
		</div>
	<!-- table -->
	
	<!-- search -->
	<div class="search">
		<form id='searchForm' action='/bookstory/list' method='get'>
			<select name='type'>
				<option value='T'>제목</option>
				<option value='C'>내용</option>
				<option value='A'>작성자</option>
				<option value='TC'>제목 + 내용</option>
				<option value='TA'>제목 + 작성자</option>
				<option value='TCA'>제목 + 내용 + 작성자</option>
			</select>
			<input type="text" name='keyword'>
			<input type="hidden" name="pageNum" value="${page.page.pageNum }">
			<input type="hidden" name="amount" value="${page.page.amount }">
			<button>Search</button>
		</form>
	</div>
	<!-- search -->
	
	<!-- pagination -->
	<div class="pagination">
		<ul>
			<c:if test="${page.prev }">
				<li><a href='${page.startPage - 1 }'>Prev</a></li>
			</c:if>
			
			<c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
				<li><a href='${num }'>${num }</a></li>
			</c:forEach>
			
			<c:if test="${page.next }">
				<li><a href='${page.endPage + 1 }'>Next</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination -->
	<script>
		$(document).ready(function(){
			
			var result = '<c:out value="${result}"/>';
			var actionForm = $("#actionForm");
			var searchForm = $("#searchForm");
			
			checkModal(result);			
			history.replaceState({}, null, null);
			
			
			$("li a").on("click",function(e){
				e.preventDefault();
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			$(".move").on("click",function(e){
				e.preventDefault();
				actionForm.append("<input type='hidden' name='story_no' value='"+
						$(this).attr("href")+"'>");
				actionForm.attr("action", "/bookstory/get");
				actionForm.submit();
			})
			
			$("#searchForm button").on("click",function(e){
				if(!searchForm.find("input[name='keyword']").val()){
					alert('키워드를 입력하세요');
					return false;
				}
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				searchForm.submit();
			})
			
			    function checkModal(result) {
				 
				      if (result === ''|| history.state) {
				        return;
				      }
				
				      if (result === 'success') {
					        $(".modal-body").html(
					            "정상적으로 처리되었습니다.");
					
					      }else if (parseInt(result) > 0) {
				        $(".modal-body").html(
				            "게시글 " + parseInt(result) + " 번이 등록되었습니다.");
				      }
				
				       $("#myModal").modal("show");
				    }    
				
				$("#regBtn").click(function(){
					
					self.location = "/bookstory/register";
					
				});
		});
	</script>
</body>
</html>
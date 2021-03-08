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

<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- DataTables JavaScript -->
<script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

</head>
<body>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">묻고 답하기 게시글 목록</h1>                                                           
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                                 묻고 답하기 게시글 목록입니다.
                            <button id="regBtn" type="button" class="btn btn-xs pull-right">글 작성</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>글번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>등록일</th>
                                        <th>처리상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="question">
                                    <tr class="odd gradeX">
                                        <td>${question.que_no }</td>
                                        <td><a class="move" href='<c:out value="${question.que_no}"/>'><c:out value="${question.que_title}"/></a></td>
                                        <td>${question.que_author }</td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${question.que_regdate}" /></td>
                                        <td>${question.que_status }</td>
                                        
                                    </tr>
                                </c:forEach>    
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            
                            <h3>${pageMaker }</h3>
                            <div class="pull-right">
                              <ul class="pagination">
                                <c:if test="${pageMaker.prev}">
                                  <li class="page-item">
                                    <a class="page-link" href="${pageMaker.startPage - 1}" tabindex="-1">이전</a>
                                  </li>
                                </c:if>  
                                <c:forEach begin="${pageMaker.startPage}" 
                                           end="${pageMaker.endPage}" var="num">
                                   <li class="page-item ${pageMaker.page.pageNum == num?"active":""}">
                                   <a class="page-link" href="${num }">${num }</a></li>       
                                </c:forEach>
                                <c:if test="${pageMaker.next}">
                                  <li class="page-item">
                                    <a class="page-link" href="${pageMaker.endPage + 1}" tabindex="-1">다음</a>
                                  </li>
                                  </c:if>
                              </ul>
                            </div>
                            
                            <form id='actionForm' action="/question/list" method='get'>
                                <input type='hidden' name='pageNum' value = '${pageMaker.page.pageNum}'>
                                <input type='hidden' name='amount' value = '${pageMaker.page.amount}'>
                            </form>
 
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
<div id="myModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>       
<!-- modal -->
            
<script>

$(document).ready(function() {
	
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({}, null, null);
	        
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
		
		self.location = "/question/register";
		
	});
	
	var actionForm = $("#actionForm");
	
	$(".page-link").on("click", function(e) {
		
		e.preventDefault();
		
		var targetPage = $(this).attr("href");
		
		console.log(targetPage);
		
		actionForm.find("input[name='pageNum']").val(targetPage);
		actionForm.submit();
		
	});
	
	$(".move").on("click", function(e) {
		e.preventDefault();
		
		var targetQue_no = $(this).attr("href");
		
		console.log(targetQue_no);
		
		actionForm.append("<input type='hidden' name='que_no' value='"+targetQue_no+"'>'"); 
		actionForm.attr("action", "/question/get").submit();
		
	});
});			
			
   </script>			
</body>
</html>
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
                    <h1 class="page-header">질문,답변 작성글 내용</h1>
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
                                 <input class="form-control" name="que_no" readonly="readonly" value='<c:out value="${question.que_no}"/>'> 
                                 <!-- input쓸때 name속성(=파라미터로 수집되는 이름) 명심해야함  -->
                             </div>  
                            
                             <div class="form-group">
                                 <label>제목</label>
                                 <input class="form-control" name="que_title" readonly="readonly" value='<c:out value="${question.que_title}"/>'> 
                                 <!-- input쓸때 name속성(=파라미터로 수집되는 이름) 명심해야함  -->
                             </div>
                             
                             <div class="form-group">
                                 <label>내용</label>
                                 <textarea rows="5" cols="50" name="que_content" class="form-control"><c:out value="${question.que_content}"/></textarea> 
                             </div>
                             
                             <div class="form-group">
                                 <label>작성자</label>
                                 <input class="form-control" name="que_author" value='<c:out value="${question.que_author}"/>'>
                             </div>
                             
                             <div class="form-group">
                                 <label>처리상태</label>
                                 <input class="form-control" name="que_status" value='<c:out value="${question.que_status}"/>'>
                             </div>
                             <hr>
                             
                             <!-- 답변 -->
                             <div class="form-group">
                                 <label>제목</label>
                                 <input class="form-control" name="ans_title" readonly="readonly" value='<c:out value="${answer.ans_title}"/>'> 
                             </div>
                             
                             <div class="form-group">
                                 <label>내용</label>
                                 <textarea rows="5" cols="50" name="ans_content" class="form-control"><c:out value="${answer.ans_content}"/></textarea> 
                             </div>
                             
                             <div class="form-group">
                                 <label>등록일</label>
                                 <fmt:formatDate pattern="yyyy-MM-dd" value="${question.que_regdate}" /> 
                             </div>
                             
                             <!-- 답변 -->
                             
                             <form id='actionForm' action="/question/list" method='get'>
                                <input type='hidden' name='pageNum' value = '${page.pageNum}'>
                                <input type='hidden' name='amount' value = '${page.amount}'>
                                <input type='hidden' name='que_no' value = '${question.que_no}'>
                                <input type='hidden' name='type' value = '${page.type}'>
                                <input type='hidden' name='keyword' value = '${page.keyword}'>
                             </form>
                             
                             <button type="button" class="btn btn-default listBtn"><a href='/question/list'>목록</a></button>
                             <button type="button" class="btn btn-default modBtn"><a href='/question/modify?que_no=<c:out value="${question.que_no}"/>'>수정</a></button>
							<c:choose>
								<c:when test="${userSession.member_grade eq 'manager'}">
									<button type="button" class="btn btn-info ansBtn">답변</button>
								</c:when>
							</c:choose>
					<script>
						var actionForm = $("#actionForm");

						$(".listBtn").click(function(e) {
							e.preventDefault();
							actionForm.find("input[name='que_no']").remove();
							actionForm.submit();
						});

						$(".modBtn").click(function(e) {
							e.preventDefault();
							actionForm.attr("action", "/question/modify");
							actionForm.submit();
						});

						$(".ansBtn").click(function(e) {
							e.preventDefault();
							actionForm.attr("action", "/answer/register");
							actionForm.submit();
						});
					</script>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
</body>
</html>

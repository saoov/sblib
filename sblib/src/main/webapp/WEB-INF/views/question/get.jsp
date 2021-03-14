<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
    
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
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>
<body>
<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>

  <div id='body'>
   <div id='sidemenu'>
      <div class="title">
         <h2>열린공간</h2>
      </div>
      <ul>
         <li><a href="/notice/list">공지사항</a></li>
         <li><a href="/question/list">묻고답하기</a></li>
         <li><a href="/bookstory/list">책이야기</a></li>
      </ul>
      <div class="lastchild"></div>
   </div>
   
   <div id='layer'>
      <h3>묻고답하기</h3>
      <div style="width:100%; height:20px;">
      <ul>
         <li>열린공간　>　</li>
         <li>묻고답하기</li>
      </ul>
      </div>
        <hr style="margin-top:30px;">
                        
                         <div class="table table-responsive">
 
                          <table class="table">
                          
                          <tr>	
		                    <th class="success" style="background-color: #ffedd7">글번호</th>
	                    	<td colspan="3"><c:out value="${question.que_no }"/></td>
	
                          </tr>
                            
                            <tr>	
                              <th class="success" style="background-color: #ffedd7">작성자</th>
                              <td><c:out value="${question.que_author}"/></td>
                              <th class="success" style="background-color: #ffedd7">작성일</th>
                              <td><fmt:formatDate pattern="yyyy-MM-dd" value="${question.que_regdate }" /></td>
                           </tr>
                             
                            <tr>
	                        	<th class="success" style="background-color: #ffedd7">제목</th>
	                        	<td colspan="3"><c:out value="${question.que_title }"/></td>
	                        </tr>
	
	                        <tr>
	                            <th class="success" style="background-color: #ffedd7">내용</th>
		                        <td colspan="3"><textarea rows="5" cols="50" style="border: none"><c:out value="${question.que_content}"/></textarea></td>
	                         </tr>
                             
                             
                             <form id='actionForm' action="/question/list" method='get'>
                                <input type='hidden' name='pageNum' value = '${page.pageNum}'>
                                <input type='hidden' name='amount' value = '${page.amount}'>
                                <input type='hidden' name='que_no' value = '${question.que_no}'>
                                <input type='hidden' name='type' value = '${page.type}'>
                                <input type='hidden' name='keyword' value = '${page.keyword}'>
                             </form>
                             
                             <tr>
                             <td colspan="4">
                             <button type="button" class="btn btn-default listBtn"><a href='/question/list'>목록</a></button>
                             <button type="button" class="btn btn-default modBtn"><a href='/question/modify?que_no=<c:out value="${question.que_no}"/>'>수정</a></button>
							<c:choose>
								<c:when test="${userSession.member_grade eq 'manager'}">
									<button type="button" class="btn btn-info ansBtn">답변</button>
								</c:when>
							</c:choose>
							</td>
                            </tr>
                           </table>
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
<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>
<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>

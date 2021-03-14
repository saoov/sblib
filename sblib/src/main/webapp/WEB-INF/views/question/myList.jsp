<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

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
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>
<body>
<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>

<div id='body'>
   <div id='sidemenu'>
      <div class="title">
         <h2>MyLibrary</h2>
      </div>
      <ul>
         <li><a href="/search/rentList">내서재</a></li>
         <li><a href="/search/cartList">장바구니</a></li>
         <li><a href="/question/myList">내질문답변</a></li>
         <li><a href="/bookstory/myList">내책이야기</a></li>
      </ul>
      <div class="lastchild"></div>
   </div>
   
   <div id='layer'>
      <h3>내가 쓴 질문답변</h3>
      <div style="width:100%; height:20px;">
      <ul>
         <li>MyLibrary　>　</li>
         <li>내질문답변</li>
      </ul>
      </div>
        <hr style="margin-top:30px;">




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
                                <c:forEach items="${myList}" var="question">
                                    <tr class="odd gradeX">
                                        <td>${question.que_no }</td>
                                        <td><a href='/question/get?que_no=<c:out value="${question.que_no}"/>'><c:out value="${question.que_title}"/></a></td>
                                        <td>${question.que_author }</td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${question.que_regdate}" /></td>
                                        <td>${question.que_status }</td>
                                        
                                    </tr>
                                </c:forEach>    
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
 
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
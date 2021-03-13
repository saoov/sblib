<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  

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
                    <h1 class="page-header">나의 책이야기 게시글</h1>                                                           
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                                 나의 책이야기 게시글 목록입니다.
                            
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
                                        <th>수정일</th>
                                        <th>조회수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${myList}" var="bookstory">
                                    <tr class="odd gradeX">
                                        <td>${bookstory.story_no }</td>
                                        <td><a href='/bookstory/get?story_no=<c:out value="${bookstory.story_no}"/>'><c:out value="${bookstory.story_title}"/></a></td>
                                        <td>${bookstory.story_author }</td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${bookstory.story_regdate}" /></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${bookstory.story_updatedate}" /></td>
                                        <td>${bookstory.story_readcount }</td>                                        
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
            </div>
            <!-- /.row -->
	
</body>
</html>
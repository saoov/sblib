<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<html>
<head>
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



                        <div class="panel-body">
                            <form action="/question/register" method="post">
                            
                             <div class="form-group">
                                 <label>제목</label>
                                 <input class="form-control" name="que_title"> 
                                 <!-- input쓸때 name속성(=파라미터로 수집되는 이름) 명심해야함  -->
                             </div>
                             
                             <div class="form-group">
                                 <label>내용</label>
                                 <textarea rows="5" cols="50" name="que_content" class="form-control"></textarea> 
                             </div>
                             
                             <div class="form-group">
                                 <label>작성자</label>
                                 <input class="form-control" name="que_author">
                             </div>
                             
                             <div class="form-group">
                                 <label>처리상태</label>
                                 <input class="form-control" name="que_status">
                             </div>
                             
                             <button type="submit" class="btn btn-default">전송</button>
                             <button type="reset" class="btn btn-default">취소</button>
                            
                            </form>                          
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
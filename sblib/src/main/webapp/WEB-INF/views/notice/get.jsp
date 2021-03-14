<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
         <h2>프로그램</h2>
      </div>
      <ul>
         <li><a href="/notice/list">공지사항</a></li>
         <li><a href="/question/list">묻고답하기</a></li>
         <li><a href="/bookstory/list">책이야기</a></li>
      </ul>
      <div class="lastchild"></div>
   </div>
   
   <div id='layer'>
      <h3>공지사항</h3>
      <div style="width:100%; height:20px;">
      <ul>
         <li>열린공간　>　</li>
         <li>공지사항</li>
      </ul>
      </div>
			
   		<hr style="margin-top:30px;">

 
    <table class="table">
    
    <tr>	
		<th class="success" style="background-color: #ffedd7">글번호</th>
		<td><c:out value="${noticeVO.notice_no }"/></td>
		<th class="success" style="background-color: #ffedd7">조회수</th>
		<td><c:out value="${noticeVO.notice_readcount }"/></td>	
	</tr>
	
	<tr>	
        <th class="success" style="background-color: #ffedd7">첨부파일</th>
        <td><input type="hidden" value="${noticeVO.notice_fileid }" id="IDX">
            <button type="button" class="btn btn-default fileBtn">
            	<a href='/notice/filedown?notice_no=<c:out value="${noticeVO.notice_no}"/>'>${noticeVO.notice_filename}</a>
            </button>
             
        </td>
        <th class="success" style="background-color: #ffedd7">작성일</th>
        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${noticeVO.notice_regdate }" /></td>
    </tr>
	
	<tr>
		<th class="success" style="background-color: #ffedd7">제목</th>
		<td colspan="3"><c:out value="${noticeVO.notice_title }"/></td>
	</tr>
	
	<tr>
		<th class="success" style="background-color: #ffedd7">내용</th>
		<td colspan="3"><textarea rows="25" cols="50" style="border: none" readonly="readonly"><c:out value="${noticeVO.notice_content}"/></textarea></td>
	</tr>
	

    
   <form id='actionForm' action="/notice/list" method='get'>
		<input type='hidden' name='pageNum' value='${page.pageNum}'>
		<input type='hidden' name='amount' value='${page.amount}'>
		<input type='hidden' name='notice_no' value='${noticeVO.notice_no}'>
		<input type='hidden' name='type' value='${page.type}'> 
		<input type='hidden' name='keyword' value='${page.keyword}'>
		<input type='hidden' name='notice_filename' value='${noticeVO.notice_filename}'>
		<input type='hidden' name='notice_fileid' value='${noticeVO.notice_fileid}'>
	</form>
   
   <tr>
   <td colspan="4">
	<button type="button" class="btn btn-default listBtn"><a href='/notice/list'>목록</a></button>
    <button type="button" class="btn btn-default modBtn"><a href='/notice/modify?notice_no=<c:out value="${noticeVO.notice_no}"/>'>수정</a></button>
   </td>
   </tr>
    </table>
 </div>
</div>
<script>
                             
     var actionForm = $("#actionForm");
                             
     $(".listBtn").click(function(e){
        e.preventDefault();
        actionForm.find("input[name='notice_no']").remove();
        actionForm.submit();
     });
                             
     $(".modBtn").click(function(e){
        e.preventDefault();
        actionForm.attr("action","/notice/modify");
        actionForm.submit();
     });
     
                            
                             
    </script>
    
	<!-- js -->
	<tiles:insertAttribute name="js"></tiles:insertAttribute>
	<!-- footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>

  
</body>
</html>

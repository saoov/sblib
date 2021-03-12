<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
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
				<li><a href="#">도서관일정</a></li>
				<li><a href="#">독서문화행사</a></li>
			</ul>
			<div class="lastchild"></div>
		</div>
		
		<div id='layer'>
			<h3>독서문화행사</h3>
			<div style="width:100%; height:20px;">
				<ul>
					<li>프로그램　>　</li>
					<li>독서문화행사</li>
				</ul>
			</div>
			<hr style="margin-top:30px;">
			<table class="table table-bordered">
					<tr>
						<th scope="col" width="15%">행사명</th>
						<td width="85%">
							${event.event_title }
						</td>
					</tr>
					<tr>
						<th scope="col">기간</th>
						<td>
							${event.event_start }　~　${event.event_end }
						</td>
					</tr>
					<tr>
						<th scope="col">내용</th>
						<td>
							${event.event_info }
						</td>
					</tr>
				</table>
				<form id='actionForm' action="/event/eventBoard" method="get">
					<input type="hidden" name="pageNum" value="${page.pageNum }">
					<input type="hidden" name="amount" value="${page.amount }">
					<input type="hidden" name="event_no" value="${event.event_no}"> 
					<input type="hidden" name="type" value="${page.type}"> 
					<input type="hidden" name="keyword" value="${page.keyword}">
				</form>

				<button type="button" id="listBtn" class="btn btn-secondary" onclick=>목록으로</button>
				<button type="button" id="modifyBtn" class="btn btn-warning">수정</button>
				<button type="button" id="deleteBtn" class="btn btn-danger">삭제</button>
		</div>
		
</div>
<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>
<script>
	var actionForm = $("#actionForm");
	
	$("#listBtn").click(function(e) {
		e.preventDefault();
		actionForm.find("input[name='event_no']").remove();
		actionForm.submit();
	});

	$("#modifyBtn").click(function(e) {
		e.preventDefault();
		actionForm.attr("action", "/event/eventModify");
		actionForm.submit();
	});
	$("#deleteBtn").click(function(e) {
		e.preventDefault();
		actionForm.attr("action", "/event/eventDelete");
		actionForm.attr("method", "post");
		actionForm.submit();
	});
</script>

<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
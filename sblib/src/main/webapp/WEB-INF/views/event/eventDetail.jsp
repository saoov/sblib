<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<style>
	#body{
	position:relative;
	margin:0 auto;
	width: 1200px;
	margin-top: 50px;
	margin-bottom: 10px;
	height:1500px;
	}
	#sidemenu {
		width: 18%;
		background-color: white;
		float:left;
		margin-right: 4%;
	}
	
	#sidemenu ul{
		margin : 0;
		padding : 0;
		background-color: gray;
		border-radius: 10px;
		
	}
	#sidemenu ul li{
		list-style: none;
		width : 100%;
		height : 50px;
		line-height: 3.5;
        text-align: center;
        border-bottom: 0.7px solid white;
	}
	#sidemenu ul li a{
		display : block;
		color : white;
	}
	#sidemenu ul li a:hover{
		background-color: #424242;
		text-decoration: none;
	}
	#sidemenu .title{
		width: 100%;
	}
	.title h1{
		text-align: center;
		margin-top: 10px;
	}
	#jun{
		position: relative;
		width:78%;
		height:100%;
		float: left;
	}
	
  </style>
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
				<h1>프로그램</h1>
			</div>
			<hr>
			<ul>
				<li><a href="#">도서관일정</a></li>
				<li><a href="#">독서문화행사</a></li>
			</ul>
		</div>
		
		<div id='jun'>
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
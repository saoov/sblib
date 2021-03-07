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
	height: 1600px;
	}
	#sidemenu {
		width: 18%;
		background-color: white;
		float:left;
		margin-right: 4%;
	}
	
	#jun{
		position: relative;
		width:78%;
		height:1570px;
		float: left;
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
	
	.eventlist{
		width:100%;
	}
	
	.eventlist ul{
		margin : 0; padding : 0;
		text-align: center;
	}
	.eventlist ul li{
		list-style-type: none;
		margin: 2%;
		width:29.3333%;
		height: 450px;
		float:left;
		border: 0.5px solid #e0e0e0;
	}
	
	.eventsearch{
		position: relative;
		width:100%;
		height:60px;
		background-color: #cfd8dc;
		padding: 12px;
	}
	.eventsearchbox1{
		width: 370px;
		height: 100%;
		margin:0 auto;
	}
	.eventregister{
		position: absolute;
		width: 90px;
		height: 100px;
		right: 12px;
		top: 12px;
	}
	.pagingbar{
		position: absolute;
		width:100%;
		bottom:0px;
	}
	.pagingbar ul{
		margin-left:30%;
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
		
			<!-- 행사 검색 -->
			<div class='eventsearch'>
				<div class='eventsearchbox1'>
					<form id='searchForm' action="/board/list" method="get">
						<select name="type">
							<option value="" ${paging.page.type == null? "selected":"" }>---</option>
							<option value="T" ${paging.page.type eq 'T'? "selected":"" }>행사명</option>
							<option value="C" ${paging.page.type eq 'C'? "selected":"" }>내용</option>
							<option value="TC" ${paging.page.type eq 'TC'? "selected":"" }>제목+내용</option>
						</select> <input type="text" name="keyword" value="${paging.page.keyword }">
						<input type="hidden" name="pageNum"
							value="${paging.page.pageNum }"> <input type="hidden"
							name="amount" value="${paging.page.amount }">
						<button type="button" class="btn btn-info">Search</button>
					</form>
				</div>
				<div class="eventregister">
					<button id="regBtn" type="button" class="btn btn-secondary">행사등록</button>
				</div>
			</div>
			
			<!-- 행사 목록 출력 -->
			<div class="eventlist">
				<ul>
					<c:forEach items="${list}" var="event">
						<li>
							<a class="eventDetail" href='<c:out value="${event.event_no}"/>'>
								<img src='${event.event_image } '></img> 
								<c:out value="${event.event_title}" />
							</a><br> 
							<fmt:formatDate	pattern="yyyy-MM-dd" value="${event.event_start }" />~ 
							<fmt:formatDate pattern="yyyy-MM-dd" value="${event.event_end }" />
						 </li>
					</c:forEach>
				</ul>
			</div>
			
			<!-- 페이징 처리 -->
			<div class="pagingbar">
				<ul class="pagination">
					<c:if test="${paging.prev }">
						<li class="page-item"><a class="page-link"
							href="${paging.startPage - 1 }" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
						</a></li>
					</c:if>

					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="num">
						<li class="page-item ${paging.page.pageNum == num? "active":"" }">
							<a class="page-link" href="${num }">${num }</a> 
						</li>
					</c:forEach>

					<c:if test="${paging.next }">
						<li class="page-item"><a class="page-link"
							href="${paging.endPage + 1 }" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a></li>
					</c:if>
				</ul>
			</div>
		</div>
</div>
<form id='actionForm' action="/event/eventBoard" method="get">
	<input type="hidden" name="pageNum" value="${paging.page.pageNum }">
	<input type="hidden" name="amount" value="${paging.page.amount }">
	<input type="hidden" name="type" value="${paging.page.type }">
	<input type="hidden" name="keyword" value="${paging.page.keyword }">
</form>
<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>


<script>
	$(document).ready(function(){
		var actionForm = $("#actionForm");
		
		$('#regBtn').click(function(){
			self.location = "/event/eventRegister"
		});
		
		$(".page-link").on("click", function(e) {
	    	e.preventDefault();
	    	
	    	var targetPage = $(this).attr("href");
	    	console.log(targetPage);
	    	
	    	actionForm.find("input[name='pageNum']").val(targetPage);
	    	actionForm.submit();
		});
		
		$(".eventDetail").on("click",function(e){
	    	e.preventDefault();
	    	
	    	var event_no = $(this).attr("href");
	    	
	    	console.log(event_no);
	    	
	    	actionForm.append("<input type='hidden' name='event_no' value='"+event_no+"'>'");
	    	actionForm.attr("action","/event/eventDetail").submit();
	    });
	});
</script>

<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
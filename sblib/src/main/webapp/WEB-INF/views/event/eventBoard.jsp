<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<style>
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
		height: 440px;
		float:left;
		margin-bottom: 5%;
	}
	
	.eventsearch{
		position: relative;
		width:100%;
		height:60px;
		background-color: #cfd8dc;
		padding: 12px;
	}
	.eventsearchbox1{
		height: 50px;
	}
	#searchForm{
		width:80%;
		margin-right:5%;
		margin-left:15%;
	}
	.eventregister{
		position: absolute;
		width: 90px;
		height: 100px;
		right: 12px;
		top: 12px;
	}
	.pagingbar{
		position:absolute;
		bottom:0;
		width:100%;
		margin:0 auto;
	}
	.pagination{
		width:33.3333%;
		margin-left: 33.3333%;
		margin-right: 33.3333%;
	}
	
	/* 화면너비 0 ~ 1200px */
    @media(max-width: 1217px) {
    	
    }
    
    /* 화면너비 0 ~ 768px */
    @media(max-width: 768px) {
    	.eventlist ul li{
		width:46%;
		}
    }
    
    /* 화면너비 0 ~ 480px */
    @media(max-width: 480px) {
    	.eventlist ul li{
		width:80%;
		margin:10%;
		}
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
				<h2>프로그램</h2>
			</div>
			<ul>
				<li><a href="/event/calendar">도서관일정</a></li>
				<li><a href="/event/eventBoard">독서문화행사</a></li>
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
			<!-- 행사 검색 -->
			<div class='eventsearch'>
				<div class='eventsearchbox1'>
					<form id='searchForm' action="/event/eventBoard" method="get">
						<select class="form-control" name="type" style="width:15%; float:left;">
							<option value="" ${paging.page.type == null? "selected":"" }>---</option>
							<option value="T" ${paging.page.type eq 'T'? "selected":"" }>행사명</option>
							<option value="C" ${paging.page.type eq 'C'? "selected":"" }>내용</option>
							<option value="TC" ${paging.page.type eq 'TC'? "selected":"" }>제목+내용</option>
						</select> 
						<input type="text" class="form-control" name="keyword"  style="width:55%; float:left;" value="${paging.page.keyword }">
						<input type="hidden" name="pageNum" value="${paging.page.pageNum }"> 
						<input type="hidden" name="amount" value="${paging.page.amount }">
						<button type="button" class="btn btn-info">Search</button>
					</form>
				</div>
				<div class="eventregister">
				 <c:choose>
					<c:when test= "${userSession.member_name eq '관리자'}">
					<button id="regBtn" type="button" class="btn btn-secondary">행사등록</button>
					</c:when>
				</c:choose>
				</div>
			</div>
			
			<!-- 행사 목록 출력 -->
			<div class="eventlist">
				<ul>
					<c:forEach items="${list}" var="event">
						<li>
							<a class="eventDetail" href='<c:out value="${event.event_no}"/>'>
							<img src="${event.event_image }">
							<c:out value="${event.event_title}" />
							</a><br> 
							${event.event_start }~${event.event_end }
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
		
		var searchForm = $("#searchForm");
	    $("#searchForm button").on("click", function(e){
	    	if(searchForm.find("option:selected").val() == ""){
	    		alert("검색종류를 선택해주세요");
	    		return false;
	    	}
	    	if(searchForm.find("input[name='keyword']").val() ==""){
	    		alert("검색어를 입력하세요");
	    		return false;
	    	}
	    	e.preventDefault();
	    	console.log("............click");
	    	searchForm.find("input[name='pageNum']").val(1);
	    	searchForm.submit();
	    });
		
	});
</script>

<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
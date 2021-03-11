<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.searchBar{
	position: relative;
	border : 1px solid #e2e2e2;
	padding : 30px 25px;
	margin : 20px;
	}


	.bookList{
	margin: 20px 20px;
	}
	.listWrap{
	display: block;
	list-style: none;
	}
	.listWrap<li{
	display: list-item;
	}
	
	.bookData{
	position : relative;
	border : 1px solid #e2e2e2;
	padding : 30px 25px;
	margin : 20px;
	}
	.bookImg{
	position: absolute;
	left : 25px;
	top : 30px;
	width : 120px;
	box-sizing: border-box;
	}
	.bookInfo{
	position: relative;
	margin-left : 170px;
	padding-bottom: 40px;
	box-sizing: border-box;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Book List</title>
</head>
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>
<link rel="stylesheet" href="resources/css/slick.css">
<body>    

<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<body>
	<form id='actionForm' action="/search/searchResult" method="get">
		<input type="hidden" name="pageNum" value="${pageDTO.page.pageNum }">
		<input type="hidden" name="amount" value="${pageDTO.page.amount }">
		<input type="hidden" name="type" value="${pageDTO.page.type }">
		<input type="hidden" name="keyword" value="${pageDTO.page.keyword }">		
	</form>
	<h1>도서관 자료 검색</h1>
	<!-- search -->
	<div class="searchBar">
		<form id='searchForm' action='/search/searchResult' method='get'>
			<select name='type'>
				<option value="T">서명</option>
				<option value='A'>저자</option>
				<option value='P'>출판사</option>
				<option value='TA'>서명 + 저자</option>
				<option value='TP'>서명 + 출판사</option>
				<option value='TAP'>서명 + 저자 + 출판사</option>
			</select>
			<input type="text" name='keyword' placeholder="도서명을 입력하세요.">
			<input type="hidden" name="pageNum" value="${pageDTO.page.pageNum }">
			<input type="hidden" name="amount" value="${pageDTO.page.amount }">
			<button>검색</button>
		</form>
	</div>
	<!-- search -->
	<!-- bookList -->
	<div class="bookList">
		<ul class="listWrap">
			<c:forEach items="${bookList}" var="book">
			<li>
				<div class="bookData">
					<div class="bookImg">
						<img src="${book.image}">
					</div>
					<div class="bookInfo">
						<ul>
							<li><a class='move' href='<c:out value="${book.bno }"/>'><c:out
										value='${book.title }' /></a></li>
							<li>저자 : ${book.author}</li>
							<li>출판사 : ${book.publisher }</li>
							<li>출판일 : ${book.pubdate }</li>
							<li>ISBN : ${book.isbn }</li>
							<c:choose>
								<c:when test="${book.nowcount eq '1' }">대여 가능</c:when>
								<c:otherwise>대여 불가</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	<!-- bookList -->
    <!-- pagination -->
	<div class="pull-right">
		<ul class="pagination">
			<c:if test="${pageDTO.prev }">
				<li class="paginate_button previous"><a href='${pageDTO.startPage - 1 }'>Prev</a></li>
			</c:if>
			
			<c:forEach var="num" begin="${pageDTO.startPage }" end="${pageDTO.endPage }">
				<li class="paginate_button"><a href="${num }">${num }</a></li>
			</c:forEach>
			
			<c:if test="${pageDTO.next }">
				<li class="paginate_button next"><a href='${pageDTO.endPage + 1 }'>Next</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination -->
	
	<script>
		$(document).ready(function(){
			
			var result = '<c:out value="${result}"/>';
			var actionForm = $("#actionForm");
			var searchForm = $("#searchForm");
			
			$(".paginate_button a").on("click",function(e){
				e.preventDefault();
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			$(".move").on("click",function(e){
				e.preventDefault();
				actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
				actionForm.attr("action", "/search/getBook");
				actionForm.submit();
			})
			
			$("#searchForm button").on("click",function(e){
				if(!searchForm.find("input[name='keyword']").val()){
					alert('키워드를 입력하세요');
					return false;
				}
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				searchForm.submit();
			})
		});
	</script>
	  <!-- footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>


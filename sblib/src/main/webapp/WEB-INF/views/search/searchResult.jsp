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

	.bookList.listViewStyle .listWrap > li {
		position: relative;
	}
	.bookList.listViewStyle .listWrap > li .bookArea{
		position: relative;
		border: 1px solid #e2e2e2;
		padding: 30px 25px;
	}
	.bookList.listViewStyle .listWrap > li .bookImg{
		position: absolute;
		left : 25px;
		top: 30px;
		width : 150px;
		height: 210px;
		box-sizing: border-box;
	}
	.bookList.listViewStyle .listWrap > li .bookData {
	    margin-left: 170px;
	    min-height: 210px;
	    position: relative;
	    padding-bottom: 40px;
	    box-sizing: border-box;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Book List</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- DataTables JavaScript -->
<script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>
</head>
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>

<body>
<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<!-- hidden form -->
	<form id='actionForm' action="/search/searchResult" method="get">
		<input type="hidden" name="pageNum" value="${pageDTO.page.pageNum }">
		<input type="hidden" name="amount" value="${pageDTO.page.amount }">
		<input type="hidden" name="type" value="${pageDTO.page.type }">
		<input type="hidden" name="keyword" value="${pageDTO.page.keyword }">		
	</form>
	<!-- hidden form -->
	<!-- sidebar -->
	<div id='body'>
		<div id='sidemenu'>
			<div class="title">
				<h2>자료검색</h2>
			</div>
			<ul>
				<li><a href="/search/searchSimple">도서검색</a></li>
				<li><a href="http://www.dlibrary.go.kr/" target="_blank">국회원문 DB</a></li>
			</ul>
			<div class="lastchild"></div>
		</div>

		<div id='layer'>
			<h3>도서검색</h3>
			<div style="width: 100%; height: 20px;">
				<ul>
					<li>자료검색　>　</li>
					<li>도서검색</li>
				</ul>
			</div>
			<hr style="margin-top: 30px;">
			
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
					</select> <input type="text" name='keyword' placeholder="도서명을 입력하세요.">
					<input type="hidden" name="pageNum" value="${pageDTO.page.pageNum }"> 
					<input type="hidden" name="amount" value="${pageDTO.page.amount }">
					<button class="btn btn-warning">검색</button>
				</form>
			</div>
			<!-- search -->
			<c:out value="키워드 : ${pageDTO.page.keyword }에 대한"/>
			<c:out value=" 검색결과 : 총 ${pageDTO.total } 건"/>
			<!-- bookList -->
			<div class="bookList listViewStyle">
				<ul class="listWrap">
					<c:forEach items="${bookList}" var="book">
						<li>
							<div class="bookArea">
								<div class="bookImg">
									<img src="${book.image}" style="height:210px; width:150px">
								</div>
								<div class="bookData">
									<div class="book_dataInner">
										<ul class="dot-list clearfix">
											<li><a class='move' href='<c:out value="${book.bno }"/>'><c:out value='${book.title }' /></a></li>
											<li class="kor on">저자 : ${book.author}</li>
											<li class="kor on">출판사 : ${book.publisher }</li>
											<li class="kor on">출판일 : ${book.pubdate }</li>
											<li class="kor on">ISBN : ${book.isbn }</li>
											<c:choose>
												<c:when test="${book.nowcount eq '1' }">대여 가능</c:when>
												<c:otherwise>대여 불가</c:otherwise>
											</c:choose>
										</ul>
									</div>
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
				<li class="page-item"><a
					href='${pageDTO.startPage - 1 }'>이전</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageDTO.startPage }"
				end="${pageDTO.endPage }">
				<li class="page-item"><a href="${num }">${num }</a></li>
			</c:forEach>

			<c:if test="${pageDTO.next }">
				<li class="page-item"><a
					href='${pageDTO.endPage + 1 }'>다음</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination -->

		</div>
	</div>
	<!-- sidebar -->




	<script>
		$(document).ready(function() {

							var result = '<c:out value="${result}"/>';
							var actionForm = $("#actionForm");
							var searchForm = $("#searchForm");

							$(".page-item a").on("click", function(e) {
										e.preventDefault();
										actionForm .find("input[name='pageNum']") .val($(this).attr("href"));
										actionForm.submit();
									});

							$(".move") .on("click",function(e) {
												e.preventDefault();
												actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
												actionForm.attr("action","/search/getBook");
												actionForm.submit();
											})

							$("#searchForm button").on("click",function(e) {
												if (!searchForm.find("input[name='keyword']").val()) {
													alert('키워드를 입력하세요');
													return false;
												}
												searchForm.find("input[name='pageNum']").val("1");
												e.preventDefault();
												searchForm.submit();
											})
						});
	</script>
	<!-- js -->
	<tiles:insertAttribute name="js"></tiles:insertAttribute>
	  <!-- footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>


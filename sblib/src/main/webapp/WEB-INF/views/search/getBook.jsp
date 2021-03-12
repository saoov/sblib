<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<style>
.bookData {
	position: relative;
	border: 1px solid #e2e2e2;
	padding: 30px 25px;
	margin: 20px;
}

.bookImg {
	position: absolute;
	left: 25px;
	top: 30px;
	width: 200px;
	box-sizing: border-box;
}

.bookInfo {
	position: relative;
	margin-left: 250px;
	padding-bottom: 150px;
	box-sizing: border-box;
}
</style>
</head>
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>
<link rel="stylesheet" href="resources/css/slick.css">
<body>
	<!-- header -->
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
<body>
	<!-- sidebar -->
	<div id='body'>
		<div id='sidemenu'>
			<div class="title">
				<h2>자료검색</h2>
			</div>
			<ul>
				<li><a href="/search/searchSimple">도서검색</a></li>
			</ul>
			<div class="lastchild"></div>
		</div>
		<!-- sidebar -->
		<!-- content -->
		<div id='layer'>
			<h3>도서검색</h3>
			<div style="width: 100%; height: 20px;">
				<ul>
					<li>도서검색</li>
				</ul>
			</div>
			<hr style="margin-top: 30px;">
			<div class="bookData">
				<div class="bookImg">
					<img src="${book.image}">
				</div>
				<div class="bookInfo">
					<ul>
						<li>${book.author}지음</li>
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
			<div class="bookData">
				<p>책 소개</p>
				${book.description }
			</div>
			<div class="bookData">
				<button type="button" class="addCart_btn">서재에 담기</button>
				<button type="button" class="historyback">뒤로가기</button>
				<a href="/search/cartList">내 서재</a>
			</div>
		</div>
	</div>
	<script>
		$(".addCart_btn").on("click", function() {
			var bno = ${book.bno};
			var data = {bno : bno};

			$.ajax({
				url : "/search/addCart",
				type : "post",
				data : data,
				success : function() {
					alert("카트 담기 성공");
				},
				error : function() {
					alert("서재에 담겨있는 책입니다.");
					location.href="/search/cartList";
				}
			});
		});
		
		
		$(".historyback").on("click", function() {
			history.back();
		});
	</script>
	<!-- footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
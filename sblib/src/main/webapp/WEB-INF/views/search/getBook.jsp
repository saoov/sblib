<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>삼부도서관</title>
<style>
.bookDetailInformation .bookInfoWrap.cate_volume{
	padding: 0;
	margin: 0;
	border: 0;
}

.bookDataDiv {
    min-height: 350px;
    position: relative;
    padding: 30px 30px 30px 250px;
    margin-bottom: 30px;
    border: 1px solid #e2e2e2;
}
.bookDataDiv .bookImg {
    position: absolute;
    left: 30px;
    top: 30px;
    width: 190px;
    height: 264px;
}
.book_title{
	margin-bottom: 30px;
}
.book_title > span{
	font-size: 30px;
}
.book_description{
	min-height: 200px;
	position: relative;
	padding: 30px;
	margin-bottom: 30px;
	border: 1px solid #e2e2e2;
}
.book_button{
	min-height: 100px;
	position: relative;
	padding: 20px;
	margin-bottom: 50px;
	border: 1px solid #e2e2e2;
}
.white{
	color : white;
}
.btn{
	margin : 10px 30px;
	
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
				<li><a href="http://www.dlibrary.go.kr/" target="_blank">국회원문 DB</a></li>
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
			<div class="bookDetailInformation">
				<div class="bookInfoWrap cate_volume">
					<div class="bookDataDiv">
						<div class="bookImg">
							<img src="${book.image}">
						</div>
						<div class="bookInfo">
							<div class="book_title">
								<span>${book.title }</span>
							</div>
							<div class="book_publish">
								<span>${book.author } | </span>
								<span>${book.publisher }</span>
							</div>
							<div class="book_pubdate">
								<span>${book.pubdate }</span>
							</div>
							<div class="book_isbn">
								<span>${book.isbn }</span>
							</div>
							<div class="rent">
								<span>상태 : 
									<c:choose>
										<c:when test="${book.nowcount eq '1' }">대여 가능</c:when>
										<c:otherwise>대여 불가</c:otherwise>
									</c:choose>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="book_description">
				<p>책 소개</p>
				${book.description }
			</div>
			<div class="book_button">
				<c:choose>
					<c:when test="${userSession eq null}">
						<button type="button" class="btn addCart_btn btn-warning" onclick="javascript:login()"><span class="white">장바구니에 담기</span></button>
						<button type="button" class="btn myCart_btn btn-warning" onclick="javascript:login()"><span class="white">내 장바구니</span></button>
						<button type="button" class="btn historyBack_btn btn-warning"><span class="white">뒤로가기</span></button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn addCart${book.bno }btn btn-warning"  data-bno="${book.bno }"><span class="white">장바구니에 담기</span></button>
						<button type="button" class="btn myCart_btn btn-warning"><span class="white">내 장바구니</span></button>
						<button type="button" class="btn historyBack_btn btn-warning"><span class="white">뒤로가기</span></button>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>
	<script>
		$(".addCart${book.bno}btn").on("click", function() {
			var confirm_val = confirm("장바구니에 저장하시겠습니까?");

			if(confirm_val){
				var bno = $(this).attr("data-bno");
				
			$.ajax({
				url : "/search/getBook",
				type : "post",
				data : {bno : bno},
				success : function() {
					alert("장바구니에 저장하였습니다.");
				},
				error : function() {
					alert("장바구니에 저장하지 못하였습니다.");
					location.href="/serach/cartList";
				}
			});
			}
		});
		
		
		$(".historyBack_btn").on("click", function() {
			history.back();
		});
		
		$(".myCart_btn").on("click", function() {
			location.href='/search/cartList';
		});
		function login(){ 
    		alert('로그인이 필요한 서비스입니다.'); 
    		document.location.href="/member/login";
    	} 
	</script>
	<!-- js -->
	<tiles:insertAttribute name="js"></tiles:insertAttribute>
	<!-- footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
</head>
<body>
	<p>BNO : <span class="bno">${book.bno }</span></p>
	<hr>
	<img src='<c:out value="${book.image } "/>'>
	<hr>
	<c:out value="${book.title } "/>
	<hr>
	출판사 : <c:out value="${book.publisher } "/>
	<hr>
	지은이 : <c:out value="${book.author } "/>
	<hr>
	ISBN : <c:out value="${book.isbn } "/>
	<hr>
	가격 : <c:out value="${book.price } "/>원
	<hr>
	출간일 : <c:out value="${book.pubdate } "/>
	<hr>
	<c:out value="${book.description } "/>
	<hr>
	<p class="addToCart">
		<button type="button" class="addCart_btn">카트에 담기</button>
		<script>
			$(".addCart_btn").on("click",function(){
				var bno = ${book.bno};
				
				var data = {
					bno : bno
				};
				
				$.ajax({
					url : "/search/addCart",
					type : "post",
					data : data,
					success : function(){
						alert("카트 담기 성공");
					},
					error : function(){
						alert("카트 담기 실패");
					}
				});
			});
		</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>
<link rel="stylesheet" href="resources/css/slick.css">
<body>    

<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<body>

	<c:forEach items="${rentView}" var="rentView">
		<p>대여일:<fmt:formatDate value="${rentView.rentDate }" pattern="yyyy년 MM월 dd일" /></p>
		<p>서명:${rentView.title}</p>
		<p>저자:${rentView.author}</p>
		<p>출판사:${rentView.publisher}</p>
		<p>수량:${rentView.cartStock}</p>
		<p>ISBN:${rentView.isbn}</p>
		<button type="button" class="returnBtn" data-bno=${rentView.bno }>반납하기</button>
		<hr>
	</c:forEach>

	<script>
		$(".returnBtn").on("click", function() {
			var confirm_val = confirm("도서를 반납하시겠습니까?");

			if (confirm_val) {
				var checkArr = $(this).attr("data-bno");
				console.log(checkArr);
				$.ajax({
					url : "/search/rentView",
					type : "post",
					data : {
						bno : checkArr
					},
					success : function() {
						alert("무야호");
					}
 			});
			}
		});
	</script>
</body>
</html>
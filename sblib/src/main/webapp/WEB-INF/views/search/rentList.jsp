<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<c:forEach items="${rentList}" var="rentList">
			<li>
				<div>
					<p>대여정보 : ${rentList.rentId }</p>
					<p>회원번호 : ${rentList.member_no }</p>
					<p>대여도서 : ${rentList.bno } 번 - 제목 : ${rentList.title}
					<p>대출일 : ${rentList.rentDate }</p>
					<button type="button" class="returnBtn" data-bno=${rentList.bno }>반납하기</button>
				</div>
			</li>
		</c:forEach>
	</ul>
	<script>
		$(".returnBtn").on("click", function() {
			var confirm_val = confirm("도서를 반납하시겠습니까?");

			if (confirm_val) {
				var checkArr = $(this).attr("data-bno");
				console.log(checkArr);
				$.ajax({
					url : "/search/returnBook",
					type : "post",
					data : {
						bno : checkArr
					},
					success : function() {
						alert("무야호");
						location.href="/search/rentList";					}
 			});
			}
		});
	</script>
</body>
</html>
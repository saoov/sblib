<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<ul>
		<c:forEach items="${rentList}" var="rentList">
			<li>
				<div>
					<p>대여정보 : ${rentList.rentId }</p>
					<p>회원번호 : ${rentList.member_no }</p>
					<p>대여도서 : ${rentList.bno } 번 - 제목 : ${rentList.title}
					<p>대출일 : ${rentList.rentDate }</p>
					<button type="button" class="returnBtn" data-rentid="${rentList.rentId }" data-bno="${rentList.bno }">반납하기</button>
				</div>
			</li>
		</c:forEach>
	</ul>
	<script>
		$(".returnBtn").on("click", function() {
			var confirm_val = confirm("도서를 반납하시겠습니까?");

			if (confirm_val) {
				var bno = $(this).attr("data-bno");
				var rentid = $(this).attr("data-rentid");
				console.log(bno);
				$.ajax({
					url : "/search/returnBook",
					type : "post",
					data : {
						bno : bno,
						rentId : rentid
					},
					success : function() {
						alert("도서를 반납하였습니다.");
						location.href="/search/rentList";					
						}
 			});
			}
		});
	</script>
	<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
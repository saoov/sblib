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
	<table border="1" class="table">
		<tr>
			<td>제목</td>	
			<td>저자</td>
			<td>대여일</td>
			<td>반납예정일</td>
			<td></td>
		</tr>
		
		<c:forEach items="${rentList}" var="rentList">
		<tr>
					<td>${rentList.title }</td>
					<td>${rentList.author }</td>
					<td><fmt:formatDate value="${rentList.rentDate }" pattern="yyyy/MM/dd"/> </td>
					<td><fmt:formatDate value="${rentList.rentDate }" pattern="yyyy/MM/dd"/></td>
					<td><button type="button" class="returnBtn" data-rentid="${rentList.rentId }" data-bno="${rentList.bno }">반납하기</button></td>
		</tr>
		</c:forEach>
	</table>
		
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
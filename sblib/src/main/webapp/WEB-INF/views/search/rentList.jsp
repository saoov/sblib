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

<div id='body'>
   <div id='sidemenu'>
      <div class="title">
         <h2>MyLibrary</h2>
      </div>
      <ul>
         <li><a href="/search/rentList">내서재</a></li>
         <li><a href="/search/cartList">장바구니</a></li>
         <li><a href="/question/myList">내질문답변</a></li>
         <li><a href="/bookstory/myList">내책이야기</a></li>
      </ul>
      <div class="lastchild"></div>
   </div>
   
   <div id='layer'>
      <h3>내서재</h3>
      <div style="width:100%; height:20px;">
      <ul>
         <li>MyLibrary　>　</li>
         <li>내서재</li>
      </ul>
      </div>
        <hr style="margin-top:30px;">



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
					<td><fmt:formatDate value="${rentList.returnExpDate }" pattern="yyyy/MM/dd"/></td>
					<td><button type="button" class="returnBtn" data-rentid="${rentList.rentId }" data-bno="${rentList.bno }">반납하기</button></td>
		</tr>
		</c:forEach>
	</table>
	</div>
	</div>
		
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
	<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>
	<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
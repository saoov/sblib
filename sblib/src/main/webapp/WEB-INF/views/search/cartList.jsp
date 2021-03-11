<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.table{
	width : 400px;
	margin : 0 auto;
	}
</style>
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
		<!-- 버튼  -->
			<div class="allCheck">
				<input type="checkbox" name="allCheck" id="allCheck"><label for="allCheck">모두선택</label>
				<script>
					$("#allCheck").on("click",function(){
						var chk = $("#allCheck").prop("checked");
						if(chk){
							$(".chBox").prop("checked",true);							
						} else {
							$(".chBox").prop("checked",false);
						}
					})
				</script> 
			</div>
			<div class="delBtn">
				<button type="button" class="selectDelete_btn">선택삭제</button>
				<script>
					$(".selectDelete_btn").on("click",function(){
						var confirm_val = confirm("정말 삭제하시겠습니까?");
						
						if(confirm_val){
							var checkArr = new Array();
							
							$("input[class='chBox']:checked").each(function(){
								checkArr.push($(this).attr("data-cartNum"));
							});
							
							$.ajax({
								url : "/search/deleteCart",
								type : "post",
								data : {chbox : checkArr},
								success : function(result){
									if(result == 1){
										location.href = "/search/bookList";
									} else {
										alert("삭제 실패"+result);
									}
								}
							});
						}
					});
				</script>
			</div>
		<!-- 버튼  -->
		<!-- 카트 목록 -->
		<table border="1" class="table">
			<tr>
				<td>선택</td>
				<td>제목</td>
				<td>저자</td>
				<td>출판사</td>
				<td>ISBN</td>
				<td>서재등록일</td>
				<td>삭제</td>
			</tr>
		
		<c:forEach items="${cartList }" var="cartList">
		<tr>
			<td>
			<div class="checkBox">
				<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum }" data-bno="${cartList.bno }">
			
				<script>
					$(".chBox").on("click",function() {
						$("#allCheck").prop("checked", false);
					});
				</script>
			</div>
			</td>
					<td>${cartList.title }</td>
					<td>${cartList.author }</td>
					<td>${cartList.publisher }</td>
					<td>${cartList.isbn }</td>
					<td><fmt:formatDate value="${cartList.addDate }" pattern="yyyy/MM/dd"/></td>
			<td>
			<div class="delete">
				<button type="button" class="delete${cartList.cartNum }btn" data-cartNum="${cartList.cartNum }">삭제</button>
				<script>
					$(".delete${cartList.cartNum }btn").on("click",function(){
						var confirm_val = confirm("정말 삭제하시겠습니까?");
						
						if(confirm_val){
							var checkArr = new Array();
							
							checkArr.push($(this).attr("data-cartNum"));
							//이 부분 result값을 controller에서 잘못받는 듯.......(수정 필요)
							//선택 삭제시 location조정 필요
							$.ajax({
								url : "/search/deleteCart",
								type : "post",
								data : {chbox : checkArr},
								success : function(result){
									if(result == 1){
										location.href = "/search/bookList";
									} else {
										alert("삭제 실패"+result);
									}
								}
							});
						}
					});
				</script>
			</div>
			</td>
		</c:forEach>
		</table>
		<!-- 카트 목록 -->
		<button type="button" class="selectLoan_btn">선택대여</button>
			<script>
					$(".selectLoan_btn").on("click",function(){
						var confirm_val = confirm("선택된 도서를 대여하시겠습니까?");
						
						if(confirm_val){
							var checkArr = new Array();
							
							$("input[class='chBox']:checked").each(function(){
								checkArr.push($(this).attr("data-bno"));
							});
							console.log(checkArr);
							$.ajax({
								url : "/search/cartList",
								type : "post",
								data : {chbox : checkArr},
								success : function(result){
									alert("도서를 대여하였습니다.");
									location.href="/search/cartList";
								},
								error : function(msg){
									alert("대여수를 초과하였습니다.");
								}
							});
						}
					});
				</script>
	    <!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>
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
								url : "/book/deleteCart",
								type : "post",
								data : {chbox : checkArr},
								success : function(result){
									if(result == 1){
										location.href = "/book/bookList";
									} else {
										alert("삭제 실패"+result);
									}
								}
							});
						}
					});
				</script>
			</div>
		</li>
		<!-- 카트 목록 -->
		<c:set var="sum" value="0"/>
		<c:forEach items="${cartList }" var="cartList">
			<div class="checkBox">
				<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum }" data-bno="${cartList.bno }">
				<script>
					$(".chBox").on("click",function() {
						$("#allCheck").prop("checked", false);
					});
				</script>
			</div>
			<li>
				<p>제목 : ${cartList.title }</p>
				<p>지은이 : ${cartList.author }</p>
				<p>출판사 : ${cartList.publisher }</p>
				<p>ISBN : ${cartList.isbn }</p>
			</li>
			<div class="delete">
				<button type="button" class="delete${cartList.cartNum }btn" data-cartNum="${cartList.cartNum }">삭제</button>
				<script>
					$(".delete${cartList.cartNum }btn").on("click",function(){
						var confirm_val = confirm("정말 삭제하시겠습니까?");
						
						if(confirm_val){
							var checkArr = new Array();
							
							checkArr.push($(this).attr("data-cartNum"));
							//이 부분 result값을 controller에서 잘못받는 듯.......(수정 필요)
							$.ajax({
								url : "/book/deleteCart",
								type : "post",
								data : {chbox : checkArr},
								success : function(result){
									if(result == 1){
										location.href = "/book/bookList";
									} else {
										alert("삭제 실패"+result);
									}
								}
							});
						}
					});
				</script>
			</div>
			<hr>
		</c:forEach>
		<!-- 카트 목록 -->
		<c:set var="sum" value="${cartList.size() }"/>
	</ul>
	<div class="sum">
		대출 권수 : ${sum } 권
	</div>
	<div class="rentOpen">
		<button type="button" class="rentOpen_btn">대여정보</button>
	</div>
	
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
								url : "/book/cartList",
								type : "post",
								data : {chbox : checkArr},
								success : function(result){
									location.href = "/book/rentList";
									console.log(result);
								}
							});
						}
					});
				</script>
	
</body>
</html>
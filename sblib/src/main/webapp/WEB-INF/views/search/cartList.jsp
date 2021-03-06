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
	#deleteBtn{
		width:60px;
		background-color: #fbe9e7;
		color:#e65100;
		box-shadow: 1.5px 1.5px #ffab91;
		border-radius: 10%;
	}
	.selectLoan_btn{
		float:left;
		margin-right:10px;
		width: 80px;
		height: 40px;
		background-color: #e0f2f1;
		color:#00897b;
		box-shadow: 1.5px 1.5px #4db6ac;
		border-radius: 10%;
	}
	.selectDelete_btn{
		width: 80px;
		height: 40px;
		background-color: #fbe9e7;
		color:#e65100;
		box-shadow: 1.5px 1.5px #ffab91;
		border-radius: 10%;
	}
	.bookTitle:hover{
		text-decoration: none;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>삼부도서관</title>
</head>
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>
<link rel="stylesheet" href="resources/css/slick.css">
<body>    

<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>

<!-- sidebar -->
<div id='body'>
	<div id='sidemenu'>
		<div class="title">
			<h2>MyLibrary</h2>
		</div>
		<ul>
 			<li><a href="/search/rentList">내서재</a></li>
 			<li><a href="/search/returnList">대출내역</a>
               <li><a href="/search/cartList">장바구니</a></li>
               <li><a href="/question/myList">내질문답변</a></li>
               <li><a href="/bookstory/myList">내책이야기</a></li>
		</ul>
		<div class="lastchild"></div>
	</div>
	<!-- sidebar -->
	<!-- content -->
	<div id='layer'>
		<h3>장바구니</h3>
		<div style="width: 100%; height: 20px;">
			<ul>
			    <li>MyLibrary　>　</li>
				<li>장바구니</li>
			</ul>
		</div>
		<hr style="margin-top: 30px;">

		<!-- 버튼  -->
		<div class="allCheck">
			<input type="checkbox" name="allCheck" id="allCheck"><label
				for="allCheck">모두선택</label>
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
		<!-- 카트 목록 -->
		<table class="table table-bordered">
			<colgroup>
				<col width="6%">
				<col width="38%">
				<col width="8%">
				<col width="10%">
				<col width="18%">
				<col width="12%">
				<col width="8%">
			</colgroup>
			<tr>
				<td>선택</td>
				<td>제목</td>
				<td>저자</td>
				<td>출판사</td>
				<td>ISBN</td>
				<td>서재등록일</td>
				<td></td>
			</tr>

			<c:forEach items="${cartList }" var="cartList">
				<tr>
					<td>
						<div class="checkBox">
							<input type="checkbox" name="chBox" class="chBox"
								data-cartNum="${cartList.cartNum }" data-bno="${cartList.bno }">

							<script>
				$(".chBox").on("click",function() {
					$("#allCheck").prop("checked", false);
				});
			</script>
						</div>
					</td>
					<td><a class="bookTitle" href="/search/getBook?bno=${cartList.bno }">${cartList.title }</a></td>
					<td>${cartList.author }</td>
					<td>${cartList.publisher }</td>
					<td>${cartList.isbn }</td>
					<td><fmt:formatDate value="${cartList.addDate }"
							pattern="yyyy/MM/dd" /></td>
					<td>
						<div class="delete">
							<button type="button" id="deleteBtn" class="delete${cartList.cartNum }btn"
								data-cartNum="${cartList.cartNum }">삭제</button>
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
									alert("내 서재에 삭제하였습니다.");
									location.href = "/search/cartList";
								}
							});
						};
					});
			</script>
						</div>
					</td>
			</c:forEach>
		</table>
		<!-- 카트 목록 -->
		<button type="button" class="selectLoan_btn">선택대여</button>
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
							alert("장바구니에서 삭제하였습니다.");
							location.href = "/search/cartList";
						}
					});
				}
			});
		</script>
		<!-- 버튼  -->
		
	</div>
</div>


<!-- content -->
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
			error : function(request){
				alert("대여에 실패하였습니다.");
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
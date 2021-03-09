<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form id='actionForm' action="/book/bookList" method="get">
		<input type="hidden" name="pageNum" value="${pageDTO.page.pageNum }">
		<input type="hidden" name="amount" value="${pageDTO.page.amount }">
		<input type="hidden" name="type" value="${pageDTO.page.type }">
		<input type="hidden" name="keyword" value="${pageDTO.page.keyword }">		
	</form>
	<!-- table -->
	<div class="table">
    <table>
    	<thead>
    		<tr>
    			<td>Cover</td>
    			<td>Title</td>
    			<td>Author</td>
    			<td>Price</td>
    			<td>Publisher</td>
    			<td>release</td>
    			<td>ISBN</td>
    			<td>대출여부</td>
    		</tr>
    	</thead>
	        <c:forEach items="${bookList}" var ="book">
	            <tr>
	                <td><img src="${book.image}"></td>
	                <td><a class='move' href='<c:out value="${book.bno }"/>'><c:out value='${book.title }'/></a></td>
	                <td>${book.author}</td>
	                <td>${book.price }</td>
					<td>${book.publisher }</td>
					<td>${book.pubdate }</td>
					<td>${book.isbn }</td>
					<td>${book.isloan }
			</tr>
	            <tr>
	                <td colspan="7">${book.description}</td>
	            </tr>
	        </c:forEach>
    </table>
    </div>
    <!-- table -->
    <!-- pagination -->
	<div class="pagination">
		<ul>
			<c:if test="${pageDTO.prev }">
				<li><a href='${pageDTO.startPage - 1 }'>Prev</a></li>
			</c:if>
			
			<c:forEach var="num" begin="${pageDTO.startPage }" end="${pageDTO.endPage }">
				<li><a href='${num }'>${num }</a></li>
			</c:forEach>
			
			<c:if test="${pageDTO.next }">
				<li><a href='${pageDTO.endPage + 1 }'>Next</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination -->
	<!-- search -->
	<div class="search">
		<form id='searchForm' action='/book/bookList' method='get'>
			<select name='type'>
				<option value="T">서명</option>
				<option value='A'>저자</option>
				<option value='P'>출판사</option>
				<option value='TA'>서명 + 저자</option>
				<option value='TP'>서명 + 출판사</option>
				<option value='TAP'>서명 + 저자 + 출판사</option>
			</select>
			<input type="text" name='keyword'>
			<input type="hidden" name="pageNum" value="${pageDTO.page.pageNum }">
			<input type="hidden" name="amount" value="${pageDTO.page.amount }">
			<button>Search</button>
		</form>
	</div>
	<!-- search -->
	<script>
		$(document).ready(function(){
			
			var result = '<c:out value="${result}"/>';
			var actionForm = $("#actionForm");
			var searchForm = $("#searchForm");
			
			$("li a").on("click",function(e){
				e.preventDefault();
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			$(".move").on("click",function(e){
				e.preventDefault();
				actionForm.append("<input type='hidden' name='bno' value='"+
						$(this).attr("href")+"'>");
				actionForm.attr("action", "/book/getBook");
				actionForm.submit();
			})
			
			$("#searchForm button").on("click",function(e){
				if(!searchForm.find("input[name='keyword']").val()){
					alert('키워드를 입력하세요');
					return false;
				}
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				searchForm.submit();
			})
		});
	</script>
    
</body>
</html>


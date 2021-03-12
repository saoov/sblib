<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   		<form id='actionForm' action="/book/bookList" method="get">
		<input type="hidden" name="pageNum" value="${pageDTO.page.pageNum }">
		<input type="hidden" name="amount" value="${pageDTO.page.amount }">
<%-- 		<input type="hidden" name="type" value="<c:out value='${pageDTO.page.type }'/>"> --%>
<%-- 		<input type="hidden" name="keyword" value="<c:out value='${pageDTO.page.keyword }'/>">		 --%>
	</form>
	<style type="text/css">
	.dropbtn {

    background-color: #564a3d;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}
.dropdown {
    position: relative;
    left :90%;
    display: inline-block;
}
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}
.dropdown-content a:hover {
    background-color: #f1f1f1
}
.dropdown:hover .dropdown-content {
    display: block;
}
.dropdown:checked .dropbtn {
    background-color: #443B30;
}

</style>
   
  <div style="width:100%; height:100%; min-height: 650px">
   <div class="dropdown">
      <button class="dropbtn">도서개수보기</button>
      <div class="dropdown-content">
        <a href="/book/bookList?pageNum=1&amount=5">5개씩보기</a>
        <a href="/book/bookList?pageNum=1&amount=10">10개씩보기</a>
        <a href="/book/bookList?pageNum=1&amount=20">20개씩보기</a>
      </div>
    </div>
  
    <table>
    	<thead>
    		<tr>
    			<td>사진</td>
    			<td>도서명</td>
    			<td>지은이</td>
    			<td>가격</td>
    			<td>출판사</td>
    			<td>출판일</td>
    			<td>ISBN</td>
    			<td>수량</td>
    		</tr>
    	</thead>
	        <c:forEach items="${bookList}" var ="book" >
	            <tr>
	                <td><img src="${book.image}"></td>
	                <td><a class='move' href='<c:out value='${book.bno}'/>'><c:out value='${book.title.replaceAll("\\\<.*?\\\>","")}'/></a></td>
	                <td>${book.author}</td>
	                <td>${book.price }</td>
					<td>${book.publisher }</td>
					<td>${book.pubdate }</td>
					<td>${book.isbn }</td>
					<td>${book.nowcount }</td>
			</tr>
	            <tr>
	                <td colspan="8">줄거리: <c:out value='${book.description.replaceAll("\\\<.*?\\\>","")}'/></td>
	            </tr>
	 


	<tr>
	<td colspan="8">
			<form action="/book/bookdelete" method="post">
    		
    			<input type="hidden" name="bno" value="${book.bno }" >
    			
            	<input type="submit" value="삭제">
    		</form>
		</td>
	</tr>
     </c:forEach>
    
    </table>

    <!-- table -->
    <!-- pagination -->
	<div class="pagination" style="right : 50%">
		<ul style="list-style: none;">
			<c:if test="${pageDTO.prev }">
				<li style="float: left"><a style="font-size: 20px; color: black " class="k" href='${pageDTO.startPage - 1 }'>Prev</a></li>
			</c:if>
			
			<c:forEach var="num" begin="${pageDTO.startPage }" end="${pageDTO.endPage }">
				<li style="float: left"><a style="font-size: 20px; color: black " class="k" href='${num }'>| ${num } |</a></li>
			</c:forEach>
			
			<c:if test="${pageDTO.next }">
				<li style="float: left"><a style="font-size: 20px; color: black " class="k" href='${pageDTO.endPage + 1 }'>Next</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination -->
	<script>
		$(document).ready(function(){
			
			var result = '<c:out value="${result}"/>';
			var actionForm = $("#actionForm");
			var searchForm = $("#searchForm");
			
			$(".k").on("click",function(e){
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
			

		});
	</script>
	</div>
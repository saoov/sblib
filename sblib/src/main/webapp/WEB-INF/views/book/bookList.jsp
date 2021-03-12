<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>


        <form id='actionForm' action="/book/bookList" method="get">
      <input type="hidden" name="pageNum" value="${pageDTO.page.pageNum }">
      <input type="hidden" name="amount" value="${pageDTO.page.amount }">
<%--       <input type="hidden" name="type" value="<c:out value='${pageDTO.page.type }'/>"> --%>
<%--       <input type="hidden" name="keyword" value="<c:out value='${pageDTO.page.keyword }'/>">       --%>
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
  
    <table class="table table-striped table-bordered table-hover">
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
   	<div style="float: left">
   	

         <form action="/book/bookdelete" method="post">
          
          <!--  -->   <input type="hidden" name="bno" value="${book.bno }" >
             <!--  -->      <input type="hidden" name="bookname" value="${book.title }" >
             <!--  -->      <input type="hidden" name="nowcount" value="${book.nowcount }" >
               <input class="btn btn-danger" type="submit" value="삭제">
          </form>
  
     <c:if test = "${book.todaybook eq 0}">
        
           <form id="down" action="/book/tbinsert" method="post">
          <!--  -->   <input type="hidden" name="bno" value="${book.bno }" >
             <!--  -->     
               <input class="btn btn-info" type="submit" value="오늘의도서 적용">
          </form>
      </c:if>
      
      <c:if test = "${book.todaybook eq 1}">
        
           <form id="down" action="/book/tbdelete" method="post">
          <!--  -->   <input type="hidden" name="bno" value="${book.bno }" >
             <!--  -->     
               <input class="btn btn-danger" type="submit" value="오늘의도서 삭제">
          </form>
      </c:if>
 
   	</div>
      
      </td>
   </tr>
     </c:forEach>
    
    </table>

    <!-- table -->
    <!-- pagination -->
    <div class="pagination">
      <ul class="pagination">
							<c:if test="${pageDTO.prev}">
								<li class="page-item"><a class="page-link"
									href="${pageDTO.startPage - 1}" tabindex="-1">이전</a></li>
							</c:if>
							<c:forEach begin="${pageDTO.startPage}"
								end="${pageDTO.endPage}" var="num">
								<li class="page-item ${pageDTO.page.pageNum == num?"active":""}">
									<a class="page-link" href="${num }">${num }</a>
								</li>
							</c:forEach>
							<c:if test="${pageDTO.next}">
								<li class="page-item"><a class="page-link"
									href="${pageDTO.endPage + 1}" tabindex="-1">다음</a></li>
							</c:if>
						</ul>
						<form id='actionForm3' action="/book/bookList" method="get">
						<input type='hidden' name='pageNum'
							value='${pageDTO.page.pageNum}'> <input type='hidden'
							name='amount' value='${pageDTO.page.amount}'>
							<input type='hidden'
							name='amount' value='${pageDTO.page.amount}'>
					</form>
   </div>
   
   <div id="myModal" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Modal body text goes here.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Save
						changes</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
   <!-- pagination -->
   <script>
      $(document).ready(function(){
         
         var result = '<c:out value="${result}"/>';
         var title = '<c:out value="${title}"/>';
         
         var actionForm = $("#actionForm");
         var searchForm = $("#searchForm");
         
         var result = '<c:out value="${result}"/>';
		 
			checkModal(result);

			history.replaceState({}, null, null);

			function checkModal(result) {

				if (result === '' || history.state) {
					return;
				}
				if (result === 'success') {
					$(".modal-title").html("삭제성공");
					$(".modal-body").html(title+"이 삭제되었습니다.");

				} else if (result === 'fail') {
					$(".modal-title").html("삭제실패");
					$(".modal-body").html(title+"을 대여하는 회원이 존재합니다. 삭제실패");
				}
				else if (result === 'setsuccess') {
					$(".modal-title").html("등록성공");
					$(".modal-body").html("오늘의 책등록 성공");
				}
				else if (result === 'setfail') {
					$(".modal-title").html("등록실패");
					$(".modal-body").html("이미5개이상의 오늘의 책이있습니다.");
				}
				else if (result === 'downsuccess') {
					$(".modal-title").html("내리기성공");
					$(".modal-body").html("오늘의책 내리기성공");
				}
				
				$("#myModal").modal("show");
			}
			
			var actionForm = $("#actionForm3");

			$(".page-link").on(
					"click",
					function(e) {

						e.preventDefault();

						var targetPage = $(this).attr("href");

						console.log(targetPage);

						actionForm
								.find("input[name='pageNum']")
								.val(targetPage);
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
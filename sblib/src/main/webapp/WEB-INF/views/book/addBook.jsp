<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     <div style="width:100%; height:100%; min-height: 650px ">
         <div style=" width:300px; margin:0 auto;">
       <label style="font-size: 20px">도서검색</label>
        <form action="/book/addBook" method="get">
            <input type="text" name="keyword">
            <input type="submit" value="검색">
           
        </form>
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
          </tr>
       </thead>
           <c:forEach items="${bookList}" var ="book" >
               <tr>
                   <td><img src="${book.image}"></td>
                   <td><c:out value='${book.title.replaceAll("\\\<.*?\\\>","")}'/></td>
                   <td>${book.author}</td>
                   <td>${book.price }</td>
               <td>${book.publisher }</td>
               <td>${book.pubdate }</td>
               <td>${book.isbn }</td>
         </tr>
               <tr>
                   <td colspan="7">줄거리: <c:out value='${book.description.replaceAll("\\\<.*?\\\>","")}'/></td>
               </tr>
    



    <tr>
   <td colspan="7">
   <form action="/book/addBooks" method="post">
   
             <input type="hidden" name="keyword" value="${keyword}" >
             <input type="hidden" name="title" value="<c:out value='${book.title.replaceAll("\\\<.*?\\\>","")}'/>" >
             <input type="hidden" name="author" value="${book.author}" >
             <input type="hidden" name="price" value="${book.price }" >
             <input type="hidden" name="isbn" value="${book.isbn }" >
             <input type="hidden" name="image" value="${book.image}" >
             <input type="hidden" name="discount" value="${book.discount}" >
             <input type="hidden" name="publisher" value="${book.publisher}" >
             <input type="hidden" name="pubdate" value="${book.pubdate}" >
             <input type="hidden" name="description" value="<c:out value='${book.description.replaceAll("\\\<.*?\\\>","")}'/>" >
             <input type="hidden" name="link" value="${book.link}" >
             <input type="hidden" name="count" value="1" >
               <input type="submit" value="등록">
          </form>
    </td>
<tr>
       </c:forEach>
    
    </table>
   
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
				<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					<button type="button" class="btn btn-secondary"data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal -->

	<script>
		$(document)
				.ready(
						function() {

							   var result = '<c:out value="${result}"/>';
							   var title = '<c:out value="${title}"/>';
									checkModal(result);

									history.replaceState({}, null, null);

									function checkModal(result) {

										if (result === '' || history.state) {
											return;
										}
										if (result === 'success') {
											$(".modal-title").html("등록성공");
											$(".modal-body").html(title+"이 등록되었습니다.");

										} else if (result === 'fail') {
											$(".modal-title").html("삭제실패");
											$(".modal-body").html("해당도서는 이미존재합니다.");
										}
										$("#myModal").modal("show");
									

											
							}
							});
		
		</script>
     
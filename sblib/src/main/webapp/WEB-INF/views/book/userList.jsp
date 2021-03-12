<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     
   
  
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
      <button class="dropbtn">유저목록개수</button>
      <div class="dropdown-content">
        <a href="/admin/userList?pageNum=1&amount=5&member_no=${member_no }">5개씩보기</a>
        <a href="/admin/userList?pageNum=1&amount=10&member_no=${member_no }">10개씩보기</a>
        <a href="/admin/userList?pageNum=1&amount=20&member_no=${member_no }">20개씩보기</a>
      </div>
    </div>
     <div style=" width:300px; margin:0 auto;">
       <label style="font-size: 20px">유저검색</label>
       
        <form action="/admin/userList" method="get">
            <input type="text" name="member_no">
            <input type="submit" value="검색">
           
        </form>
       </div>
  
    <table class="table table-striped table-bordered table-hover">
       <thead>
          <tr>
             <td>이름</td>
             <td>회원번호</td>
             <td>대여번호</td>
             <td>isbn</td>
             <td>책제목</td>
             <td>대여일</td>
             <td>반납예정일</td>
             <td>반납일</td>
             <td>연체일</td>
           </tr>
       </thead>
           <c:forEach items="${userList}" var ="user" >
               <tr>
                   <td>${user.member_name}</td>
                   <td>${user.member_no}</td>
                   <td>${user.rentid}</td>
                   <td>${user.book_no}</td>
               <td>${user.book_title}</td>
               <td>${user.rental_date}</td>
               <td>${user.rexpected_date}</td>
               <td>${user.returndate}</td>
               <td>${user.delay_date}</td>
         </tr>
              
    


   <tr>  
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
						<form id='actionForm' action="/admin/userList" method="get">
						<input type='hidden' name='pageNum'
							value='${pageDTO.page.pageNum}'> <input type='hidden'
							name='amount' value='${pageDTO.page.amount}'>
							<input type='hidden'
							name='member_no' value='${member_no}'>
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
    	     var member_no= '<c:out value="${result}"/>'
				checkModal(result);

			

				function checkModal(result) {

					if (result === '') {
						return;
					}
					if (result === 'fail') {
						$(".modal-title").html("검색실패");
						$(".modal-body").html("회원번호를 다시입력해주세요.");
					}
					$("#myModal").modal("show");
				

						
		}
				
				var actionForm = $("#actionForm");

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
         
       
         
         
         

      });
   </script>
   </div>
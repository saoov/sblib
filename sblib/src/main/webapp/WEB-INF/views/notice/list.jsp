<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>

</head>

<body>
    
	
	<div class="row">
                <div class="col-lg-12">                   
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                            <button id='regBtn' type="button" class="btn btn-xs pull-right">Register
               New Board</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>Title</th>
                                        <th>RegDate</th>
                                        <th>UpdateDate</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="board">
                                    <tr class="odd gradeX">
                                        <td><a class="move" href='<c:out value="${notice_no}"/>'>
                                            <c:out value="${notice_no }"/></a>
                                        </td>
                                       <td><a class="move" href='<c:out value="${notice_no}"/>'><c:out value="${notice_title}"/></a></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice_regdate}" /></td>
                                   <td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice_updateDate}" /></td>
                                    </tr>
                                </c:forEach>    
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            
                        <form id='searchForm' action="/notice/list" method='get'>
<select name='type'>
<option value=""
      <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
      <option value="T"
      <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
      <option value="C"
      <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
      <option value="W"
      <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
      <option value="TC"
      <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목or 내용</option>
      <option value="TW"
      <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목or 작성자</option>
      <option value="TWC"
      <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목or 내용 or 작성자</option>
      </select> 
   <input type='text' name='keyword'value='<c:out value="${page.page.keyword}"/>' /> 
   <input type='hidden' name='pageNum'value='<c:out value="${page.page.pageNum}"/>' /> 
   <input type='hidden' name='amount' value='<c:out value="${page.page.amount}"/>' />
   <button class='btn btn-default'>Search</button>
</form>
                        <h3>${page}</h3> 
                        <div class="pull-right">
                           <ul class="pagination"> 
                    <c:if test="${page.prev}">
         <li class="paginate_button previous"><a               
                  href="${page.startPage -1}">Previous</a></li>
  </c:if>
   <c:forEach var="num" begin="${page.startPage}"
   end="${page.endPage}">
   <li class="paginate_button  ${page.page.pageNum == num ? "active":""} ">                  <a href="${num}">${num}</a>
   </li>
   </c:forEach>

   <c:if test="${page.next}">
   <li class="paginate_button next"><a     href="${page.endPage +1 }">Next</a></li>
   </c:if>                           
                           </ul>
                        </div> 
                        <form id="actionForm" action="/notice/list" method="get">
                           <input type="hidden" name="pageNum" value="${page.page.pageNum }">
                           <input type="hidden" name="amount" value="${page.page.amount }">
                           <input type='hidden' name='type' value='<c:out value="${ page.page.type }"/>'>
      					   <input type='hidden' name='keyword'  value='<c:out value="${ page.page.keyword }"/>'>
                           
                        </form>                       
                            
                        </div>
                       
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

<div id="myModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>                
     
<script>

$(document).ready(function() {
   
   var result = '<c:out value="${result}"/>';
   
    checkModal(result);
    
    history.replaceState({}, null, null);
    
    function checkModal(result) {
 
      if (result === ''|| history.state) {
        return;
      }
      
     if (result === 'success') {
       $(".modal-body").html("정상적으로 처리되었습니다.");
     }else if (parseInt(result) > 0) {
        $(".modal-body").html(
            "게시글 " + parseInt(result) + " 번이 등록되었습니다.");
      }
      
       $("#myModal").modal("show");
    }
    
    $("#regBtn").on("click",function() {       
       self.location = "/notice/register";
       
    });
    
    var actionForm = $("#actionForm");
    $(".page-link").on("click",function(e){
       e.preventDefault();//기본동작을 제한
        console.log("click"); 
       var targetPage = $(this).attr("href");//href(a태그)
        console.log(targetPage); //<form>태그의 내용 변경후 submit(전송)
        actionForm.find("input[name='pageNum']").val($(this).attr("href"));//val(값을 전달해줌)
        actionForm.submit();//값이 전송돼서 날아감
    });
    
    $(".move").on("click", function(e){        
        e.preventDefault();
        actionForm.append("<input type='hidden' name='notice_no' value='"+ $(this).attr("href")+"'>");
        actionForm.attr("action","/notice/get");
        actionForm.submit();        
      });
    
    $(".paginate_button a").on("click",function(e) {                        
    e.preventDefault();                     
    console.log('click');                     
    actionForm.find("input[name='pageNum']").val($(this).attr("href"));                     
    actionForm.submit();
    });
    
    var searchForm = $("#searchForm");
    $("#searchForm button").on(
    "click",
    function(e) {
       
    if (!searchForm.find("option:selected")
    .val()) {
    alert("검색종류를 선택하세요");
    return false;
    }
    
    if (!searchForm.find(
    "input[name='keyword']").val()) {
    alert("키워드를 입력하세요");
    return false;
    }
    
    searchForm.find("input[name='pageNum']").val("1");
    e.preventDefault();
    
    searchForm.submit();
    });
   

});

</script>
</body>
</html>
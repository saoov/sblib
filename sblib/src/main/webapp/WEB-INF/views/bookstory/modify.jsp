<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

</head>
<body>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시글 수정/삭제 페이지</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                                게시글 수정/삭제 페이지입니다.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <form> 
                             <input type="hidden" name="pageNum" value="${page.pageNum }">
                             <input type="hidden" name="amount" value="${page.amount }">
                                                                     
                             <div class="form-group">
                                 <label>글번호</label>
                                 <input class="form-control" name="story_no" readonly="readonly" value='<c:out value="${bookstory.story_no}"/>'> 
                                 <!-- input쓸때 name속성(=파라미터로 수집되는 이름) 명심해야함  -->
                             </div>  
                            
                             <div class="form-group">
                                 <label>제목</label>
                                 <input class="form-control" name="story_title" value='<c:out value="${bookstory.story_title}"/>'> 
                                 <!-- input쓸때 name속성(=파라미터로 수집되는 이름) 명심해야함  -->
                             </div>
                             
                             <div class="form-group">
                                 <label>내용</label>
                                 <textarea rows="5" cols="50" name="story_content" class="form-control"><c:out value="${bookstory.story_content}"/></textarea> 
                             </div>
                             
                             <div class="form-group">
                                 <label>작성자</label>
                                 <input class="form-control" name="story_author" value='<c:out value="${bookstory.story_author}"/>'>
                             </div>
                             
                             <div class="form-group">
                                 <label>조회수</label>
                                 <input class="form-control" name="story_readcount" value='<c:out value="${bookstory.story_readcount}"/>'>
                             </div>
                             
                             <button class="btn btn-default" data-oper='modify'>수정</button>
                             <button class="btn btn-danger" data-oper='remove'>삭제</button>
                             <button class="btn btn-info" data-oper='list'>목록</button>
                        </form>    
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
<script>

 $(document).ready(function(){
	 
	var formObj = $("form"); 
	
	$('.btn').click(function(e){
		
		e.preventDefault(); //이벤트 발생시 기본 동작(링크나 from에서 자동 submit이 일어나는것)을 막음
		
		var operation = $(this).data("oper");
		
		console.log(operation); //버튼이 눌렸는지 확인
		
		if(operation === 'list'){   //list버튼 눌렀을때
			self.location = "/bookstory/list";
		}else if(operation === 'remove'){   //remove버튼 눌렀을때
			formObj.attr("action","/bookstory/remove")
			.attr("method", "post");
		    formObj.submit(); //실제로 삭제가 됨
		    
		}else if(operation === 'modify'){   //modify버튼 눌렀을때
			formObj.attr("action","/bookstory/modify")
			.attr("method", "post");
		    formObj.submit(); 
		}
	})
	
 })

</script>            
</body>
</html>
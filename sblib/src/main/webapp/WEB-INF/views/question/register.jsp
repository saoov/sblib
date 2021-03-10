<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
                    <h1 class="page-header">글 작성</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                             게시글 작성하는 페이지입니다.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form action="/question/register" method="post">
                            
                             <div class="form-group">
                                 <label>제목</label>
                                 <input class="form-control" name="que_title"> 
                                 <!-- input쓸때 name속성(=파라미터로 수집되는 이름) 명심해야함  -->
                             </div>
                             
                             <div class="form-group">
                                 <label>내용</label>
                                 <textarea rows="5" cols="50" name="que_content" class="form-control"></textarea> 
                             </div>
                             
                             <div class="form-group">
                                 <label>작성자</label>
                                 <input class="form-control" name="que_author">
                             </div>
                             
                             <div class="form-group">
                                 <label>처리상태</label>
                                 <input class="form-control" name="que_status">
                             </div>
                             
                             <button type="submit" class="btn btn-default">전송</button>
                             <button type="reset" class="btn btn-default">취소</button>
                            
                            </form>                          
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           	 공지사항 읽기화면
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <form id="operForm" action="/notice/modify" method="get">
                           <input type="hidden" id="notice_no" name="notice_no" value='<c:out value="${noticeVO.notice_no}"/>'>
                           <input type="hidden" name="pageNum" value='<c:out value="${page.pageNum}"/>'>
                           <input type="hidden" name="amount" value='<c:out value="${page.amount}"/>'>
                           <input type='hidden' name='keyword' value='<c:out value="${page.keyword}"/>'>
  							<input type='hidden' name='type' value='<c:out value="${page.type}"/>'>  
                           
                        </form>
                       <div class="form-group">
                                    <label>BNO</label>
                                    <input class="form-control" name="notice_no" readonly="readonly" value= '<c:out value="${noticeVO.notice_no}"/>'>
                            </div>
                       <div class="form-group">
                                    <label>Title</label>
                                    <input class="form-control" name="notice_title" readonly="readonly" value= '<c:out value="${noticeVO.notice_title}"/>'>
                            </div>
                            <div class="form-group">
                                <label>Content</label>
                                <textarea rows="5" cols="50" name="notice_content" class="form-control" ><c:out value="${noticeVO.notice_content}"/></textarea>
                            </div>
                            
                      <button type="submit" class="btn btn-default"><a href='/notice/list?pageNum=${page.pageNum}&amount=${page.amount}'>List</a></button>
                            <button type="reset" class="btn btn-default"><a href='/notice/modify?notice_no=<c:out value="${noticeVO.notice_no}"/>'>Modify</a></button>
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->


<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/notice/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#notice_no").remove();
    operForm.attr("action","/notice/list")
    operForm.submit();
    
  });  
});
</script>
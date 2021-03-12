<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">
</head>

<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>

<body>

<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>

<div id='body'>
   <div id='sidemenu'>
      <div class="title">
         <h2>프로그램</h2>
      </div>
      <ul>
         <li><a href="/notice/list">공지사항</a></li>
         <li><a href="/question/list">묻고답하기</a></li>
         <li><a href="/bookstory/list">책이야기</a></li>
      </ul>
      <div class="lastchild"></div>
   </div>
   
   <div id='layer'>
      <h3>공지사항</h3>
      <div style="width:100%; height:20px;">
      <ul>
         <li>열린공간　>　</li>
         <li>공지사항</li>
      </ul>
      </div>
			
   		<hr style="margin-top:30px;">

				<div class="panel-body">
					<form id="frm">
						<input type="hidden" name="pageNum" value="${page.pageNum }">
						<input type="hidden" name="amount" value="${page.amount }">

						<div class="form-group">
							<label>글번호</label> <input class="form-control" name="notice_no"
								readonly="readonly"
								value='<c:out value="${noticeVO.notice_no}"/>'>
							<!-- input쓸때 name속성(=파라미터로 수집되는 이름) 명심해야함  -->
						</div>

						<div class="form-group">
							<label>제목</label> <input class="form-control" name="notice_title"
								value='<c:out value="${noticeVO.notice_title}"/>'>
							<!-- input쓸때 name속성(=파라미터로 수집되는 이름) 명심해야함  -->
						</div>


						<div class="form-group">
							<label>내용</label>
							<textarea rows="5" cols="50" name="notice_content"
								class="form-control"><c:out
									value="${noticeVO.notice_content}" /></textarea>
						</div>

						<c:choose>
							<c:when test="${noticeVO.notice_fileid eq null}">
								<input type='file' name='uploadFile' />
								<div id="id_check"></div>
							</c:when>
							<c:otherwise>
								<div class="form-group">
									<label>첨부파일</label>
									<p>
										<input type="hidden" value="${noticeVO.notice_fileid }"
											id="notice_fileid">
										<button type="button" class="btn btn-default fileBtn">
											<a href='#'>${noticeVO.notice_filename}</a>
										</button> 
									</p>
								</div>
							</c:otherwise>
						</c:choose>
						
						<form id='actionForm' action="/notice/modify" method='get'>
							<input type='hidden' name='notice_filename' value='${noticeVO.notice_filename}'>
							<input type='hidden' name='notice_fileid' value='${noticeVO.notice_fileid}'>
						</form>
						<br><br>


						<button class="btn btn-default" data-oper='modify'>수정</button>
						<button class="btn btn-danger" data-oper='remove'>삭제</button>
						<button class="btn btn-info" data-oper='list'>목록</button>
					</form>
				</div>
   </div>
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
	<!-- modal -->

	<script>
	$(document).ready(
			function() {

				var formObj = $("form");

				$('.btn').click(
						function(e) {

							e.preventDefault(); //이벤트 발생시 기본 동작(링크나 from에서 자동 submit이 일어나는것)을 막음

							var operation = $(this).data("oper");

							console.log(operation); //버튼이 눌렸는지 확인

							if (operation === 'list') { //list버튼 눌렀을때
								self.location = "/notice/list";
							} else if (operation === 'remove') { //remove버튼 눌렀을때
								formObj.attr("action", "/notice/remove")
										.attr("method", "post");
								formObj.submit(); //실제로 삭제가 됨

							} else if (operation === 'modify') { //modify버튼 눌렀을때
								formObj.attr("action", "/notice/modify")
										.attr("method", "post")
										.attr("enctype", "multipart/form-data");
								formObj.submit();
							}
						})
			});

	</script>
	<!-- js -->
	<tiles:insertAttribute name="js"></tiles:insertAttribute>
	<!-- footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>

</body>
</html>
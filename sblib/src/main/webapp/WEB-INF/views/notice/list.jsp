<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>삼부도서관 : 열린공간</title>

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

<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- DataTables JavaScript -->
<script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>
</head>

<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>


<body>
<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>

<div id='body'>
   <div id='sidemenu'>
      <div class="title">
         <h2>열린공간</h2>
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


				<!-- table -->
				<div class="panel-body">
				 <c:choose>
					<c:when test= "${userSession.member_name eq '관리자'}">
						<button id="regBtn" type="button" class="btn btn-secondary pull-right">글 작성</button>
					</c:when>
				</c:choose>
					<table width="100%"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>등록일</td>
								<td>조회수</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="#{list }" var="noticeVO">
								<tr class="odd gradeX">
									<td>${noticeVO.notice_no }</td>
									<td><a class="move"
										href='<c:out value="${noticeVO.notice_no}"/>'><c:out
												value="${noticeVO.notice_title}" /></a></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${noticeVO.notice_regdate }" /></td>
									<td>${noticeVO.notice_readcount }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- table -->

					<!-- search -->
					<div class="search">
						<form id='searchForm' action='/notice/list' method='get'>
							<select name='type'>
								<option value="T" ${pageMaker.page.type eq 'T'?"selected":"" }>제목</option>
								<option value="C" ${pageMaker.page.type eq 'C'?"selected":"" }>내용</option>
								<option value="TC" ${pageMaker.page.type eq 'TC'?"selected":"" }>제목+내용</option>
							</select> <input type="text" name='keyword'
								value="${pageMaker.page.keyword }"> <input type="hidden"
								name="pageNum" value="${pageMaker.page.pageNum }"> <input
								type="hidden" name="amount" value="${pageMaker.page.amount }">
							<button class="btn btn-default">검색</button>
						</form>
					</div>
					<!-- search -->

					<!-- pagination -->
					<div class="pull-right">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.startPage - 1}" tabindex="-1">이전</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="num">
								<li class="page-item ${pageMaker.page.pageNum == num?"active":""}">
									<a class="page-link" href="${num }">${num }</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.endPage + 1}" tabindex="-1">다음</a></li>
							</c:if>
						</ul>
					</div>

					<form id='actionForm' action="/notice/list" method="get">
						<input type='hidden' name='pageNum'
							value='${pageMaker.page.pageNum}'> <input type='hidden'
							name='amount' value='${pageMaker.page.amount}'> <input
							type='hidden' name='type' value='${pageMaker.page.type}'>
						<input type='hidden' name='keyword'
							value='${pageMaker.page.keyword}'>
					</form>
					<!-- pagination -->
				</div>
			
   </div>
</div>



	<div id="myModal" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">확인</h5>
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
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
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

							checkModal(result);

							history.replaceState({}, null, null);

							function checkModal(result) {

								if (result === '' || history.state) {
									return;
								}

								if (result === 'success') {
									$(".modal-body").html("정상적으로 처리되었습니다.");

								} else if (parseInt(result) > 0) {
									$(".modal-body").html(
											"게시글 " + parseInt(result)
													+ " 번이 등록되었습니다.");
								}

								$("#myModal").modal("show");
							}

							$("#regBtn").click(function() {

								self.location = "/notice/register";

							});

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

							$(".move")
									.on(
											"click",
											function(e) {
												e.preventDefault();

												var targetStory_no = $(this)
														.attr("href");

												console.log(targetStory_no);

												actionForm
														.append("<input type='hidden' name='notice_no' value='"+targetStory_no+"'>'");
												actionForm.attr("action",
														"/notice/get").submit();

											});

							var searchForm = $("#searchForm");

							$("#searchForm button").on(
									"click",
									function(e) {

										e.preventDefault();
										console.log("..............click");

										searchForm
												.find("input[name='pageNum']")
												.val(1);
										searchForm.submit();
									});

						});
	</script>
<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>
<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	
</body>
</html>
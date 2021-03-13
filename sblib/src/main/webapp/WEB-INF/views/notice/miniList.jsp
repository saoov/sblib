<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- table -->
	<div class="panel-body">
		 <table width="100%"
			class="table table-striped table-bordered table-hover">
			<tbody>
				<c:forEach items="#{noticeVO }" var="noticeVO">
					<tr class="odd gradeX">
						<td><a class="move"
							href='/notice/get?notice_no=<c:out value="${noticeVO.notice_no}"/>'>
								<c:out value="${noticeVO.notice_title}" />
						</a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${noticeVO.notice_regdate }" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table> 
	</div>
	<!-- table -->
</body>
</html>
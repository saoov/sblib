<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>삼부도서관 : 회원탈퇴</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/";
						    
			})

		})
	</script>
<body>
<div class="container">
	<div class="col-lg-4"></div>		
		<div class="col-lg-4">
		<div class="jumbotron" style="padding-top: 20px;">
			<form action="/member/delete" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디</label>
					<input class="form-control" type="text" id="member_id" name="member_id" value="${userSession.member_id}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label for="member_pw">비밀번호</label>
					<input type="password" class="form-control" id="member_pw" name="member_pw" placeholder="Password" required>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">성명</label>
					<input class="form-control" type="text" id="member_name" name="member_name" value="${userSession.member_name}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-danger" type="submit" id="submit">회원탈퇴</button>
					<a class="btn btn-info px-3" href="/">
					<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기 </a>&emsp;&emsp;
				</div>
			</form>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 일치하지 않습니다.
				</c:if>
			</div>
		</div>
		</div>
	
		</div>
		
</body>
</html>
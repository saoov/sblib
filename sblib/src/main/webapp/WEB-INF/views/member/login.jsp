<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<title>로그인</title>
</head>
<body>
<!-- Cookie가 비어있지 않을 때 checked 속성을 줌 -->
	<c:if test="${not empty cookie.member_check}">
		<c:set value="checked" var="checked"/>
	</c:if>
<div class="container">
<div class="col-lg-4"></div>
			<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px; margin-top: 150px;">
			<div class="logo1" style="padding: 20px 0; margin-bottom: 0px; text-align: center;">
	    		<a href="/"><img src="../resources/images/logo1.png" width="210px" height="170px"></a>
	    	</div>
				<div class="form-group">
					<label class="font-weight-bold text-white" for="inputId">아이디</label>
					<div>
						<input type="text" class="form-control" id="inputId" name="member_id" value="${cookie.member_check.value}" placeholder="아이디">
					</div>
				</div>
				<div class="form-group">
					<label class="font-weight-bold text-white" for="inputPassword">비밀번호</label>
					<div>
						<input type="password" class="form-control" id="inputPassword" name="member_pw" placeholder="비밀번호">
					</div>
				</div>
				<div class="form-group">
					<span class="font-weight-bold text-white bg-dark"
						id="spanLoginCheck"></span>
				</div>
				<div class="form-group">
					<label class="font-weight-bold text-white"> 
						<input type="checkbox" id="remember_us" name="remember_userId" ${checked}> 아이디 기억하기
					</label>
					<%-- <div class="interval_height a_none">
						<a href="${pageContext.request.contextPath}/user/userSearch">&nbsp; 아이디 / 비밀번호 찾기</a>
					</div> --%>
					<div>
						<button id="loginBtn" type="button"	class="btn btn-primary btn-block">로그인</button>
					</div>
				</div>
				<div class="form-group">
					<a class="btn btn-deep-orange btn-block" href="/member/register">회원가입</a>
				</div>
				</div>

			</div>
<div class="col-lg-4"></div>
	</div>
	<script src="../resources/js/jquery.min_1.12.4.js"></script>
	<script type="text/javascript">
	// 로그인 id / pw 확인
	$('#loginBtn').click(function() {
		var id = $('#inputId').val();
		var pw = $('#inputPassword').val();
		var remember_us = $('#remember_us').is(':checked');
			$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/member/login',
			data : {
				member_id : id,
				member_pw : pw,
				remember_memberId : remember_us
				},
				success : function(data) {
					if (data == 0) { //로그인 실패시
						console.log(data);
						$('#spanLoginCheck').text('로그인 정보를 정확히 입력해주세요.');
						$('#spanLoginCheck').css('color', 'red');
					} /*else if (data == -2) { //인증하지 않았다면?
						console.log(data);
						$('#spanLoginCheck').text('이메일 인증을 해주셔야 합니다!');						
					} else if (data == -3) { // 아이디가 사용중이라면?
						console.log(data);
						location.href = '/member/redundant?member_id=' + id + '&member_Pw=' + pw + '&remember_memberId=' + remember_us;						
					} */else if (data == 1){ //로그인 성공시
						console.log(data);
						location.href = '../';
					}
				}
			});
		});
	</script>
</body>
</html>
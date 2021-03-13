<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>회원정보수정</title>
</head>
<body>
<div class="container">
	<div class="col-lg-4"></div>		
		<div class="col-lg-4">
		<div class="jumbotron" style="padding-top: 20px;">
<form action="/member/update" method="post">
			<!-- 아이디 -->
			<div class="form-group">
				<label for="member_id">아이디</label>
					<input type="text" class="form-control" id="member_id" name="member_id" value="${userSession.member_id}" readonly="readonly"/>
				<div class="check_font" id="id_check"></div>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="member_pw">비밀번호</label>
					<input type="password" class="form-control" id="member_pw" name="member_pw" placeholder="Password" required>
				<div class="check_font" id="pw_check"></div>
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group">
				<label for="member_pw2">비밀번호 확인</label>
					<input type="password" class="form-control" id="member_pw2" name="member_pw2" placeholder="Password Confirm" required>
				<div class="check_font" id="pw2_check"></div>
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label for="member_name">이름</label>
					<input type="text" class="form-control" id="member_name" name="member_name" value="${userSession.member_name}" readonly="readonly"/>
				<div class="check_font" id="name_check"></div>
			</div>
			<!-- 생년월일 -->
			<div class="form-group required">
				<label for="member_birth">생년월일</label>
					<input type="text" class="form-control" id="member_birth" name="member_birth" value="${userSession.member_birth}" readonly="readonly"/>
				<div class="check_font" id="birth_check"></div>
			</div>
			<!-- 주소 -->
			<div class="form-group required">
				<label for="member_addr">주소</label>
					<input type="text" class="form-control" id="member_addr" name="member_addr" placeholder="ex) 서울시 영등포구" required>
			</div>
			<!-- 본인확인 이메일 -->
			<div class="form-group">
				<label for="member_email">이메일</label>
					<input type="text" class="form-control" name="member_email" id="member_email" value="${userSession.member_email}" readonly="readonly"/>
					<!-- <input type="text" style="margin-top: 5px;"class="email_form" name="email_confirm" id="email_confirm" placeholder="인증번호를 입력해주세요!" required>
						<button type="button" class="btn btn-outline-danger btn-sm px-3" onclick="confirm_email()">
							<i class="fa fa-envelope"></i>&nbsp;인증
						</button>&nbsp;
						<button type="button" class="btn btn-outline-info btn-sm px-3">
							<i class="fa fa-envelope"></i>&nbsp;확인
						</button>&nbsp; -->
					<div class="check_font" id="email_check"></div>
			</div>
			<!-- 휴대전화 -->
			<div class="form-group">
				<label for="member_tel">휴대전화 ('-' 없이 번호만 입력)</label>
				<input type="text" class="form-control" id="member_tel" name="member_tel" placeholder="Phone Number" required>
				<div class="check_font" id="phone_check"></div>
			</div>
			<div class="reg_button">
				<button type="submit" id="reg_submit" class="btn btn-primary form-control">수정</button><hr>
				<a class="btn btn-danger" href="/member/delete" style="width: 100%">회원탈퇴</a>
			</div>
		</form>
		</div>
		</div>
		</div>
  <script src="../resources/js/jquery.min_1.12.4.js"></script>
  <script>
		
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
	 
		
	// 비밀번호 유효성 검사
	// 1-1 정규식 체크
	$('#member_pw').blur(function() {
		if (pwJ.test($('#member_pw').val())) {
			console.log('true');
			$('#pw_check').text('');
		} else {
			console.log('false');
			$('#pw_check').text('숫자 or 문자로만 4~12자리 입력');
			$('#pw_check').css('color', 'red');
		}
	});
	
	// 1-2 패스워드 일치 확인
	$('#member_pw2').blur(function() {
		if ($('#member_pw').val() != $(this).val()) {
			$('#pw2_check').text('비밀번호가 일치하지 않습니다 :(');
			$('#pw2_check').css('color', 'red');
		} else {
			$('#pw2_check').text('');
		}
	});

	
	// 휴대전화
	$('#member_phone').blur(function(){
		if(phoneJ.test($(this).val())){
			console.log(nameJ.test($(this).val()));
			$("#phone_check").text('');
		} else {
			$('#phone_check').text('휴대폰번호를 확인해주세요 :)');
			$('#phone_check').css('color', 'red');
		}
	});

	
</script>
  

</body>


</html>
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

<title>회원가입</title>
</head>
<body>
<div class="container">
	<div class="col-lg-4"></div>		
		<div class="col-lg-4">
		<div class="jumbotron" style="padding-top: 20px;">
		<form action="/member/register" method="post">

			<!-- 아이디 -->
				<div class="form-group row">
				<label for="member_id">아이디</label>				
					<input type="text" class="form-control" id="member_id" name="member_id" placeholder="ID" required="required">				
				<div class="check_font" id="id_check"></div>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group row">
				<label for="member_pw">비밀번호</label>
					<input type="password" class="form-control" id="member_pw" name="member_pw" placeholder="Password" required="required">
				<div class="check_font" id="pw_check"></div>
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group row">
				<label for="member_pw2">비밀번호 확인</label>
					<input type="password" class="form-control" id="member_pw2" name="member_pw2" placeholder="Password Confirm" required="required">
				<div class="check_font" id="pw2_check"></div>
			</div>
			<!-- 이름 -->
			<div class="form-group row">
				<label for="member_name">이름</label>
					<input type="text" class="form-control" id="member_name" name="member_name" placeholder="Name" required="required">
				<div class="check_font" id="name_check"></div>
			</div>
			<!-- 생년월일 -->
			<div class="form-group row">
				<label for="member_birth">생년월일</label>
					<input type="text" class="form-control" id="member_birth" name="member_birth" placeholder="ex) 19990101" required="required">
				<div class="check_font" id="birth_check"></div>
			</div>
			<!-- 주소 -->
			<div class="form-group row">
				<label for="member_addr">주소</label>
					<input type="text" class="form-control" id="member_addr" name="member_addr" placeholder="ex) 서울시 영등포구" required="required">
			</div>
			<!-- 본인확인 이메일 -->
			<div class="form-group row">
				<label for="member_email">이메일</label>
					<input type="text" class="form-control" name="member_email" id="member_email" placeholder="E-mail" required="required">
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
			<div class="form-group row">
				<label for="member_tel">휴대전화 ('-' 없이 번호만 입력)</label>
				<input type="text" class="form-control" id="member_tel" name="member_tel" placeholder="Phone Number" required="required">
				<div class="check_font" id="phone_check"></div>
			</div>
			<div style="padding-top: 20px;">	
				<input type="submit" value="회원가입" id="reg_submit"class="btn btn-primary form-control"> 
			</div>
			<div class="form-group">
				<input type="reset" class="btn btn-danger" value="지우기" >
				<a class="btn btn-info" href="/">메인화면</a>
			</div>
		</form>
		</div>
		</div>
	
		</div>
  <script src="../resources/js/jquery.min_1.12.4.js"></script>
  <script>
		
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
	 //아이디 유효성 검사(1 = 중복 / 0 != 중복)
	 $("#member_id").blur(function() {

		var member_id = $('#member_id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/member/idCheck?memberId='+ member_id,
			type : 'get',
			
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == '1') {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :(");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(member_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(member_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							console.log("data=1");
							$('#id_check').text("소문자와 숫자 4~12자리만 가능합니다 :(");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
		
	// 비밀번호 유효성 검사
	// 1-1 정규식 체크
	$('#member_pw').blur(function() {
		if (pwJ.test($('#member_pw').val())) {
			console.log('true');
			$('#pw_check').text('');
		} else {
			console.log('false');
			$('#pw_check').text('문자와 숫자 4~12자리만 가능합니다 :(');
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

	// 이름에 특수문자 들어가지 않도록 설정
	$("#member_name").blur(function() {
		if (nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#name_check").text('');
		} else {
			$('#name_check').text('이름을 확인해주세요:)');
			$('#name_check').css('color', 'red');
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

	// 생일 유효성 검사
	var birthJ = false;
	
	// 생년월일	birthJ 유효성 검사
	$('#member_birth').blur(function(){
		var dateStr = $(this).val();		
	    var year = Number(dateStr.substr(0,4)); 
	    var month = Number(dateStr.substr(4,2));
	    var day = Number(dateStr.substr(6,2));
	    var today = new Date(); // 날짜 변수 선언
	    var yearNow = today.getFullYear();
		
	    if (dateStr.length <=8) {
			
		    if (year < 1900 || year > yearNow){
		    	
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red');
		    	
		    }else if (month < 1 || month > 12) {
		    		
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
		    
		    }else if (day < 1 || day > 31) {
		    	
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
		    	
		    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		    	 
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
		    	 
		    }else if (month == 2) {
		    	 
		       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		       	
		     	if (day>29 || (day==29 && !isleap)) {
		     		
		     		$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
		    	
				}else{
					$('#birth_check').text('');
					birthJ = true;
				}//end of if (day>29 || (day==29 && !isleap))
		     	
		    }else{
		    	
		    	$('#birth_check').text(''); 
				birthJ = true;
			}//end of if
			
			}else{
				//1.입력된 생년월일이 8자 초과할때 :  auth:false
				$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red');  
			}
		}); //End of method 

</script>
  

</body>


</html>
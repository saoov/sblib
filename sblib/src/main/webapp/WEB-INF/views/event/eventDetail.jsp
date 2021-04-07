<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>삼부도서관 : 도서관일정</title>
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
				<li><a href="/event/calendar">도서관일정</a></li>
				<li><a href="/event/eventBoard">독서문화행사</a></li>
			</ul>
			<div class="lastchild"></div>
		</div>
		
		<div id='layer'>
			<h3>독서문화행사</h3>
			<div style="width:100%; height:20px;">
				<ul>
					<li>프로그램　>　</li>
					<li>독서문화행사</li>
				</ul>
			</div>
			<hr style="margin-top:30px;">
			<table class="table table-bordered">
					<tr>
						<th scope="col" width="15%">행사명</th>
						<td width="85%">
							${event.event_title }
						</td>
					</tr>
					<tr>
						<th scope="col">기간</th>
						<td>
							${event.event_start }　~　${event.event_end }
						</td>
					</tr>
					<tr>
						<th scope="col">내용</th>
						<td>
							${event.event_info }
						</td>
					</tr>
				</table>
				<form id='actionForm' action="/event/eventBoard" method="get">
					<input type="hidden" name="pageNum" value="${page.pageNum }">
					<input type="hidden" name="amount" value="${page.amount }">
					<input type="hidden" name="event_no" value="${event.event_no}"> 
					<input type="hidden" name="type" value="${page.type}"> 
					<input type="hidden" name="keyword" value="${page.keyword}">
				</form>

				<button type="button" id="listBtn" class="btn btn-secondary" onclick=>목록으로</button>
				<c:choose>
					<c:when test= "${userSession.member_name eq '관리자'}">
						<button type="button" id="modifyBtn" class="btn btn-warning">수정</button>
						<button type="button" id="deleteBtn" class="btn btn-danger">삭제</button>
					</c:when>
				</c:choose>
				
				<!-- 댓글 -->
				<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
					<form:form name="form" id="form" role="form" modelAttribute="replyVO" method="post"> <!-- 모델에 담았던 replyVO 가져오기 -->
						<form:hidden path="event_no" id="event_no" /> <!-- path의 값이 모델에 담긴 데이터의 내용 -->
						<div class="row">
							<div class="col-sm-10">
								<form:textarea path="reply" id="reply" class="form-control"	rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
							</div>
							<div class="col-sm-2">
							<c:choose>
								<c:when test="${userSession.member_name == null}">
									<form:input path="replyer" class="form-control" id="replyer" placeholder="작성자"></form:input>
								</c:when>
								<c:otherwise>
									<form:input path="replyer" class="form-control" id="replyer" placeholder="${userSession.member_name }"></form:input>
								</c:otherwise>
							</c:choose>
								<button type="button" class="btn btn-sm btn-primary" id="regBtn" style="width: 100%; margin-top: 10px">등 록</button>
							</div>
						</div>
					</form:form>
				</div>
				<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
					<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
					<div id="replyList"></div> <!-- 댓글리스트가 나올 부분 -->
				</div>
		</div>
		
</div>
<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>
<script>
	var actionForm = $("#actionForm");
	
	$("#listBtn").click(function(e) {
		e.preventDefault();
		actionForm.find("input[name='event_no']").remove();
		actionForm.submit();
	});

	$("#modifyBtn").click(function(e) {
		e.preventDefault();
		actionForm.attr("action", "/event/eventModify");
		actionForm.submit();
	});
	$("#deleteBtn").click(function(e) {
		e.preventDefault();
		actionForm.attr("action", "/event/eventDelete");
		actionForm.attr("method", "post");
		actionForm.submit();
	});
</script>


<!-- AJAX 시작 -->
<script>
function displayTime(timeValue){
	var today = new Date();
	var gap = today.getTime() - timeValue;
	var dateObj = new Date(timeValue);
	var str = "";

	if (gap < (1000 * 60 * 60 * 24)) { //24시간이 지나지 않은 경우 //1000은 밀리세컨드 때문

		var hh = dateObj.getHours(); //각 시간 형태로 변환
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();

		return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
				':', (ss > 9 ? '' : '0') + ss ].join(''); // 7이 아닌 07로 표시하기 위함

	} else { //24시간이 지난 후
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
		var dd = dateObj.getDate();

		return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
				(dd > 9 ? '' : '0') + dd ].join('');
	}
}


$(document).ready(function(){ //페이지 로딩시 showReplyList() 함수 실행+
	showReplyList();
});

function showReplyList(){ //댓글 목록 가져오기

	var url = "/replies/getReplyList";
	var paramData = {"event_no" : "${event.event_no}"}; //json 문자열 형태로 paramData에 저장

	$.ajax({
        type: 'POST',
        url: url,
        data: paramData,
        dataType: 'json',
        success: function(result) {
        	var htmls = "";
			if(result.length < 1){
				htmls.push("등록된 댓글이 없습니다.");
			} 
			else {
               $(result).each(function(){ //jquery 반복문인 each() 사용하여 댓글 데이터 출력
                htmls += '<div class="media text-muted pt-3" id="reply_no' + this.reply_no + '">'; //id값인 reply_no에 댓글번호를 붙여 고유 id 생성
                
/*                 htmls += 	'<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
                htmls += 		'<title>Placeholder</title>';
                htmls += 		'<rect width="100%" height="100%" fill="#007bff"></rect>';
                htmls += 		'<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
                htmls += 	'</svg>'; */
                
                htmls += 	'<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
                htmls += 	'<span class="d-block">';
                htmls += 		'<strong class="text-gray-dark">' + this.replyer + '</strong>';
                htmls += 		'<span style="padding-left: 7px; font-size: 9pt">';
                htmls += 			'<a href="javascript:void(0)" onclick="fn_editReply(' + this.reply_no + ', \'' + this.replyer + '\', \'' + this.reply + '\' )" style="padding-right:5px">수정</a>';
                htmls += 			'<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.reply_no + ')" >삭제</a>';
                htmls += 			'<strong style="position:absolute; right:15px">'+displayTime(this.updateDate)+'</strong>';
                htmls += 		'</span>';
                htmls += 	'</span>';
                htmls += 	'<strong style="color:black">'+this.reply+'</strong>';
                htmls += 	'</p>';
                htmls += '</div>';
           		});	//each end
			}
			$("#replyList").html(htmls);
        }	   // Ajax success end
	});	// Ajax end
}

$("#regBtn").on("click", function(){ //댓글 작성

	var url = "/replies/saveReply";
	var reply = $("#reply").val();
	var replyer = "${userSession.member_name }"
	var headers = {"Content-Type":"application/json", "X-HTTP-Method-Overreply_noe":"POST"};
	var paramData = JSON.stringify({"reply":reply
								, "replyer":replyer
								, "event_no":"${event.event_no}"
	});
	console.log("replyer : "+replyer);
	
	if(replyer == ""){
		alert("로그인시 작성 가능합니다");
	}
	else{
		$.ajax({
			url: url
			, headers : headers 
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showReplyList(); //성공시 댓글 list 함수실행
				$('#reply').val(''); //input 값 초기화
				$('#replyer').val('');
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
});

function fn_editReply(reply_no, replyer, reply){ //댓글 수정 폼
	console.log("reply_no : "+reply_no);
	var htmls = "";
	
	htmls += '<div class="media text-muted pt-3" id="reply_no' + reply_no + '">';
	htmls += 	'<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	htmls += 		'<title>Placeholder</title>';
	htmls += 		'<rect width="100%" height="100%" fill="#007bff"></rect>';
	htmls += 		'<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	htmls += 	'</svg>';
	htmls += 	'<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	htmls += 	'<span class="d-block">';
	htmls += 		'<strong class="text-gray-dark">' + replyer + '</strong>';
	htmls += 		'<span style="padding-left: 7px; font-size: 9pt">';
	htmls += 			'<a href="javascript:void(0)" onclick="fn_updateReply(' + reply_no + ', \'' + replyer + '\')" style="padding-right:5px">저장</a>';
	htmls += 			'<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
	htmls += 		'</span>';
	htmls += 	'</span>';		
	htmls += 	'<textarea name="editConent" id="editContent" class="form-control" rows="3">';
	htmls += 	reply;
	htmls += 	'</textarea>';
	htmls += 	'</p>';
	htmls += '</div>';
	$('#reply_no' + reply_no).replaceWith(htmls); //해당 div 내용을 htmls로 대체한다.
	
	var len = $('#reply_no' + reply_no + ' #editContent').val().length; 
	$('#reply_no' + reply_no + ' #editContent').focus(); //수정될 내용에 커서 만들기
	$('#reply_no' + reply_no + ' #editContent')[0].setSelectionRange(len, len); //커서가 맨 뒤로 이동
}

function fn_updateReply(reply_no, replyer){ //댓글 수정
	var url = "/replies/updateReply";
	var headers = {"Content-Type" : "application/json"
		 		 , "X-HTTP-Method-Override" : "POST"};
	
	var replyEditContent = $('#editContent').val();
	var paramData = JSON.stringify({"reply": replyEditContent
								  , "reply_no": reply_no});
	
	$.ajax({
		url: url
		, headers : headers
		, data : paramData
		, type : 'POST'
		, dataType : 'text'
		, success: function(result){
            console.log(result);
			showReplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
}

function fn_deleteReply(reply_no){ //댓글 삭제
	var url = "/replies/deleteReply";
	var paramData =  {"reply_no" : reply_no};
	
	$.ajax({
		url: url
		, data : paramData
		, type : 'POST'
		, dataType : 'json'
		, success: function(result){
            console.log(result);
			showReplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
}
</script>

<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
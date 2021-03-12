<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
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
				<li><a href="#">도서관일정</a></li>
				<li><a href="#">독서문화행사</a></li>
			</ul>
			<div class="lastchild"></div>
		</div>

		<div id='layer'>
			<h3>도서관 일정</h3>
			<div style="width:100%; height:20px;">
				<ul>
					<li>프로그램　>　</li>
					<li>도서관 일정</li>
				</ul>
			</div>
			<hr style="margin-top:30px;">
			<form action="/event/eventModify" method="post">
				<table class="table table-bordered">
					<tr>
						<th scope="col" width="15%">행사명</th>
						<td width="85%"><input type="text" class="form-control" name="event_title" value='<c:out value="${event.event_title}"/>'>
						</td>
					</tr>
					<tr>
						<th scope="col">기간</th>
						<td>
							<input class="form-control" id="startDate" type="text" name="event_start" id="startDate" style="width: 120px; float: left;">
							<p style="float: left; position: relative; top: 8px;">~</p> 
							<input class="form-control" id="endDate" type="text" name="event_end" id="endDate" style="width: 120px;">
						</td>
					</tr>
					<tr>
						<th scope="col">내용</th>
						<td>
							<textarea class="summernote" id="exampleFormControlTextarea1" name="event_info" rows="10">${event.event_info }</textarea>
						</td>
					</tr>
				</table>
				<div style="width:100%; height: 60px">
					<button type="submit" class="btn btn-primary" style="position: absolute; right: 0">등록</button>
				</div>
				<input type="hidden" name="pageNum" value="${page.pageNum }">
                <input type="hidden" name="amount" value="${page.amount }">
                <input type="hidden" name="event_no" value="${event.event_no }">
			</form>
		</div>
	</div>



<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>
<!-- datepicker -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
var jqdate = $.noConflict(true);

$(function() {
	jqdate.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		showOtherMonths : true,
		showMonthAfterYear : true,
		changeYear : true,
		changeMonth : true,          
       yearSuffix: "년",
      	monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
      	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       dayNamesMin: ['일','월','화','수','목','금','토'],
       dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']	
	});
	jqdate("#startDate").datepicker();
	jqdate("#endDate").datepicker();
	
	jqdate("#startDate").datepicker('setDate', 'today');
	jqdate("#endDate").datepicker('setDate', 'today');
});

$('.summernote').summernote({
	// 에디터 높이
	height: 450,
	// 에디터 한글 설정
	lang: "ko-KR",
	// 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
	focus : true,
	// 추가한 글꼴
	fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	 // 추가한 폰트사이즈
	fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	toolbar: [
	  // 글꼴 설정
	  ['fontname', ['fontname']],
	  // 글자 크기 설정
	  ['fontsize', ['fontsize']],
	  // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	  ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	  // 글자색
	  ['color', ['forecolor','color']],
	  // 표만들기
	  ['table', ['table']],
	  // 글머리 기호, 번호매기기, 문단정렬
	  ['para', ['ul', 'ol', 'paragraph']],
	  // 줄간격
	  ['height', ['height']],
	  // 그림첨부, 링크만들기, 동영상첨부
	  ['insert',['picture','link','video']],
	  // 코드보기, 확대해서보기, 도움말
	  ['view', ['codeview','fullscreen', 'help']]
	], 
	callbacks : { 
        onImageUpload : function(files, editor, welEditable) {
        // 파일 업로드(다중업로드를 위해 반복문 사용)
			for (var i = files.length - 1; i >= 0; i--) {
		      	uploadSummernoteImageFile(files[i], this);
		    }
	    }
	}
});
function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/event/uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			$(el).summernote('editor.insertImage', data.url);
		} 
	});
}
</script>

<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
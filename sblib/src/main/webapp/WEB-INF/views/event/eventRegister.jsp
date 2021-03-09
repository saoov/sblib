<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<style>
	#body{
	position:relative;
	margin:0 auto;
	width: 1200px;
	margin-top: 50px;
	margin-bottom: 10px;
	height: 900px;
	}
	#sidemenu {
		width: 18%;
		background-color: white;
		float:left;
		margin-right: 4%;
	}
	
	#sidemenu ul{
		margin : 0;
		padding : 0;
		background-color: gray;
		border-radius: 10px;
		
	}
	#sidemenu ul li{
		list-style: none;
		width : 100%;
		height : 50px;
		line-height: 3.5;
        text-align: center;
        border-bottom: 0.7px solid white;
	}
	#sidemenu ul li a{
		display : block;
		color : white;
	}
	#sidemenu ul li a:hover{
		background-color: #424242;
		text-decoration: none;
	}
	#sidemenu .title{
		width: 100%;
	}
	.title h1{
		text-align: center;
		margin-top: 10px;
	}
	#jun{
		position: relative;
		width:78%;
		height:100%;
		float: left;
	}
	
  </style>
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
				<h1>프로그램</h1>
			</div>
			<hr>
			<ul>
				<li><a href="#">도서관일정</a></li>
				<li><a href="#">독서문화행사</a></li>
			</ul>
		</div>

		<div id='jun'>
			<form action="/event/eventRegister" method="post">
				<table class="table table-bordered">
					<tr>
						<th scope="col" width="15%">행사명</th>
						<td width="85%"><input type="text" class="form-control" name="event_title">
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
							<textarea class="summernote" id="exampleFormControlTextarea1" name="event_info" rows="10"></textarea>
						</td>
					</tr>
				</table>
				<button type="submit" class="btn btn-primary" style="position: absolute; right: 0">등록</button>
			</form>
		</div>
	</div>



<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>삼부도서관 : 책이야기</title>
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
      <h3>책이야기</h3>
      <div style="width:100%; height:20px;">
      <ul>
         <li>열린공간　>　</li>
         <li>책이야기</li>
      </ul>
      </div>
        <hr style="margin-top:30px;">
 
 
                        <div class="panel-body">
                        <form> 
                             <input type="hidden" name="pageNum" value="${page.pageNum }">
                             <input type="hidden" name="amount" value="${page.amount }">
                                                                     
                             <div class="form-group">
                                 <label>글번호</label>
                                 <input class="form-control" name="story_no" readonly="readonly" value='<c:out value="${bookstory.story_no}"/>'> 
                                 <!-- input쓸때 name속성(=파라미터로 수집되는 이름) 명심해야함  -->
                             </div>  
                            
                             <div class="form-group">
                                 <label>제목</label>
                                 <input class="form-control" name="story_title" value='<c:out value="${bookstory.story_title}"/>'> 
                                 <!-- input쓸때 name속성(=파라미터로 수집되는 이름) 명심해야함  -->
                             </div>
                             
                             <div class="form-group">
                                 <label>내용</label>
                                 <textarea class="summernote" id="exampleFormControlTextarea1" name="story_content" rows="10">${bookstory.story_content}</textarea> 
                             </div>
                             
                             <div class="form-group">
                                 <label>작성자</label>
                                 <input class="form-control" name="story_author" value='<c:out value="${bookstory.story_author}"/>'>
                             </div>
                             
                             <div class="form-group">
                                 <label>조회수</label>
                                 <input class="form-control" name="story_readcount" value='<c:out value="${bookstory.story_readcount}"/>'>
                             </div>
                             
                             <button class="btn btn-default" data-oper='modify'>수정</button>
                             <button class="btn btn-danger" data-oper='remove'>삭제</button>
                             <button class="btn btn-info" data-oper='list'>목록</button>
                        </form>    
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->

<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>
<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
            
<script>

 $(document).ready(function(){
	 
	var formObj = $("form"); 
	
	$('.btn').click(function(e){
		
		e.preventDefault(); //이벤트 발생시 기본 동작(링크나 from에서 자동 submit이 일어나는것)을 막음
		
		var operation = $(this).data("oper");
		
		console.log(operation); //버튼이 눌렸는지 확인
		
		if(operation === 'list'){   //list버튼 눌렀을때
			self.location = "/bookstory/list";
		}else if(operation === 'remove'){   //remove버튼 눌렀을때
			formObj.attr("action","/bookstory/remove")
			.attr("method", "post");
		    formObj.submit(); //실제로 삭제가 됨
		    
		}else if(operation === 'modify'){   //modify버튼 눌렀을때
			formObj.attr("action","/bookstory/modify")
			.attr("method", "post");
		    formObj.submit(); 
		}
	})
	
 })
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
</body>
</html>
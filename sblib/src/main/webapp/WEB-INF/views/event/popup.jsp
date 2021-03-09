<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 class = "zTree-h1"> 일정 추가 </h1>
<hr>
<form id = "scheduleData">
		<input class = "subject" id = "subject" type = "text" name = "holiday_title" placeholder="휴관 사유를 입력해주세요">
		<h3 class = "zTree-h3"> 시작 </h3>
		<input class = "date" id = "startDate" type = "text" name = "holiday_start">
		<h3 class = "zTree-h3"> 종료 </h3>
		<input class = "date" id = "endDate" type = "text" name = "holiday_end">
</form>
<button class = "ok-button" type= "button" onclick="click_ok();">확인</button>
<script>
$(function() {
	$.datepicker.setDefaults({
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
	$("#startDate").datepicker();
	$("#endDate").datepicker();
	
	$("#startDate").datepicker('setDate', 'today');
	$("#endDate").datepicker('setDate', 'today');
});

//여러 개 데이터를 전송시킬 때 jquery의 serializeObject를 이용한다.
$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
    	var name = $.trim(this.name),
    		value = $.trim(this.value);
    	
        if (o[name]) {
            if (!o[name].push) {
                o[name] = [o[name]];
            }
            o[name].push(value || '');
        } else {
            o[name] = value || '';
        }
    });
    return o;
};
function click_ok(){

	var scheduleData = JSON.stringify($('form#scheduleData').serializeObject());
	
	$.ajax({
		data : scheduleData,
		url : "/event/addSchedule",
		type : "POST",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			opener.parent.location.reload();
			window.close();
		}
	});
};
</script>
</body>
</html>
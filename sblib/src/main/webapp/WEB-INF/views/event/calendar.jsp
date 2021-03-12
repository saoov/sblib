<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>

<style>
.add-button{
   position: absolute;
   top: 1px;
   right:200px;
   background:#2c3e50;
   border:0;
   color:white;
   height:40px;
   border-radius:3px;
   width:90px;
}
#calendar{
	position:relative;
	width: 100%;
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
				<h2>프로그램</h2>
			</div>
			<ul>
				<li><a href="#">도서관일정</a></li>
				<li><a href="#">독서문화행사</a></li>
			</ul>
			<div class="lastchild"></div>
		</div>
		<div id="layer">
			<h3>도서관 일정</h3>
			<div style="width:100%; height:20px;">
				<ul>
					<li>프로그램　>　</li>
					<li>도서관 일정</li>
				</ul>
			</div>
			<hr style="margin-top:30px;">
			<div id='calendar'>
				<button class="add-button" type="button" onclick="click_add();">휴관일 등록</button>
			</div>
		</div>
	</div>

 <!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>
<script>
getRandomColor = function(_isAlpha) {
	  let r = getRand(0, 255),
	  g = getRand(0, 255),
	  b = getRand(0, 255),
	  a = getRand(0, 10) / 10;

	  let rgb = _isAlpha ? 'rgba' : 'rgb';
	  rgb += '(' + r + ',' + g + ',' + b;
	  rgb += _isAlpha ? ',' + a + ')' : ')';

	  return rgb;

	  // Return random number from in to max
	  function getRand(min, max) {
	    if (min >= max) return false;
	    return ~~(Math.random() * (max - min + 1)) + min;
	  };
	};
	
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	initialView: 'dayGridMonth',
        headerToolbar: {
        	left: 'title',
          center: ''
        },
        events: [
        	<c:forEach items="${list}" var="event">
            {
              title: "${event.event_title}",
              start: "${event.event_start}",
              end: "${event.event_end}",
              color: getRandomColor()
            },
            </c:forEach>
            <c:forEach items="${holiday}" var="holiday">
            {
              title: "${holiday.holiday_title}",
              start: "${holiday.holiday_start}",
              end: "${holiday.holiday_end}",
              color: "#e3f2fd",
              backgroundColor: "#0d47a1"
            },
            </c:forEach>
            {
            	title: "gg",
            	start: "2021-03-24",
            	end: "2021-03-27T14:30:00"
            }

          ]
    });
    calendar.render();
  });
</script>
<script>
function click_add() {
	var url = "popup";
	var name = "schedulePopup";
	var option = "width = 300, height = 400 left = 100, top=50,location=no";
	window.open(url,name,option)
};
</script>

<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
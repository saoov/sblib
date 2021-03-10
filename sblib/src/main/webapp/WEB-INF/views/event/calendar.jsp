<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>

<style>
    html, body {
      margin: 0;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    }

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
	
	#body{
	position:relative;
	margin:0 auto;
	width: 1200px;
	margin-top: 50px;
	margin-bottom: 10px;
	}
	#sidemenu {
		width: 18%;
		background-color: white;
		float:left;
		margin-right: 4%;
	}
	#calendar{
		position:relative;
		width: 78%;
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
		<div id='calendar'>
			<button class="add-button" type="button" onclick="click_add();">일정추가</button>
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
        	left: '',
          center: 'title'
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
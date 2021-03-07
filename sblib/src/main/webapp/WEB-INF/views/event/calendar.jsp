<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	initialView: 'dayGridMonth',
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        events: [
            {
              title: 'All Day Event',
              start: '2021-02-01'
            },
            {
              title: 'Long Event',
              start: '2021-02-07',
              end: '2021-02-10'
            },
            {
              groupId: '999',
              title: 'Repeating Event',
              start: '2021-02-09T16:00:00'
            },
            {
              groupId: '999',
              title: 'Repeating Event',
              start: '2021-02-16T16:00:00'
            },
            {
              title: 'Conference',
              start: '2021-02-11',
              end: '2021-02-13'
            },
            {
              title: 'Meeting',
              start: '2021-02-12T10:30:00',
              end: '2021-02-12T12:30:00'
            },
            {
              title: 'Lunch',
              start: '2021-02-12T12:00:00'
            },
            {
              title: 'Meeting',
              start: '2021-02-12T14:30:00'
            },
            {
              title: '생일빠뤼',
              start: '2021-02-13T07:00:00'
            },
            {
              title: 'Click for Google',
              url: 'http://google.com/',
              start: '2021-02-28'
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
	var option = "width = 300, height = 500 left = 100, top=50,location=no";
	window.open(url,name,option)
};
</script>

<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
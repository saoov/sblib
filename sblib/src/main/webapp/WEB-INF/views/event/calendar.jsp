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

    #calendar {
      position:relative;
      max-width: 1100px;
      margin: 40px auto;
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

  </style>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href='/resources/fullcalendar-scheduler/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar-scheduler/main.js'></script>
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
<title>Insert title here</title>
</head>
<body>

<!-- header -->
 <tiles:insertAttribute name="header"></tiles:insertAttribute>
<link href="../resources/css/main.css" rel="stylesheet">
    
 <div id='calendar'>
 <button class = "add-button" type = "button" onclick="click_add();">일정 추가</button>
 </div>
 
 <!-- footer -->
 <tiles:insertAttribute name="footer"></tiles:insertAttribute>
 
 <script src="../resources/js/main.js"></script>
 <script>
 function click_add() {
		var url = "popup";
		var name = "schedulePopup";
		var option = "width = 300, height = 500 left = 100, top=50,location=no";
		window.open(url,name,option)
	};
 </script>



</body>
</html>
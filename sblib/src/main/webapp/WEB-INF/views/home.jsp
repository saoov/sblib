<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>삼부도서관</title>
</head>
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>
<link rel="stylesheet" href="resources/css/slick.css">
<style>
	#calendar{
		position:relateve;
		width:100%;
		height:100%;
	}
	.fc-daygrid-day-number{
		font-size: 10px;
	}
	.fc-col-header-cell-cushion {
		font-size:10px;
	}
	.fc-event-title-container{
		display:none;
	}
	.fc-event-main-frame{
		height:1px;
	}
	.fc .fc-daygrid-body-unbalanced .fc-daygrid-day-events {
      position: relative;
      min-height: 11px;
	}
	.fc .fc-daygrid-day-number{
		padding:0;
	}
	.holidays{
		width: 100%;
		overflow:hidden;
	}
	.holidays ul li{
		list-style-type: none;
		float: left;
		width:45px; height:45px;
		background-color: #f8bbd0;
		border: 2px solid #f06292;
		border-radius: 50%;
		text-align: center;
		margin: 4%;
	}
	.holidays ul li:nth-child(2n) {
		background-color: #ce93d8;
		border: 2px solid #ab47bc;
	}
	.holidays img{
		position:absolute;
		width:100%;
		bottom:0;
		left:0;
		opacity: 0.5;
	}
	.todayFrame{
		width:100%;
		height:17%;
		text-align: center;
	}
</style>
<body>    

<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>

<!-- home -->
    <section id="banner">
        <div class="frame">
        <form action="/search/searchResult" method="get">
            <article class="searchbar">
                <div class="bar" style="width: 100%; height: 100%;">
                        <input id="bar" type="text" name="keyword" placeholder="도서 이름을 입력해주세요" style="font-size: 25px">
                        <input type="hidden" name="type" value="T">
                        <button id="searchbtn"></button>
                </div>
            </article>
        </form>
        </div>
    </section>
    
    <!-- content1 수정(eunbi) -->
    <section id="content1">
        <article class="article2">
            <div class="box1">
                <p style="text-align: center; margin-top: 10px;">공지사항</p>
                <a class="notice" href="/notice/list"><img src="resources/images/plus.png" style="position: absolute; width: 30px; height: 30px; right: 10px; top: 10px"></a>
                <hr style="margin-left: 20px; margin-right: 20px;">
                <div class="noticeContent">
                
                <div class="panel-body">
					 
				</div>
                </div>
            </div>
            
            <!-- 이미지 슬라이드 시작 -->
            <div class="box2">                        
				<div class="slider">
					<div class="slider-box"><figure>
			     		<img src="resources/images/banner1.png" alt="이미지1">
					</figure></div>
					<div class="slider-box"><figure>
                        <img src="resources/images/banner2.png" alt="이미지2">
                    </figure></div>
			        <div class="slider-box"><figure>
			            <img src="resources/images/banner3.png" alt="이미지3">
		            </figure></div>
				</div>			
            </div>
            <!--//이미지 슬라이드 끝 -->
            
            <div class="box3">
                <p style="text-align: center; margin-top: 10px;">일정 안내</p>
                <hr style="margin-left: 20px; margin-right: 20px; margin-bottom:0;">
                <div class="calendar">
                    <div id='calendar'>
                    </div>
                </div>
            </div>
        </article>
    </section>
    <!-- content1 수정(eunbi) -->
    
    <!-- content3 자주찾는 서비스(eunbi) -->
    <section id="content3">
        <article class="article1">
            <div class="bar_icon">
              <ul>
                <li>
                <a href="#"><i class="fas fa-book-open" aria-hidden="true"></i></a>
                <ul><li>책이야기</li></ul>
                </li>
                <li>
                <a href="/info/libStatus"><i class="fas fa-inbox" aria-hidden="true"></i></a>
                <ul><li>자료현황</li></ul>
                </li>
                <li>
                <a href="/info/userGuide"><i class="far fa-file-alt" aria-hidden="true"></i></a>
                <ul><li>이용안내</li></ul>
                </li>
                <li>
                <a href="#"><i class="far fa-comment-dots" aria-hidden="true"></i></a>
                <ul><li>묻고답하기</li></ul>
                </li>
                <li>
                <a href="/info/comingWay"><i class="fas fa-map-marker-alt" aria-hidden="true"></i></a>
                <ul><li>오시는길</li></ul>
                </li>
              </ul>
           </div>
         </article>
    </section>
    <!-- content3 자주찾는 서비스(eunbi) -->
   
    <section id="content2">
        <article class="article1">
            <div class="box1">
                <p style="text-align: center; margin-top: 10px;">휴관 안내</p>
                <hr style="margin-left: 20px; margin-right: 20px; margin-bottom: 0px;">
                <div class="holidays">
                    <c:set var="now" value="<%=new java.util.Date() %>"/>
                    <c:set var="today"><fmt:formatDate value="${now }" pattern="[ yyyy년 MM월 dd일 ]"/></c:set>
                    <c:set var="month"><fmt:formatDate value="${now }" pattern="MM"/></c:set>
                   	<div class="todayFrame">
                   		<h5><c:out value="${today }"/></h5>
                   	</div>
                    <ul>
                    	<c:forEach items="${holiday }" var="holiday">
                    		<fmt:parseDate value="${holiday.holiday_start }" var="holidayDate" pattern="yyyy-MM-dd"/>
                    		<c:set var="holMonth"><fmt:formatDate value="${holidayDate }" pattern="MM"/></c:set>
                    		<c:if test="${month eq holMonth }">
                    			<li>
                    				<h2><fmt:formatDate value="${holidayDate }" pattern="dd"/></h2>
                    			</li>
                    		</c:if>
                    	</c:forEach>
                    </ul>
                    <img src="resources/images/stackedbooks2.png">
                </div>
            </div>
            <div class="box2">
                <p style="text-align: center; margin-top: 10px;">이달의 추천도서</p>
                <a class="addbooks" href="#"><img src="resources/images/plus.png" style="position: absolute; width: 30px; height: 30px; right: 10px; top: 10px"></a>
                <hr style="margin-left: 20px; margin-right: 20px;">
                <ul>
                    <li>
                        <a href="#"><img src="resources/images/logo.png"></a>
                        <ul>
                            <li><a href="#">책제목</a></li>
                            <li>지은이</li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><img src="resources/images/logo.png"></a>
                        <ul>
                            <li><a href="#">책제목</a></li>
                            <li>지은이</li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><img src="resources/images/logo.png"></a>
                        <ul>
                            <li><a href="#">책제목</a></li>
                            <li>지은이</li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><img src="resources/images/logo.png"></a>
                        <ul>
                            <li><a href="#">책제목</a></li>
                            <li>지은이</li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><img src="resources/images/logo.png"></a>
                        <ul>
                            <li><a href="#">책제목</a></li>
                            <li>지은이</li>
                        </ul>
                    </li>
                </ul>
            </div>
        </article>
    </section>



<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>
<script>
// var jqdate = $.noConflict(true);
$(".slider").slick({
	dots: true,
	autoplay: true,
	autoplaySpeed: 3000,
	arrows: false,
	responsive: [
	    {
		    breakpoint: 768,
		    settings: {
		        autoplay: false,
	      	}
	    }
	]
}); 

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
    	headerToolbar:false,
    	events:[
        	<c:forEach items="${list}" var="event">
            {
              start: "${event.event_start}",
              end: "${event.event_end}",
              color: getRandomColor()
            },
            </c:forEach>
            <c:forEach items="${holiday}" var="holiday">
            {
              start: "${holiday.holiday_start}",
              end: "${holiday.holiday_end}",
              color: "#e3f2fd",
              backgroundColor: "#0d47a1"
            },
            </c:forEach>
    	]
    });
    calendar.render();
  });
 
</script>
<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
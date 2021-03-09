<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>
<link rel="stylesheet" href="resources/css/slick.css">
<body>    

<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>

<!-- home -->
    <section id="banner">
        <div class="frame">
            <article class="searchbar">
                <div class="bar" style="width: 100%; height: 100%;">
                    <action form="" method="get">
                        <input id="bar" type="text" name="search" placeholder="도서 이름을 입력해주세요" style="font-size: 25px">
                        <button id="searchbtn"></button>
                    </action>
                </div>
            </article>
            <article class="quick">퀵메뉴</article>
        </div>
    </section>
    
    <!-- content1 수정(eunbi) -->
    <section id="content1">
        <article class="article2">
            <div class="box1">
                <p style="text-align: center; margin-top: 10px;">공지사항</p>
                <a class="notice" href="#"><img src="resources/images/plus.png" style="position: absolute; width: 30px; height: 30px; right: 10px; top: 10px"></a>
                <hr style="margin-left: 20px; margin-right: 20px;">
                <div class="noticeContent">
                <ul>
                <li class="noticeTitle1"><a href=""><span>title1</span></a></li>
                <li class="noticeTitle2"><a href=""><span>title2</span></a></li>
                <li class="noticeTitle3"><a href=""><span>title3</span></a></li>
                </ul>
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
                <hr style="margin-left: 20px; margin-right: 20px;">
                <div class="calendar">
                    캘린더로 일정안내 
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
                <a href="#"><i class="fas fa-inbox" aria-hidden="true"></i></a>
                <ul><li>자료현황</li></ul>
                </li>
                <li>
                <a href="#"><i class="far fa-file-alt" aria-hidden="true"></i></a>
                <ul><li>이용안내</li></ul>
                </li>
                <li>
                <a href="#"><i class="far fa-comment-dots" aria-hidden="true"></i></a>
                <ul><li>묻고답하기</li></ul>
                </li>
                <li>
                <a href="#"><i class="fas fa-map-marker-alt" aria-hidden="true"></i></a>
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
                <a class="schedule" href="#"><img src="resources/images/plus.png" style="position: absolute; width: 30px; height: 30px; right: 10px; top: 10px"></a>
                <hr style="margin-left: 20px; margin-right: 20px;">
                <div class="holidays">
                    당월의 휴일을 달력에서 찾아서 보여주는 곳입니다. 어떻게 찾을지는 지금부터 생각해봅시다. 플러스 버튼 클릭하면 행사일정 페이지로 가서 달력을 보여줍니다.
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
var jqdate = $.noConflict(true);
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

</script>
<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
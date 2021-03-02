<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/slick.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/f09348b148.js" crossorigin="anonymous"></script>

    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #header {
            position: relative;
            width: 1200px;
            margin: 0 auto;
        }

        .toplink {
            position: absolute;
            width: 150px;
            height: 25px;
            right: 0px;
            margin-top: 16px;
        }
        .toggler{
            display: none;
            width: 1200px;
            margin: 0 auto;
        }
        .toplink ul{
            list-style-type: none;
            font-size: 18px;
            
        }
        .toplink ul li{
            float: left;
        }
        .toplink ul li a{
            color: #564A3D;
            font-weight: bold;
        }

        #menusection {
            width: 100%;
            background-color: #564A3D;
        }

        .menus {
            width: 1200px;
            margin: 0 auto;
        }
        .menus label{
            margin: 0;
            padding-top: 1%;
            display: block; 
            height: ;
            background-color: red;
            text-align:center;
            color: white;
            height: 60px;
            font-size: 30px;
        }
        .menus label, #toggle{
            display: none;
        }

        .menus ul {
            padding: 0;
            margin: 0;
            height: 60px;
        }
        .menus ul li {
            float: left;
            list-style: none;
            line-height: 3.5;
            text-align: center;
            background-color: #564A3D;
            width: 20%;
            height: 60px;
        }

        .menus a {
            height: 100%;
            display: block;
            color: white;
        }

        /*아래는 메뉴 영역을 구분하기 위한 옵션입니다.*/
        .menus ul li:hover {
            background-color: #443B30;
            text-decoration-line: none;
        }

        .menus ul li a:hover {
            text-decoration: none;
        }

        .menus ul ul {
            display: none;
            
        }

        .menus ul ul li {
            position: relative;
            background-color: #35291C;
            width: 100%;
            height: 60px;
            z-index: 100;
        }

        #banner {
            position: relative;
            width: 100%;
            background-image: url(resources/images/banner.jpg);
            background-size:cover;
            background-position: center;
            background-repeat: no-repeat;
            z-index: 1;
        }

        #banner .frame {
            position: relative;
            overflow: hidden;
            width: 1200px;
            height: 400px;
            margin: 0 auto;
        }

        #banner .searchbar {
            position: absolute;
            bottom: 20px;
            margin-left: 4%;
            margin-right: 4%;
            float: left;
            width: 40%;
            height: 70px;
            background-color: white;
            border-radius: 10px
        }

        #banner .quick {
            position: absolute;
            bottom: 20px;
            margin-left: 52%;
            margin-top: 6%;
            width: 44%;
            height: 300px;
            background-color: white;
            opacity: 0.7;
            border-radius: 10px
        }
        
        #content1 {
            width: 1200px;
            margin: 0 auto;
            overflow: hidden;
            padding: 20px;
            
        }

        #content1 .article2 {
            width: 100%;
            height: 280px;
            
        }

        #content1 .article2 .box1 {
            position: relative;
            float: left;
            width: 32%;
            height: 100%;
            border: 2px solid #bdbdbd;
        }
        
        #content1 .noticeContent {
            width: 100%;
            height: 215px;
            padding: 10px;
        }
        
        .noticeContent ul li{
            list-style: none;
        }   
        
        .noticeContent ul li a{
            color: black;
        } 

        #content1 .article2 .box2 {
            position: relative;
            float: left;
            margin-left: 2%;
            width: 32%;
            height: 100%;
            border: 2px solid #bdbdbd;
        }
        
        #content1 .slider{
           width: 100%;
           height: 215px;
           padding: 10px;
        }
        
        /* 이미지 슬라이드 */
        
        div,ul,li,button,figure,figcaption{margin:0;padding:0;}
        
        button {border: 0;}
        
        img {width: 100%;}
        
        .slider figure {position: relative;}       
        .slider .slick-dots {display: block; width: 100%; text-align: center;}
        .slider .slick-dots li {display: inline-block; width: 15px; height: 15px; margin: 5px;}
        .slider .slick-dots li button {
            font-size: 0; 
            line-height: 0; 
            display: block; 
            width: 15px; height: 15px;
            cursor: pointer; 
            background: #5dbfeb; 
            border-radius: 50%;
        }
        .slider .slick-dots li.slick-active button {background: #2b91c8;}
        .slider .slick-prev {
            position: absolute; left: 0; bottom: 0; 
            z-index: 1000;
            width: 30px; height: 30px; 
            display: inline-block;
            font: normal normal normal 14px/1 FontAwesome;
            text-indent: -9999px;
        }
        .slider .slick-prev::before {
            content: "\f053";
            color: #5dbfeb;
            text-indent: 0;
            position: absolute; left: 9px; top: 8px;
        }
        .slider .slick-next {
            position: absolute; right: 0; bottom: 0; 
            z-index: 1000;
            width: 30px; height: 30px; 
            display: inline-block;
            font: normal normal normal 14px/1 FontAwesome;
            text-indent: -9999px;
        }
        .slider .slick-next::before {
            content: "\f054";
            color: #5dbfeb;
            text-indent: 0;
            position: absolute; left: 11px; top: 8px;
        }
        /* 이미지 슬라이드 */
        
        #content1 .article2 .box3 {
            position: relative;            
            float: left;
            margin-left: 2%;
            width: 32%;
            height: 100%;
            border: 2px solid #bdbdbd;
        }
        
        #content1 .calendar {
            width: 100%;
            height: 215px;
            padding: 10px;
        }

        #content2 {
            width: 1200px;
            margin: 0 auto;
            overflow: hidden;
            padding: 20px;
        }

        #content2 .article1 {
            width: 100%;
            height: 300px;
        }

        #content2 .article1 .box1 {
            position: relative;
            float: left;
            width: 25%;
            height: 100%;
            border: 2px solid #bdbdbd;
        }
        
        #content2 .holidays{
            width: 100%;
            height: 215px;
            padding: 10px;
            
        }

        #content2 .article1 .box2 {
            position: relative;
            float: left;
            margin-left: 2%;
            width: 73%;
            height: 100%;
            border: 2px solid #bdbdbd;
        }
        .box2 ul{
            padding: 0;
            margin: 0;
        }
        .box2 ul li{
            float: left;
            list-style: none;
            height: 160px;
            text-align: center;
            width: 20%;
        }
        .box2 ul img{
            width: 120px;
            height: 100%;
            border: 2px solid red;
        }
        .box2 ul ul{
            margin-top: 5px;
        }
        .box2 ul ul li{
            width: 100%;
            height: 30px;
        }
        .box2 ul ul a{
            color: black;
            font-weight: 900;
        }
        .box2 ul ul a:hover{
            text-decoration: none;
            color: dodgerblue;
        }

        #content3 {
            width: 100%;
            height: 100px;
            margin: 0 auto;
            overflow: hidden;
            padding: 9px;
            background-color: #598DCA;
        }
        
        #content3 .article1{
            width: 100%;
            height: 80px;
            
        }
        
        #content3 .article1 .bar_icon{
            position: relative;
            float: left;
            margin-left: 15%;
            width: 70%;
            height: 100%;
            
        }
        
        .bar_icon ul{
            padding: 0;
            margin: 0;
        }
        .bar_icon ul li{
            float: left;
            list-style: none;
            height: 160px;
            text-align: center;
            width: 20%;
            font-size: 13px;
            color: #fff;
        }
        .bar_icon ul li a{
            background-color: #396FAF;
            border-radius: 50%;
            width: 60px; 
            height: 60px;  
            color: #fff;
            display: inline-block;
            font-size: 35px;
            line-height: 60px;
            transition: all 0.3s ease;
                        
        }
        .bar_icon ul ul{
            margin-top: 5px;
        }
        .bar_icon ul ul li{
            width: 100%;
            height: 30px;
            
        }
        .bar_icon ul ul a{
            color: black;
            font-weight: 900;
        }
        .bar_icon ul li a:hover{
            text-decoration: none;
            box-shadow: 0 0 0 3px rgba(75,154,191,0.9) inset,
                        0 0 0 100px rgba(0,0,0,0.1) inset;}
        
             
        #footer {
            width: 100%;
            height: 150px;
            background-color: #564A3D;
        }
        #footer div{
            margin: 0 auto;
            padding: 25px;
            width: 1200px;
            height: 100%;
        }
        .bg-light{
            position: relative;
            top:50px
        }

        #bar {
            background: none repeat scroll 0 0 #fff;
            border: 0 none;
            border-radius: 10px;
            color: #7F7F7F;
            float: left;
            font: 12px 'Helvetica', 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;
            height: 100%;
            width: 83.3%;
            margin: 0;
            padding: 10px;
            transition: background 0.3s ease-in-out 0s;
        }

        #searchbtn {
            width: 80px;
            background: url(resources/images/search.png) no-repeat scroll center center #D37B17;
            background-size: 60px 60px;
            cursor: pointer;
            height: 100%;
            text-indent: -99999em;
            transition: background 0.3s ease-in-out 0s;

            position: relative;
            border: 2px solid #fff;
            border-radius: 10px
        }
        #searchbtn:hover{
            background: url(resources/images/search.png) no-repeat scroll center center #B06A1B;
            background-size: 60px 60px;
        }

        /* 화면너비 0 ~ 1200px */
        @media(max-width: 1217px) {
            #header {
                width: 100%;
            }
            .menus{
                width: 100%;
            }
            
            #banner .frame {
                width: 100%;
            }
            .footer{
                width: 100%;
            }
            #content1{
                width: 100%;
            }
            #content2 {
                width: 100%;
            }
            #content3{
                width: 100%;
            }
            #bar {
                width: 80%
            }

            #searchbtn {
                width: 20%
            }
            #footer{
                height: 300px;
            }
            #footer div{
                width: 100%;
            }
            #footer div div{
                position: relative;
                margin: 0 auto;
            }
        }

        /* 화면너비 0 ~ 768px */
        @media(max-width: 768px) {
            .toplink{
                display: none;
            }
            
            .userinfo {
                display: none;
            }

            #banner .frame {
                height: 378px;
                background-color: dimgray;
            }
            .toggler{
                display: block;
                width:100%;
            }
            .menuul{
                display: none;
            }
            #toggle:checked + .menuul{display: block;}
            .menus ul li{
                position: relative;
                width: 100%;
                z-index: 101;
                height: auto;
            }
            
            .menus label{
                display: block;
            }
            #banner {background: none;}
            #banner .searchbar {
                width: 100%;
                top: 0px;
                margin: 0;
                margin-top: 3.5px;
            }

            #banner .quick {
                width: 100%;
                margin: 0%;
                bottom: 0;
                opacity: 1;
                border-radius: 1px;
            }

            #content1 .article2 .box1 {
                width: 100%;
                
            }
            
            #content1 .article2 .box2 {
                width: 100%;
                height: 300px;
                margin-left: 0;
                margin-top: 2%
            }

            #content1 .article2 .box3 {
                width: 100%;
                margin-left: 0;
                margin-top: 2%
            }
            
            #content2 .article1 .box1 {
                width: 100%;
                
            }

            #content2 .article1 .box2 {
                width: 100%;
                height: 300px;
                margin-left: 0;
                margin-top: 2%;
            }
                        
            .box2 ul li{
                width: 25%
            }
            .box2 ul li:nth-child(5n){
                display: none;
            }
            
            #content3 .article1 .bar_icon{
                width: 100%;
                
            }
            
            .bar_icon ul li{
                width: 25%
            }
            .bar_icon ul li:nth-child(4n){
                display: none;
            }
            
            #bar {
                width: 85%
            }

            #searchbtn {
                width: 15%
            }
        }

        /* 화면너비 0 ~ 480px */
        @media(max-width: 480px) {
            #header1 {
                height: 50px;
            }

            #banner {
                padding: 0;
            }

            #banner .quick {
                width: 100%;
                margin: 0%;
                margin-top: 0%
            }

            #content1 {
                padding: 0
            }

            #content2 {
                padding: 0
            }
            .box2 ul li{
                width: 33.3333%
            }
            .box2 ul li:nth-child(4n){
                display: none;
            }
            
            #content3 {
                padding: 0
            }
            
            .bar_icon ul li{
                width: 33.3333%
            }
            .bar_icon ul li:nth-child(4n){
                display: none;
            }
 

            #bar {
                width: 80%
            }

            #searchbtn {
                width: 20%
            }
        }
    </style>
</head>

<body>
    <header id="header">
        <nav id="header1" style="height: 60px">
            <h2 style="float: left; position: relative; top: 10px;"><a href style="text-decoration: none;">Samboo Library</a></h2>
            <div class="toplink">
                <ul>
                    <li><a href="#">로그인</a>｜</li>
                    <li><a href="#">회원가입</a></li>
                </ul>
            </div>
        </nav>
    </header>
    <section id="menusection">
        
        <nav class="menus">
            <label for="toggle" onclick>MENU</label>
            <input type="checkbox" id="toggle"/>
            <ul class="menuul">
                <li><a href="#">자료검색</a>
                    <ul>
                        <li><a href="#">서브메뉴1</a></li>
                        <li><a href="#">서브메뉴2</a></li>
                        <li><a href="#">서브메뉴3</a></li>
                    </ul>
                </li>
                <li><a href="#">프로그램</a>
                    <ul>
                        <li><a href="#">서브메뉴1</a></li>
                        <li><a href="#">서브메뉴2</a></li>
                        <li><a href="#">서브메뉴3</a></li>
                    </ul>
                </li>
                <li><a href="#">열린공간</a>
                    <ul>
                        <li><a href="#">서브메뉴1</a></li>
                        <li><a href="#">서브메뉴2</a></li>
                        <li><a href="#">서브메뉴3</a></li>
                    </ul>
                </li>
                <li><a href="#">도서관안내</a>
                    <ul>
                        <li><a href="#">서브메뉴1</a></li>
                        <li><a href="#">서브메뉴2</a></li>
                        <li><a href="#">서브메뉴3</a></li>
                    </ul>
                </li>
                <li><a href="#">마이라이브러리</a>
                    <ul>
                        <li><a href="#">서브메뉴1</a></li>
                        <li><a href="#">서브메뉴2</a></li>
                        <li><a href="#">서브메뉴3</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </section>
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
					<div><figure>
			     		<img src="resources/images/banner1.png" alt="이미지1">
					</figure></div>
					<div><figure>
                        <img src="resources/images/banner2.png" alt="이미지2">
                    </figure></div>
			        <div><figure>
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

    <footer id="footer">
        <div>
           <div style="position: absolute; width:400px; height: 70px;">
                <img src="resources/images/sb.png" style="width:70px; height: 70px; background-color: white; border-radius: 50px; border: solid 5px #283593; float: left;">
                <p style="color: white; font-size: 40px; margin-top: 3px">삼부도서관</p>
            </div>
            <address style="color: white; text-align: center;">
                서울시 강남구 역삼동<br>
                Tel: (02)123-4567 | Fax: (02)234-5678
            </address>
            <p style="color: white; text-align: center;">Copyright © 2018 tcpschool.co.,Ltd. All rights reserved.</p>
        </div>
    </footer>
    
     <!-- JavaScript Libraries -->
    <script src="resources/js/jquery.min_1.12.4.js"></script>
    <script src="resources/js/modernizr-custom.js"></script>
    <script src="resources/js/slick.min.js"></script>   
        
    <script>
        $(".menus ul li").on("click",function() {
            $(this).children("ul").stop().toggle()
        });
        $(".addbooks").on("click", function(){
            window.open('selectBook.html', '네이버팝업', 'width=700px,height=800px,scrollbars=no');
        });
        
        //이미지 슬라이더
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
		}); //이미지 슬라이더
        
    </script>
</body></html>

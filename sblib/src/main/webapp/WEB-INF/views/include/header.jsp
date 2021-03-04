<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    

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
                </li>
                <li><a href="#">프로그램</a>
                    <ul>
                        <li><a href="/event/calendar">도서관일정</a></li>
                        <li><a href="#">독서문화행사</a></li>
                    </ul>
                </li>
                <li><a href="#">열린공간</a>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">묻고답하기</a></li>
                        <li><a href="#">책이야기</a></li>
                    </ul>
                </li>
                <li><a href="#">도서관안내</a>
                    <ul>
                        <li><a href="#">도서관현황</a></li>
                        <li><a href="#">이용안내</a></li>
                        <li><a href="#">오시는길</a></li>
                    </ul>
                </li>
                <li><a href="#">마이라이브러리</a>
                    <ul>
                        <li><a href="#">내서재</a></li>
                        <li><a href="#">내가작성한글</a></li>
                        <li><a href="#">회원정보</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </section>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <header id="header">
        <nav id="header1" style="height: 60px">
            <div class="logo">
            	<a href="/"><img src="../resources/images/logo.png"></a>
            </div>
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
            <label for="toggle">MENU▼</label>
            <input type="checkbox" id="toggle"/>
            <ul class="menuul">
                <li><a href="/search/searchSimple">자료검색</a>
                </li>
                <li><a href="#">프로그램</a>
                    <ul>
                        <li><a href="/event/calendar">도서관일정</a></li>
                        <li><a href="/event/eventBoard">독서문화행사</a></li>
                        <li></li>
                    </ul>
                </li>
                <li><a href="#">열린공간</a>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">묻고답하기</a></li>
                        <li><a href="#">책이야기</a></li>
                    </ul>
                </li>
                <li><a href="/info/greeting">도서관안내</a>
                    <ul>
						<li><a href="/info/greeting">인삿말</a></li>
						<li><a href="/info/libStatus">도서관현황</a></li>
						<li><a href="/info/userGuide">이용안내</a></li>
						<li><a href="/info/comingWay">오시는길</a></li>
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
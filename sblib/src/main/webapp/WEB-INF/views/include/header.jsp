<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    

    <header id="header">
        <nav id="header1" style="height: 60px">
            <div class="logo">
            	<a href="/"><img src="../resources/images/logo.png"></a>
            </div>
            <div class="toplink">
                 <ul>
            <!-- bk 로그인 상태표시 수정 -->
				<c:choose>
					<c:when test= "${userSession eq null}">
						<li><a href="/member/login"> 로그인 </a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
						<a href="/member/register">회원가입</a></li>

					</c:when>
					<c:when test= "${userSession.member_name eq '관리자'}">
						<li> ${userSession.member_name}님, 반갑습니다!&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<a href="/member/logout">로그아웃</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
						<a href="/book/addBook"> 도서관리</a></li>
					</c:when>
					<c:otherwise>
						<li> ${userSession.member_name}님, 반갑습니다!&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<a href="/member/logout">로그아웃</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
						<a href="/member/update">회원정보수정</a></li>
					</c:otherwise>
				</c:choose>
                </ul>
            </div>
        </nav>
    </header>
    <section id="menusection">
        
        <nav class="menus">
            <label for="toggle">MENU▼</label>
            <input type="checkbox" id="toggle"/>
            <ul class="menuul">
            	<li><a href="#">자료검색</a>
                    <ul>
               			<li><a href="/search/searchSimple">자료검색</a></li>
               			<li></li><li></li><li></li>
                	</ul>
                </li>
                <li><a href="#">프로그램</a>
                    <ul>
                        <li><a href="/event/calendar">도서관일정</a></li>
                        <li><a href="/event/eventBoard">독서문화행사</a></li>
                        <li></li><li></li>
                    </ul>
                </li>
                <li><a href="#">열린공간</a>
                    <ul>
                        <li><a href="/notice/list">공지사항</a></li>
                        <li><a href="/question/list">묻고답하기</a></li>
                        <li><a href="/bookstory/list">책이야기</a></li>
                        <li></li>
                    </ul>
                </li>
                <li><a href="#">도서관안내</a>
                    <ul>
						<li><a href="/info/greeting">인삿말</a></li>
						<li><a href="/info/libStatus">도서관현황</a></li>
						<li><a href="/info/userGuide">이용안내</a></li>
						<li><a href="/info/comingWay">오시는길</a></li>
                    </ul>
                </li>
                <li><a href="#">마이라이브러리</a>
                    <ul>
                        <li><a href="/search/rentList">내서재</a></li>
                        <li><a href="/search/cartList">장바구니</a></li>
                        <li><a href="/question/myList">내질문답변</a></li>
                        <li><a href="/bookstory/myList">내책이야기</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </section>
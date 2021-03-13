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
					</c:when>
					<c:otherwise>
						<li> ${userSession.member_name}님, 반갑습니다!&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<a href="/member/logout">로그아웃</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
						</li>
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
            	<li><a href="/">홈</a>
                </li>
                <li><a href="#">도서관리</a>
                    <ul>
                        <li><a href="/book/bookList">도서목록 및 수정</a></li>
                        <li><a href="/book/addBook">도서추가</a></li>
                    </ul>
                </li>
                <li><a href="/admin/userList">회원관리</a></li>
          
            </ul>
        </nav>
    </section>
    
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

    <header id="header">
        <nav id="header1" style="height: 60px">
            <h2 style="float: left; position: relative; top: 10px;"><a href="/" style="text-decoration: none;">Samboo Library</a></h2>
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
             
                <li><a href="/">홈</a>   
                </li>
                <li><a href="#">도서관리</a>
                  <ul>
                        <li><a href="/book/bookList">도서목록확인</a></li>
                        <li><a href="/book/addBook">도서추가</a></li>
                    </ul>
                <li><a href="/book/userList">회원관리</a>

            </ul>
        </nav>
    </section>
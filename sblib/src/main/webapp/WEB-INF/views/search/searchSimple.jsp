<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.searchBar{
	position: relative;
	border : 1px solid #e2e2e2;
	padding : 30px 25px;
	margin : 20px;
	background-color: #efebe9;
	}
	
	.bookBox{
	position : relative;
	border : 1px solid #e2e2e2;
	padding : 30px 25px;
	margin : 20px;
	}
	.bookImg{
	position: absolute;
	left : 25px;
	top : 30px;
	width : 120px;
	box-sizing: border-box;
	}
	.bookInfo{
	position: relative;
	margin-left : 170px;
	padding-bottom: 40px;
	box-sizing: border-box;
	}
	#searchType{
		float: left;
		margin-right: 10px;
		width: 20%;
	}
	#options{
		width:100%;
		float:left;
	}
	#searchInputtext{
		width:60%;
		float:left;
		margin-right:10px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>삼부도서관</title>
</head>
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>
<body>    

<body>
<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<!-- sidebar -->
	<div id='body'>
		<div id='sidemenu'>
			<div class="title">
				<h2>자료검색</h2>
			</div>
			<ul>
				<li><a href="/search/searchSimple">도서검색</a></li>
				<li><a href="http://www.dlibrary.go.kr/" target="_blank">국회원문 DB</a></li>
			</ul>
			<div class="lastchild"></div>
		</div>
	<!-- sidebar -->
	<!-- content -->
		<div id='layer'>
			<h3>도서검색</h3>
			<div style="width: 100%; height: 20px;">
				<ul>
					<li>자료검색　>　</li>
					<li>도서검색</li>
				</ul>
			</div>
			<hr style="margin-top: 30px;">
			<!-- search -->
			<div class="searchBar">
				<form id='searchForm' action='/search/searchResult' method='get'>
					<div id="searchType">
						<select name='type' id="options" class="form-control">
							<option value="T">서명</option>
							<option value='A'>저자</option>
							<option value='P'>출판사</option>
							<option value='TA'>서명+저자</option>
							<option value='TP'>서명+출판사</option>
							<option value='TAP'>서명+저자+출판사</option>
						</select>
					</div>
					<div class="searchInputbox">
							<input id="searchInputtext" class="form-control" type="text" name='keyword' placeholder=" 검색어를 입력하세요."> 
							<input type="hidden" name="pageNum" value="1"> 
							<input type="hidden" name="amount" value="10">
							<input type="submit" class="btn btn-warning" value="검색">
					</div>
				</form>
			</div>
			<!-- search -->
		</div>
	</div>
	
	<div style="height:1000px">
		<!-- 빈공간 div-->
	</div>
			
	<!-- content -->
	
	
	
	<script>
		$(document).ready(function(){
			
			var result = '<c:out value="${result}"/>';
			var searchForm = $("#searchForm");
			
			$("#searchForm button").on("click",function(e){
				if(!searchForm.find("input[name='keyword']").val()){
					alert('키워드를 입력하세요');
					return false;
				}
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				searchForm.submit();
			})
		});
	</script>
	<!-- js -->
	<tiles:insertAttribute name="js"></tiles:insertAttribute>
	  <!-- footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>


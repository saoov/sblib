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
	}

	.bookList{
	margin: 20px 20px;
	}
	.listWrap{
	display: block;
	list-style: none;
	}
	.listWrap<li{
	display: list-item;
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Book List</title>
</head>
<!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>
<link rel="stylesheet" href="resources/css/slick.css">
<body>    

<!-- header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<body>
	<h1>도서관 자료 검색</h1>
	<!-- search -->
	<div class="searchBar">
		<form id='searchForm' action='/search/searchResult' method='get'>
			<select name='type'>
				<option value="T">서명</option>
				<option value='A'>저자</option>
				<option value='P'>출판사</option>
				<option value='TA'>서명 + 저자</option>
				<option value='TP'>서명 + 출판사</option>
				<option value='TAP'>서명 + 저자 + 출판사</option>
			</select>
			<input type="text" name='keyword' placeholder="도서명을 입력하세요.">
			<input type="hidden" name="pageNum" value="1">
			<input type="hidden" name="amount" value="10">
			<button>검색</button>
		</form>
	</div>
	<!-- search -->
	<div style="height:1000px">
	
	</div>
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
	  <!-- footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>


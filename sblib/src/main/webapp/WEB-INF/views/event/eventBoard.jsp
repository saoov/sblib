<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>

<style>
	#body{
	position:relative;
	margin:0 auto;
	width: 1200px;
	margin-top: 50px;
	margin-bottom: 10px;
	background-color: red;
	}
	#sidemenu {
		width: 18%;
		background-color: white;
		margin-right: 4%;
		float:left;
	}
	#mainbody{
		width: 78%;
		background-color: red;
		position:absolute;
		right:0;
		clear:both;
	}
	.jun{
		width:100%;
		height:600px;
		background-color: blue
	}
	
	#sidemenu ul{
		margin : 0;
		padding : 0;
		background-color: gray;
		border-radius: 10px;
	}
	#sidemenu ul li{
		list-style: none;
		width : 100%;
		height : 50px;
		line-height: 3.5;
        text-align: center;
        border-bottom: 0.7px solid white;
	}
	#sidemenu ul li a{
		display : block;
		color : white;
	}
	#sidemenu ul li a:hover{
		background-color: #424242;
		text-decoration: none;
	}
	#sidemenu .title{
		width: 100%;
	}
	.title h1{
		text-align: center;
		margin-top: 10px;
	}
	

  </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <!-- css -->
<tiles:insertAttribute name="css"></tiles:insertAttribute>

<body>
<!-- header -->
 <tiles:insertAttribute name="header"></tiles:insertAttribute>

	<div id='body'>
		<div id='sidemenu'>
			<div class="title">
				<h1>???</h1>
			</div>
			<hr>
			<ul>
				<li><a href="#">???</a></li>
				<li><a href="#">???</a></li>
			</ul>
		</div>
		<div id='mainbody'>
			<div class='jun'>
			</div>
		</div>
	</div>

<!-- js -->
<tiles:insertAttribute name="js"></tiles:insertAttribute>
<!-- footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
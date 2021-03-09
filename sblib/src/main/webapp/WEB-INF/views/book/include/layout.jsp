<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>

<head>
	<style type="text/css">
     	td{
     	border: 1px solid #444444
     	}
     	table
     	{
      	width: 98%;
      	 margin:5px;
      	  padding:10px;
      	   border: 3px solid #444444;
      	    border-collapse: collapse;
      	}
      	
     	</style>
	
  <script src="http://code.jquery.com/jquery-latest.js"></script>
    <meta charset="UTF-8">
 
    
    
</head>
<tiles:insertAttribute name="css"/>
<body>
    <!-- header 부분 -->
	<tiles:insertAttribute name="header"/>
	
	<tiles:insertAttribute name="body"/>
	
	<tiles:insertAttribute name="footer"/>


       <tiles:insertAttribute name="js"/> 
    </body>
    
    </html>
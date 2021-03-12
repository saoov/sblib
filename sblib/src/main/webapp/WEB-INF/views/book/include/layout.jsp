<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
	
 <script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- DataTables CSS -->
<link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
<!-- DataTables Responsive CSS -->
<link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables JavaScript -->
<script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>
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
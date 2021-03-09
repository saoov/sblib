<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<c:forEach items="${rentList}" var="rentList">
			<li>
				<div>
					대여정보 : <p><a href="/book/rentView?n=${rentList.rentId }">${rentList.rentId }</a></p>
					아이디 : <p>${rentList.userId }</p>
					대출일 : <p>${rentList.rentDate }</p>
					반납예정일 : <p>${rentList.returnexDate }</p>
				</div>
			</li>
		</c:forEach>
	</ul>
</body>
</html>
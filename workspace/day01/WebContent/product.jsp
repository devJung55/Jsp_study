<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>가격</th>
		</tr>
		<tr>
			<td><c:out value="${param.name}"/></td>
			<td><c:out value="${param.price}원"/></td>
		</tr>
	</table>
</body>
</html>
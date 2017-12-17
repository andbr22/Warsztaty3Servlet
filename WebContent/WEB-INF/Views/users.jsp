<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	td, th, table {border: 1px solid black; padding: 5px}
</style>
<title>Użytkownicy w grupie</title>
</head>
<body>
<%@ include file="Header.jsp" %>
	<table>
		<tr>
			<th>Imię</th>
			<th>Email</th>
			<th>Akcje</th>
		</tr>
		<c:forEach items="${users}" var="user">
			<tr>
				<td>${user.username}</td>
				<td>${user.email}</td>
				<td><a href="UserInfo?id=${user.getId()}">Info</a></td>
			</tr>
		</c:forEach>
	</table>
<%@ include file="Footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
td, th, table {
	border: 1px solid black;
	padding: 5px
}
</style>
<title>Przydziel zadanie</title>
</head>
<body>
	<%@ include file="Header.jsp"%>
	Tytuł: ${ex.title}<br>
	Opis: ${ex.description}<br>
	<form action="AdminEx" method="post">
		<table>
			<tr>
				<th>Id użytkownia</th>
				<th>Nazwa użytkownka</th>
				<th>Przydziel</th>
			</tr>
			<c:forEach items="${users}" var="user">
				<tr>
					<td>${user.id}</td>
					<td>${user.username}</td>
					<td><input type="checkbox" name="solution" value="${user.id}"></td>
				</tr>
			</c:forEach>
		</table>
		<input type="hidden" name="id" value="${ex.id}">
		<input type="submit" name="przydziel" value="przydziel">
	</form>
		<%@ include file="Footer.jsp"%>
</body>
</html>
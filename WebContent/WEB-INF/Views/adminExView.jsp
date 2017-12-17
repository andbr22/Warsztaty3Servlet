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
<title>View groups</title>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<table>
		<tr>
			<th>Id</th>
			<th>Nazwa</th>
			<th>Opis</th>
			<th>Akcja</th>
		</tr>
		<c:forEach items="${exs}" var="ex">
			<tr>
				<td>${ex.id}</td>
				<td>${ex.title}</td>
				<td>${ex.description}</td>
				<td>
					<a href="AdminEx?action=edit&id=${ex.getId()}">EDYTUJ</a>
					<a href="AdminEx?action=del&id=${ex.getId()}">USUŃ</a>
					<a href="AdminEx?action=sol&id=${ex.getId()}">PRZYDZIEL</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="AdminEx?action=add">DODAJ ZADANIE</a>
		<%@ include file="Footer.jsp"%>
</body>
</html>
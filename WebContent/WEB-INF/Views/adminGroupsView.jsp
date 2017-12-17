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
			<th>Akcja</th>
		</tr>
		<c:forEach items="${groups}" var="group">
			<tr>
				<td>${group.id}</td>
				<td>${group.name}</td>
				<td>
					<a href="AdminGroups?action=edit&id=${group.getId()}">EDYTUJ</a>
					<a href="AdminGroups?action=del&id=${group.getId()}">USUŃ</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="AdminGroups?action=add">DODAJ GRUPĘ</a>
		<%@ include file="Footer.jsp"%>
</body>
</html>
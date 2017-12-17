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
<title>Startowa</title>
</head>
<body>
<%@ include file="Header.jsp" %>
	<table>
		<tr>
			<th>Tytuł</th>
			<th>Autor rozwiązania</th>
			<th>Data dodania</th>
			<th>Akcja</th>
		</tr>
		<c:forEach items="${solutions}" var="solution" end="${limit}">
			<tr>
				 <td>${solution.getExcercise().getTitle() }</td> 
				<td>${solution.getUser().getUsername()}</td>
				<td>${solution.getCreated()}</td>
				<td><a href="SolutionView?id=${solution.getId()}">więcej</a></td>
			</tr>	
		</c:forEach>
	</table>
<%@ include file="Footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edytuj użytkownika</title>
</head>
<body>
<form action="AdminUsers" method="post">
	<table>
		<tr>
			<td>Nazwa użytkownika</td>
			<td><input name="username" value="${user.username}"></td>
		</tr>
		<tr>
			<td>Grupa</td>
			<td>
				<select name="group">
					<c:forEach items="${groups}" var="group">
						<option value="${group.id}">${group.name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>email</td>
			<td><input name="email" value="${user.email}"></td>
		</tr>
		<tr>
			<td>hasło</td>
			<td><input type="password" name="password"></td>
		</tr>
	</table>
	<input type="hidden" name="id" value="${user.id}">
	<input type="submit" value="edytuj">
</form>
</body>
</html>
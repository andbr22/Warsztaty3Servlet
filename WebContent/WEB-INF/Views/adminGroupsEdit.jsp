<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dodaj grupę</title>
</head>
<body>
<form action="AdminGroups" method="post">
	Nazwa grupy: <input name="name" value="${group.name}"><br>
	<input type="hidden" name="id" value="${group.id}">
	<input type="submit" value="dodaj">
</form>
</body>
</html>
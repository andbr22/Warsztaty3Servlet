<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dodaj Zadanie</title>
</head>
<body>
<form action="AdminEx" method="post">
	Tytuł: <input name="title"><br>
	Opis:<br>
	<textarea rows="12" cols="60" name="description"></textarea>,<br>
	<input type="submit" value="dodaj" name="dodaj">
</form>
</body>
</html>
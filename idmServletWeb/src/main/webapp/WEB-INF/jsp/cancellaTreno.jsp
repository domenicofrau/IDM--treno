<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> Cancella un treno</h1>

<h3>Inserisci l'id del treno che vuoi cancellare</h3>

<form action="cancellato" method="GET">
	<input type="number" name="trainID" placeholder="Inserisci qui l'ID"><br>
	<input type="submit" value="Cancella">
</form>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trova Treno</title>
</head>
<body>

<h1>Trova Treno</h1>

<form action="cerca-treno" method="get">
    <label for="idTreno">ID del Treno:</label>
    <input type="text" id="idTreno" name="idTrenoStr" required>
    <input type="submit" value="Cerca Treno">
</form>

<c:if test="${not empty errore}">
    <div style="color: red;">
        <h3>${errore}</h3>
    </div>
</c:if>

<c:if test="${not empty treno}">
    <div>
        <h3>Treno trovato!</h3>
        <p>ID: ${treno.id}</p>
        <p>Marca: ${treno.marca}</p>
        <h4>Vagoni:</h4>
<c:forEach var="vagone" items="${treno.vagoni}">
    <div>
        <p>Posti: ${vagone.posti}</p>
        <p>Lunghezza: ${vagone.lunghezza}</p>
        <p>Peso: ${vagone.peso}</p>
        <p>Tipo: ${controller.tipoVagone(vagone)}</p>
    </div>
</c:forEach>
    </div>
</c:if>

</body>
</html>


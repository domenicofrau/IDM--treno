<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	Scegli la factory del treno:

	<!-- selettore -->

	<form action="seleziona-factory" method="get">
		<input type="radio" name="factory" value="fr"> FR <input
			type="radio" name="factory" value="tn"> TN 
	</form>

	<c:choose>
		<c:when test="${selectedFactory == 'fr'}">
			<!-- Form per FR -->
			<form:form method="POST" action="viewTreno"
				modelAttribute="siglaTreno">
				<table>
					<form:input path="sigla" />
					<input type="submit" value="Invia">
				</table>
			</form:form>
		</c:when>
		<c:when test="${selectedFactory == 'tn'}">
			<!-- Form per TN -->
			<form:form method="POST" action="viewTreno"
				modelAttribute="siglaTreno">
				<table>
					<form:input path="sigla" />
					<input type="submit" value="Invia">
				</table>
			</form:form>
		</c:when>
		<c:otherwise>
			<!-- Nessun form selezionato -->
			<p>Seleziona una factory per iniziare.</p>
		</c:otherwise>
	</c:choose>

</body>
</html>
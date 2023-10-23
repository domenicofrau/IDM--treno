<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Inserisci sigla treno:
       <form:form method="POST" 
          action="crea-treno" modelAttribute="siglaTreno">
          
    <table>
        <form:input path="sigla" />
        <input type="submit" value="Invia">
    </table>
    
        </form:form>
</body>
</html>
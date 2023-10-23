<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

Inserisci Categoria:
      <form:form method="POST" 
          action="add" modelAttribute="categoria">
             <table>
                <tr>
                    <td><form:label path="nome">Nome</form:label></td>
                    <td><form:input path="nome"/></td>
                </tr>
                <tr>
                    <td><form:label path="descrizione">Descrizione</form:label></td>
                    <td><form:input path="descrizione"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit"/></td>
                </tr>
            </table>
        </form:form>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ESERCIZIO SUL SERVLET E JSP</title>
<link rel="icon" href="https://public.am.files.1drv.com/y4m4ZKT8iYL6sWFczg2X8YkvzonSF6GmAfZkTCeqxxhHqSoUb3eyTLzUaoQN9OGXkgc-VJSzL48cPZlID4Tg4O9r3UBzFAMTBcEWG2SjRTSjHzBm5rBig18M72cgFdSajKj26BHIy8phjsoiG_OHVXjn7N4fmn9q7byxHdbbId0JDhD20je5p7Fi0AVaC7D-_75bHhBp2S6Z13MDcZcgeLaKHfVJrLYTp8Gj3tnKjX1jvA?AVOverride=1" type="image/x-icon">
</head>
<body>
<!-- <body style="background-color: #9fb8bf;"> -->

<img style="padding-right: 30px;"src="https://media.licdn.com/dms/image/C4E0BAQHCZByFk46j-g/company-logo_200_200/0/1519870225999?e=1706140800&v=beta&t=xdpakhTdZTttW5usFRYp7FvXQvc93R8oi36qjtskFCs" width="100" height="100">
<h1 style="color: #258aa8">ESERCIZIO SUL SERVLET E JSP</h1>


<c:forEach var="entry" items="${headers}">
    <li><b>${entry.key}</b>: ${entry.value}</li>
</c:forEach>

</body>
</html>
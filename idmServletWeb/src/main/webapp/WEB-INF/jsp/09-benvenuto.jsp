<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon"/>
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/benvenuto.css'/>">
	</head>
	<c:if test="${empty loggedInUser.nome}">
	    <c:redirect url="01-welcome"/>
	</c:if>
	<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-12">
				<h1 class="mainTitle text-center my-4 mb-5 fade-in">Benvenuto su TrainBook</h1>
				<h4 class="text-secondary text-center my-4 fade-in" style="animation-delay: 1s;">${loggedInUser.nome}, ti sono stati accreditati 5000 <img class="nav-item-icon" style="height: 25px;" src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain">  per poter iniziare a creare i tuoi treni personalizzati.</h4>
				<img class="nav-item-icon fade-in-img mx-auto d-block mt-5" src="<c:url value='/resources/img/animation_ok.gif'/>" alt="bitTrain">
				<div class="text-center my-4">
					<a href="03-home" class="btn btn-primary btn-lg bounce" style="animation-delay: 2s;">Entra</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<!-- Custom JS -->
	<script src="<c:url value='/resources/js/benvenuto.js'/>"></script>
	</body>
</html>
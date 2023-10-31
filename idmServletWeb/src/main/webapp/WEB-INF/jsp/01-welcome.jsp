<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TrainBook</title>
<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>"
	type="image/x-icon">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/01-welcome.css'/>">

</head>
<body>

	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand" href="01-welcome"
				style="padding-right: 50px;"> <img
				src="<c:url value='/resources/img/logo_nav.png'/>" alt=""
				height="30" style="vertical-align: middle; margin: 0 10px;">
			</a>

			<!-- Menu al centro -->
			<div class="collapse navbar-collapse justify-content-center"
				id="navbarNav">
				<ul class="navbar-nav align-items-center">
					<li class="nav-item active mr-3"><a class="nav-link"
						href="01-welcome">Welcome</a></li>
					<li class="nav-item mr-3"><a class="nav-link" href="02-login">Login</a></li>
					<li class="nav-item mr-3"><a class="nav-link" href="03-home">Home</a></li>
					<li class="nav-item mr-3"><a class="nav-link"
						href="06-crea-treno">Crea Treno</a></li>
					<li class="nav-item">
						<div class="input-group" style="width: 180px; position: relative;">
							<input type="text" class="form-control" placeholder="Cerca treno"
								aria-label="Cerca treno"
								style="height: 25px; border-radius: 15px; padding-left: 25px;">
							<div class="input-group-append"
								style="position: absolute; left: 5px; top: 0; height: 100%; display: flex; align-items: center;"></div>
							<i class="ms-3 bi bi-search text-secondary"
								style="margin-left: 5px; align-self: center;"></i>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container mt-5">
		<div class="row">
			<div class="col-12 col-md-6 p-3">
				<h1 class="mainTitle">Benvenuto su TrainBook!</h1>
				<p class="mainPara">TrainSocial � il primo social network dedicato agli
				appassionati di treni. Qui puoi creare il tuo treno personalizzato e
				condividerlo con il resto del mondo. Esplora le creazioni degli altri
				utenti e lasciati ispirare!</p>
				<a href="02-login" class="btn btn-dark mt-4">Login</a>
				<a href="02-login" class="btn btn-outline-dark mt-4">Registrati</a>
			</div>

			<div class="col-12 col-md-6 my-3">
				<img class="mt-5" src="<c:url value='/resources/img/trainbg.png'/>"
					width="500px" />
			</div>
		</div>

	</div>

</body>
</html>
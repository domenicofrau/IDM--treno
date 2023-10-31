<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TrainBook - Profilo</title>
<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/01-welcome.css'/>">

</head>
<body>

	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="01-welcome"> <img
			src="<c:url value='/resources/img/logo_nav.png'/>" alt="" height="30"
			style="vertical-align: middle; margin: 0 10px;">
		</a>

		<!-- Menu al centro -->
		<div class="collapse navbar-collapse justify-content-center"
			id="navbarNav">
			<ul class="navbar-nav align-items-center">
				<li class="nav-item active"><a class="nav-link"
					href="01-welcome">Welcome</a></li>
				<li class="nav-item"><a class="nav-link" href="02-login">Login</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="03-home">Home</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="06-crea-treno">Crea
						Treno</a></li>
				<li class="nav-item">
					<div class="input-group" style="width: 180px; position: relative;">
						<input type="text" class="form-control" placeholder="Cerca treno"
							aria-label="Cerca treno"
							style="height: 25px; border-radius: 15px; padding-left: 25px;">
						<div class="input-group-append"
							style="position: absolute; left: 5px; top: 0; height: 100%; display: flex; align-items: center;">
						</div>
						<i class="ms-3 bi bi-search text-secondary"
							style="margin-left: 5px; align-self: center;"></i>
					</div>
				</li>
			</ul>
		</div>


		<!-- Link a destra -->
		<div class="navbar-nav ml-auto">
			<a class="nav-item nav-link" href="04-profile">PROFILO</a>
		</div>
	</nav>

	<div class="container mt-5">
		<div class="row">
			<!-- Sezione Immagine Profilo -->
			<div class="col-md-3 text-center">
				<img src="<c:url value='/resources/img/profile-test.jpg'/>"
					alt="Immagine Profilo" class="rounded-circle" width="150">
				<h3 class="mt-3">Nome e Cognome</h3>
				<p>Username</p>
				<p>mail@example.com</p>
			</div>

			<!-- Sezione Treni -->
			<div class="col-md-9">
				<h2>I Tuoi Treni</h2>
				<div class="row">
					<!-- Primo Treno -->
					<div class="col-md-6">
						<div class="card mb-4">
							<div class="card-body">
								<h5 class="card-title">Nome</h5>
								<p class="card-text">Marca</p>
								<p class="card-text">Peso Totale</p>
								<a href="#" class="btn btn-danger">Cancella</a>
							</div>
						</div>
					</div>

					<!-- Secondo Treno -->
					<div class="col-md-6">
						<div class="card mb-4">
							<div class="card-body">
								<h5 class="card-title">Nome</h5>
								<p class="card-text">Marca</p>
								<p class="card-text">Peso Totale</p>
								<a href="#" class="btn btn-danger">Cancella</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
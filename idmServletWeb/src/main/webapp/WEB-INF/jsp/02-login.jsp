<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TrainBook</title>
<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/01-welcome.css'/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
				<li class="nav-item"><a class="nav-link"
					href="01-welcome">Welcome</a></li>
				<li class="nav-item active"><a class="nav-link" href="02-login">Login</a>
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
		<div class="row justify-content-center">
			<div class="col-md-6">

				<!-- Form di Login -->
				<div id="loginForm">
					<h2>Login</h2>
					<form action="doLogin" method="post" class="form-group">
						<input type="text" name="username" placeholder="Nome utente"
							class="form-control mb-2" required> <input
							type="password" name="password" placeholder="Password"
							class="form-control mb-2" required>
						<button type="submit" class="btn btn-primary btn-block">Accedi</button>
						<p class="mt-2">
							Non sei ancora registrato? <a href="#"
								onclick="showRegisterForm()">Registrati qui</a>
						</p>
					</form>
				</div>

				<!-- Form di Registrazione -->
				<div id="registerForm" style="display: none;">
					<h2>Registrazione</h2>
					<form action="doRegister" method="post" class="form-group">
						<input type="text" name="username" placeholder="Nome utente"
							class="form-control mb-2" required> <input
							type="password" name="password" placeholder="Password"
							class="form-control mb-2" required> <input type="email"
							name="email" placeholder="Email" class="form-control mb-2"
							required>
						<button type="submit" class="btn btn-success btn-block">Registra</button>
					</form>
					<button onclick="showLoginForm()"
						class="btn btn-secondary btn-block mt-2">Indietro</button>
				</div>

			</div>
		</div>
	</div>
	<script src="<c:url value='/resources/js/02-login.js'/>"></script>
</body>
</html>
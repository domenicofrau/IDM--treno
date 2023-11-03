<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TrainBook</title>
<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>"
	type="image/x-icon">

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

		<!-- Menu al centro -->
		<div class="collapse navbar-collapse justify-content-center"
			id="navbarNav">
			<ul class="navbar-nav align-items-center">
				<li class="nav-item mr-3"><a class="nav-link" href="01-welcome">Welcome</a></li>
				<li class="nav-item active mr-3"><a class="nav-link"
					href="02-login">Login</a></li>
				<li class="nav-item mr-3"><a class="nav-link" href="03-home">Home</a></li>
				<li class="nav-item mr-3"><a class="nav-link"
					href="06-crea-treno">Crea Treno</a></li>

			</ul>
		</div>
		</div>

	</nav>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">

				<!-- Form di Login -->
				<div id="loginForm">
					<h2>Login</h2>
					<form:form method="POST" action="doLogin" 
						class="form-group" modelAttribute="utente">
						<input type="text" name="email" placeholder="E-mail" id="emailInput"
							class="form-control mb-2" required> 
						<input type="password" name="password" placeholder="Password" id="passwordInput"
							class="form-control mb-2" required>
						<button type="submit" class="btn btn-primary btn-block">Accedi</button>
						<p class="mt-2">
							Non sei ancora registrato? <a href="#"
								onclick="showRegisterForm()">Registrati qui</a>
						</p>
					</form:form>
				</div>

				<!-- Form di Registrazione -->
				<div id="registerForm" style="display: none;">
					<h2>Registrazione</h2>
					<form:form action="doRegister" method="POST" class="form-group" ModelAttribute="utente">
						<input type="text" name="nome" placeholder="Nome"
							class="form-control mb-2" required>
							<input type="text" name="cognome" placeholder="Cognome"
							class="form-control mb-2" required>
							<input type="email"
							name="email" placeholder="Email" class="form-control mb-2"
							required>
							<input type="text" name="profilePic" placeholder="Aggiungi url immagine profilo"
							class="form-control mb-2" required>
							 <input
							type="password" name="password" placeholder="Password"
							class="form-control mb-2" required> 
						<button type="submit" class="btn btn-success btn-block">Registra</button>
					</form:form>
					<button onclick="showLoginForm()"
						class="btn btn-secondary btn-block mt-2">Indietro</button>
				</div>

			</div>
		</div>
	</div>
	<script src="<c:url value='/resources/js/02-login.js'/>"></script>
</body>
</html>
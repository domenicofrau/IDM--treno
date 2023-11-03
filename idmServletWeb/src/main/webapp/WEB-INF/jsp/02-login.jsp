<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1" />
		<title>TrainBook - Login</title>
		<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon"/>
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"/>
		<!-- Custom CSS -->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/navbar.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/01-welcome.css'/>"/>
	</head>
	<body>
		<!-- NAVBAR -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="01-welcome">
				<img src="<c:url value='/resources/img/logo_nav.png'/>" alt="" class="logo-nav"/>
			</a>
			<!-- Center -->
			<div id="navbarNav" class="collapse navbar-collapse justify-content-center">
				<ul class="navbar-nav align-items-center">
					<li class="nav-item mr-3">
					<a class="nav-link" href="01-welcome">Welcome</a></li>
					<li class="nav-item mr-3 active">
					<a class="nav-link" href="02-login">Login</a></li>
				</ul>
			</div>
		</nav>
		<div class="container mt-5">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<!-- LOGIN -->
					<div id="loginForm">
						<h2>Login</h2>
						<form:form class="form-group" action="doLogin" method="POST" modelAttribute="utente">
							<input class="form-control mb-2" type="text" name="email" placeholder="Email" required/>
							<input class="form-control mb-2" type="password" name="password" placeholder="Password" required />
							<button class="btn btn-primary btn-block" type="submit">Accedi</button>
							<p class="mt-2">Non sei ancora registrato?<a href="" onclick="showRegisterForm()">Registrati qui</a></p>
						</form:form>
					</div>
					<!-- REGISTRAZIONE -->
					<div id="registerForm" style="display: none">
						<h2>Registrazione</h2>
						<form action="doRegister" method="post" class="form-group">
							<input class="form-control mb-2" type="text" name="username" placeholder="Nome utente" required />
							<input class="form-control mb-2" type="password" name="password" placeholder="Password" required />
							<input class="form-control mb-2" type="email" name="email" placeholder="Email" required />
							<button class="btn btn-success btn-block" type="submit">Registra</button>
						</form>
						<button class="btn btn-secondary btn-block mt-2" onclick="showLoginForm()">Indietro</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Bootstrap JS -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<!-- Custom JS -->
		<script src="<c:url value='/resources/js/login.js'/>"></script>
	</body>
</html>

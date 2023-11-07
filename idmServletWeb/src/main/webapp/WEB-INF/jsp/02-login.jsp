<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1" />
		<title>TrainBook -</title>
		<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon"/>
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"/>
		<!-- Custom CSS -->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/navbar.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/login.css'/>"/>
	</head>
	<body>
		<!-- NAVBAR -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
			<a class="navbar-brand" href="01-welcome">
				<img class="logo-nav" src="<c:url value='/resources/img/logo_nav.png'/>" alt=""/>
			</a>
			<!-- Center -->
			<div id="navbarNav" class="collapse navbar-collapse justify-content-center">
				<ul class="navbar-nav align-items-center">
					<li class="nav-item mr-3">
						<a class="nav-link" href="01-welcome">Welcome</a></li>
					<li class="nav-item mr-3 active">
						<a class="nav-link" href="02-login">Login</a></li>
					<li class="nav-item mr-3">
			            <a class="nav-link" href="07-about">About</a></li>
				</ul>
			</div>
		</nav>
		<div class="container mt-5">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<!-- LOGIN -->
					<div id="loginForm">
						<h2 class="mb-4">Login</h2>
						<form:form class="form-group" action="doLogin" method="POST" modelAttribute="utente">
							<input class="form-control mb-4" type="text" name="email" placeholder="Email" required/>
							<input class="form-control mb-5" type="password" name="password" placeholder="Password" required />
							<button class="btn btn-primary btn-block mb-2" type="submit">Accedi</button>
							<p class="mt-2">Non sei ancora registrato? <a class="registrati text-primary registrati" onclick="showRegisterForm()">Registrati qui</a></p>
						</form:form>
					</div>
					<!-- REGISTRAZIONE -->
					<div id="registerForm" style="display: none">
						<h2 class="mb-4">Registrazione</h2>
						<form action="doRegister" method="POST" class="form-group" modelAttribute="utente">
							<img id="profilePicPreview" class="profile-pic-preview mb-4" src="<c:url value='/resources/img/standard-user.png'/>" alt="Anteprima" data-default-src="<c:url value='/resources/img/standard-user.png'/>" onerror="this.onerror=null; this.src=this.getAttribute('data-default-src');">
							<input class="form-control mb-4" type="text" name="nome" placeholder="Nome" required />
							<input class="form-control mb-4" type="text" name="cognome" placeholder="Cognome" required />
							<select id="nazione" class="form-control mb-4" name="nazione" required></select>
							<input class="form-control mb-4" type="email" name="email" placeholder="Email" required />
							<input class="form-control mb-4" type="password" name="password" placeholder="Password" required />
							<input class="form-control mb-5" type="text" name="profilePic" placeholder="Aggiungi url per la tua immagine profilo" oninput="updateProfilePicPreview()" required />
							<button class="btn btn-success btn-block" type="submit">Registrati</button>
						</form>
						<button class="btn btn-secondary btn-block mt-2" onclick="showLoginForm()">Vai alla pagina di Login</button>
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
		<script src="<c:url value='/resources/js/nazionalit.js'/>"></script>
	</body>
</html>
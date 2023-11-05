<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@400;500;600;700;800;900&display=swap');

body {
    font-family: 'Raleway', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.main-content {
    padding: 60px 20px;
    text-align: center;
    background-color: rgba(0, 0, 0, 0.5);
    margin: 50px auto;
    max-width: 800px;
    border-radius: 8px;
}

.main-content h1 {
    font-size: 2.5em;
    margin-bottom: 20px;
}

.main-content p {
    font-size: 1.2em;
    line-height: 1.5;
}

.train-image {
	height: 200px;
	width: 100%;
	object-fit: cover;
}

.logo-frecciarossa {
	height: 17px;
	width: auto;
	margin-right: 5px;
}

.logo-trenord {
	height: 10px;
	width: auto;
	margin-right: 5px;
}

.bit-train-icon {
	height: 20px;
	object-fit: cover;
	margin-right: 4px;
}
.hidden {
    display: none;
}

.preview {
    height: 100px;
}
#searchIcon:hover {
	cursor: pointer !important;
}

#criteriaForm {
	border: 1px solid black;
	border-radius: 10px;
}

#closeIcon:hover {
	cursor: pointer !important;
}

.input-group {
	margin-bottom: 0 !important;
}
.mainTitle{
	font-weight: 800;
	font-size: 5rem;
}

.mainSubTitle{
	font-size: 1.6rem;
}
.form-container {
	margin: 20px auto;
	text-align: left;
	max-width: 400px;
}

.input-group {
	margin-bottom: 20px;
}

.input-group label {
	display: block;
	margin-bottom: 10px;
}

.input-group input {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.input-group button {
	background-color: #007BFF;
	color: #FFF;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: 0.3s;
}

.input-group button:hover {
	background-color: #0056b3;
}
.navbar {
	background-color: rgba(0, 0, 0, 0.5);
	overflow: hidden;
	padding: 10px 0;
}

.navbar .navbar-brand {
	padding-right: 50px;
}

.navbar a {
	
	float: left;
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-weight: bold;
	transition: 0.3s;
}

.navbar a:hover {
	background-color: rgba(255, 255, 255, 0.2);
}

.navbar a.right {
	float: right;
}

.logo-nav {
	vertical-align: middle;
	margin: 0 10px;
	height: 30px;
}

.nav-item-icon {
	height: 20px;
	object-fit: cover;
	margin-right: 4px;
}

.profile-image {
	width: 30px;
	height: 30px;
	object-fit: cover;
	margin-right: 10px;
	border-radius: 50%;
}

.navbar-nav-adjust {
	padding-left: 50px;
}

.sticky-top {
  position: -webkit-sticky;
  position: sticky;
  top: 0px; 
}
.navbar {
	background-color: rgba(0, 0, 0, 0.5);
	overflow: hidden;
	padding: 10px 0;
}

.navbar .navbar-brand {
	padding-right: 50px;
}

.navbar a {
	
	float: left;
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-weight: bold;
	transition: 0.3s;
}

.navbar a:hover {
	background-color: rgba(255, 255, 255, 0.2);
}

.navbar a.right {
	float: right;
}

.logo-nav {
	vertical-align: middle;
	margin: 0 10px;
	height: 30px;
}

.nav-item-icon {
	height: 20px;
	object-fit: cover;
	margin-right: 4px;
}

.profile-image {
	width: 30px;
	height: 30px;
	object-fit: cover;
	margin-right: 10px;
	border-radius: 50%;
}

.navbar-nav-adjust {
	padding-left: 50px;
}

.sticky-top {
  position: -webkit-sticky;
  position: sticky;
  top: 0px; 
}</style>
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
							<p class="mt-2">Non sei ancora registrato? <a href="" onclick="showRegisterForm()">Registrati qui</a></p>
						</form:form>
					</div>
					<!-- REGISTRAZIONE -->
					<div id="registerForm" style="display: none">
						<h2 class="mb-4">Registrazione</h2>
						<form action="doRegister" method="post" class="form-group">
							<input class="form-control mb-3" type="text" name="username" placeholder="Nome utente" required />
							<input class="form-control mb-3" type="password" name="password" placeholder="Password" required />
							<input class="form-control mb-3" type="email" name="email" placeholder="Email" required />
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
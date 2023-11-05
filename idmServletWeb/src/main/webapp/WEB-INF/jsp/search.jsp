<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<meta charset="UTF-8">
		<title>TrainBook - Search</title>
		<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon">
		<!-- Bootstrap CSS -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
		<!-- Custom CSS -->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/navbar.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/criteriaForm.css'/>">
	</head>
	<body>
		<!-- NAVBAR -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
			<a class="navbar-brand" href="03-home">
				<img class="logo-nav" src="<c:url value='/resources/img/logo_nav.png'/>" alt=""/>
			</a>
			<!-- centro -->
			<div id="navbarNav" class="collapse navbar-collapse justify-content-center">
				<ul class="navbar-nav align-items-center">
					<c:if test="${empty loggedInUser.nome}">
						<li class="nav-item mr-3"><a class="nav-link" href="01-welcome">Welcome</a></li>
						<li class="nav-item mr-3"><a class="nav-link" href="02-login">Login</a></li>
					</c:if>
					<li class="nav-item mr-3"><a class="nav-link" href="03-home">Home</a></li>
					<li class="nav-item mr-3"><a class="nav-link" href="06-crea-treno">Crea Treno</a></li>
					<li id="searchIcon" class="nav-item mr-3"><i class="ms-3 bi bi-search text-secondary"></i></li>                  
				</ul>
			</div>
			<!-- destra -->
			<div class="navbar-nav ml-auto navbar-nav-adjust">
				<div class="nav-item d-flex align-items-center">
					<a class="nav-link d-inline mr-1" href="04-profile">${loggedInUser.nome}</a>
					<a class="nav-link d-inline mr-1" href="04-profile">${loggedInUser.bitTrain}</a>
					<img class="nav-item-icon" src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain">
					<a href="04-profile">
						<img class="profile-image" src="<c:url value='/resources/img/profile-test.jpg'/>" alt="profilo">
					</a>
				</div>
			</div>
		</nav>
		<div class="container mt-5">
			<!-- CRITERIA FORM DI RICERCA -->
			<div id="criteriaForm" class="container my-3 p-4 d-none">
				<form action="search" method="GET">
					<div class="form-row">
						<div class="col-md-8">
							<input id="nome" class="form-control" type="text" name="nome" placeholder="Cerca...">
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<label class="input-group-text" for="inputGroupSelect01">Marca:</label>
								</div>
								<select id="inputGroupSelect01" class="custom-select" name="marca">
									<option selected>FrecciaRossa</option>
									<option value="1">TreNord</option>
								</select>
							</div>
						</div>
						<div class="col-md-1 d-flex justify-content-end">
							<button class="btn btn-dark" type="submit">Cerca</button>
						</div>
					</div>
				</form>
			</div>
			<div class="feed-section">
				<h2 class="my-3 text-center font-weight-bold">Risultati della ricerca</h2>
				<c:if test="${ empty criteria }">
					<h3 class="my-3 text-center font-weight-bold">Nessun treno trovato... Prova con altri parametri!</h3>
				</c:if>
				<div class="train-cards row mt-4">
					<c:forEach var="treni" items="${ criteria }">
						<c:set var="sommaPesi" value="0" />			
						<c:forEach var="vagone" items="${treni.vagoni}">
							<c:set var="sommaPesi" value="${sommaPesi + vagone.peso}" />
						</c:forEach>
						<div class="col-md-6">
							<div class="card mb-4">
								<div class="card-body">
									<c:if test="${ empty treni.immagine }">
										<img class="img-fluid mb-3" src="<c:url value='/resources/img/train.jpg'/>" alt="Immagine Treno placeholder">
									</c:if>
									<img class="img-fluid mb-3" src="${ treni.immagine }">
									<h4 class="font-weight-bold">NOME: ${ treni.nome }</h4>
									<p>MARCA: ${ treni.marca }</p>
									<p>PESO TOTALE DEL TRENO: ${ sommaPesi } tonnellate</p>
									<p>AUTORE: ${treni.utente.nome } ${treni.utente.cognome }</p>
									<c:set var="trenoID" value="${ treni.id }" />
									<a class="btn btn-dark mt-4" href="cerca-treno?idTrenoStr=${ treni.id }">Dettagli</a>
									<button class="btn btn-outline-dark mt-4">Aggiungi</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<!-- Custom JS -->
		<script src="<c:url value='/resources/js/find.js'/>"></script>
		
	</body>
</html>
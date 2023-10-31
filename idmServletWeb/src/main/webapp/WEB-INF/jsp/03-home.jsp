<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<title>Feed - TrainBook</title>
<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>"
	type="image/x-icon">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/feed-style.css'/>">
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

			<!-- Link a destra -->
			<div class="navbar-nav ml-auto" style="padding-left: 50px;">
				<div class="nav-item d-flex align-items-center">
					<a class="nav-link d-inline mr-1" href="04-profile">${utente.nome}
						${utente.cognome}</a> <a href="04-profile">
						<img src="<c:url value='/resources/img/profile-test.jpg'/>"
						alt="profilo" class="rounded-circle"
						style="width: 30px; height: 30px; object-fit: cover; margin-right: 10px;">
					</a>
				</div>
			</div>
		</div>
	</nav>



	<div class="container mt-5">
		<div class="feed-section">
			<h1>FEED</h1>
			<div class="create-train">
				<h3>Crea il tuo treno</h3>
				<div class="train-form">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="NOME">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="MARCA">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="PESO TOTALE">
					</div>
					<button type="submit" class="btn btn-primary">Aggiungi</button>
				</div>
			</div>

			<h2 class="my-3 text-center font-weight-bold">Treni caricati da
				altri utenti</h2>

			<div class="train-cards row mt-4">

				<c:forEach var="treni" items="${ treni }">

					<div class="col-md-6">
						<div class="card mb-4">
							<div class="card-body">
								<img src="<c:url value='/resources/img/train.jpg'/>"
									class="img-fluid mb-3">
								<h4 class="font-weight-bold">NOME TRENO</h4>
								<p>${ treni.marca }</p>
								<p>PESO TOTALE DEL TRENO</p>
								<p>AUTORE: ${treni.utente.nome } ${treni.utente.cognome }</p>
								<c:set var="trenoID" value="${ treni.id }" />

								<button class="btn btn-primary mt-4">Aggiungi</button>
								<a href="cerca-treno?idTrenoStr=${ treni.id }"
									class="btn btn-primary stretched-link mt-4">Dettagli</a>
							</div>
						</div>
					</div>

				</c:forEach>

			</div>

			<button class="btn btn-secondary btn-lg btn-block mt-4">LOAD
				MORE...</button>

		</div>
		<button class="btn btn-secondary btn-lg btn-block mt-4">LOAD
			MORE...</button>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
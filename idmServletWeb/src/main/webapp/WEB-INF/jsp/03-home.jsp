<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<title>Feed - TrainBook</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/feed-style.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/01-welcome.css'/>">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="01-welcome"> <img src="logo.png"
			alt="" height="30" style="vertical-align: middle; margin: 0 10px;">
			TrainBook
		</a>

		<!-- Menu al centro -->
		<div class="collapse navbar-collapse justify-content-center"
			id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="01-welcome">Welcome</a></li>
				<li class="nav-item"><a class="nav-link" href="02-login">Login</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="03-home">Home</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="06-crea-treno">Crea
						Treno</a></li>
				<li class="nav-item"><a class="nav-link" href="cancella">Cancella
						Treno</a></li>
				<li class="nav-item"><a class="nav-link" href="cerca-treno">Cerca
						Treno</a>
			</ul>
		</div>

		<!-- Link a destra -->
		<div class="navbar-nav ml-auto">
			<a class="nav-item nav-link" href="04-profile">PROFILO</a>
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
			
			<h2 class="my-3 text-center font-weight-bold">Treni caricati da altri utenti</h2>
			
			<div class="train-cards row mt-4">
			
			<c:forEach var="treni" items="${ treni }">
        	 	
        	 	<div class="col-md-6">
					<div class="card mb-4">
						<div class="card-body">
							<img src="<c:url value='/resources/img/train.jpg'/>" class="img-fluid mb-3">
							<h4 class="font-weight-bold">NOME TRENO</h4>
							<p>${ treni.marca }</p>
							<p>PESO TOTALE DEL TRENO</p>
							<p>AUTORE: ${treni.utente.nome } ${treni.utente.cognome }</p>
							<c:set var="trenoID" value="${ treni.id }" />
							
							<button class="btn btn-primary mt-4">Aggiungi</button>
							<a href="cerca-treno?idTrenoStr=${ treni.id }" class="btn btn-primary stretched-link mt-4">Dettagli</a>
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
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
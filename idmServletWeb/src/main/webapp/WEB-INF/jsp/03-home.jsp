<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="UTF-8">
		<title>TrainBook - Feed</title>
		<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon">
		<!-- Bootstrap CSS -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
		<!-- Custom CSS -->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/01-welcome.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/navbar.css'/>">
	</head>
	<body>
		<!-- NAVBAR -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="03-home">
				<img class="logo-nav" src="<c:url value='/resources/img/logo_nav.png'/>" alt=""/>
			</a>
			<!-- centro -->
			<div id="navbarNav" class="collapse navbar-collapse justify-content-center" >
				<ul class="navbar-nav align-items-center">
					<c:if test="${empty loggedInUser.nome}">
						<li class="nav-item mr-3"><a class="nav-link" href="01-welcome">Welcome</a></li>
						<li class="nav-item mr-3"><a class="nav-link" href="02-login">Login</a></li>
					</c:if>
					<li class="nav-item mr-3 active"><a class="nav-link" href="03-home">Home</a></li>
					<li class="nav-item mr-3"><a class="nav-link" href="06-crea-treno">Crea Treno</a></li>
					<li id="searchIcon" class="nav-item mr-3"><i class="ms-3 bi bi-search text-secondary"></i></li>                  
				</ul>
			</div>
			<!-- destra -->
		   	<div class="navbar-nav ml-auto navbar-nav-adjust">
				<div class="nav-item d-flex align-items-center">
					<b>${loggedInUser.nome}</b>
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
			<div id="criteriaForm" class="row my-3 p-4 d-none">
				<form class="form-inline" action="search" method="GET">
	 				 <div class="form-group">
	    				<label for="nome">Nome del treno: </label>
	   				 	<input id="nome" class="form-control mx-3" type="text" name="nome" placeholder="Nome del treno">
	   				 	<div class="input-group mb-3">
	  						<div class="input-group-prepend">
	    						<label class="input-group-text" for="inputGroupSelect01">Marca:</label>
	  						</div>
	  						<select id="inputGroupSelect01" class="custom-select" name="marca">
	   							<option selected>FrecciaRossa</option>
	   							<option value="1">TreNord</option>
	  						</select>
						</div>
	  				 	<button class="btn btn-dark mx-3" type="submit">Submit</button>
	 				 </div>
				</form>
				<i id="closeIcon" class="ms-3 bi bi-x fs-1"></i>
			</div>
			<!-- FEED -->
			<div class="feed-section">
				<h2 class="my-3 text-center font-weight-bold">Treni caricati da altri utenti</h2>
				<c:if test="${ empty treni }">
					<h2 class="my-3 text-center font-weight-bold">Non ci sono treni da vedere al momento</h2>		
					<a class="nav-link" href="06-crea-treno">Creane uno tu!</a>	
				</c:if>
				<div class="train-cards row mt-4">
					<c:forEach var="treni" items="${ treni }">
						<c:set var="sommaPesi" value="0" />
						<c:forEach var="vagone" items="${treni.vagoni}">
							<c:set var="sommaPesi" value="${sommaPesi + vagone.peso}" />
						</c:forEach>
						<div class="col-md-6">
							<div class="card mb-4">
								<div class="card-body">
									<c:if test="${ empty treni.immagine }">
										<img class="img-fluid mb-3"src="<c:url value='/resources/img/train.jpg'/>" alt="Immagine Treno placeholder">
									</c:if>
									<img class="img-fluid train-image mb-3" src="${treni.immagine}" alt="Train image">
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
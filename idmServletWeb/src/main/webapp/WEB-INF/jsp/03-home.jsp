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
			<!-- FEED -->
			<div class="feed-section">
				<c:if test="${ empty treni }">
					<div class="text-center">
						<h2 class="my-3 text-secondary font-weight-bold">Non ci sono treni da vedere al momento</h2>
						<a class="nav-link" href="06-crea-treno">Creane uno tu!</a>
					</div>
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
				                        <img class="img-fluid mb-3" src="<c:url value='/resources/img/train.jpg'/>" alt="Immagine Treno placeholder">
				                    </c:if>
				                    <img class="img-fluid train-image mb-3" src="${treni.immagine}" alt="Train image">
				                    
				                    <!-- Inserimento del segnalibro "in vendita" -->
				                    <c:set var="inVenditaAsBoolean" value="${Boolean.parseBoolean(treni.inVendita)}" />
									<c:if test="${inVenditaAsBoolean}">
									    <div class="ribbon-wrapper-green">
									        <div class="ribbon-green">IN VENDITA</div>
									    </div>
									</c:if>
				                    
				                    <h4 class="font-weight-bold text-truncate">${ treni.nome }</h4>
				                    <p class="mt-3 card-text">MARCA:
				                        <c:if test="${ treni.marca == 'FrecciaRossa' }">
				                            <img class="logo-frecciarossa" src="https://upload.wikimedia.org/wikipedia/it/4/4f/Treno_Frecciarossa_Logo.png" alt="FrecciaRossa"/>
				                        </c:if>
				                        <c:if test="${ treni.marca == 'TreNord' }">
				                            <img class="logo-trenord" src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Trenord_Logo.svg/2560px-Trenord_Logo.svg.png" alt="TreNord"/>
				                        </c:if>                             
				                    </p>
				                    <p>PESO: ${ sommaPesi } tonnellate</p>
				                    <p>AUTORE: ${treni.utente.nome } ${treni.utente.cognome }</p>
				                    <c:set var="trenoID" value="${ treni.id }" />
				                   	<div class="d-flex justify-content-between">
							            <a class="btn btn-light btn-outline-primary mt-4" href="cerca-treno?idTrenoStr=${ treni.id }">Dettagli</a>
						                <c:if test="${treni.inVendita && !loggedInUser.nome.equals(treni.utente.nome)}">
						                    <button class="btn btn-light btn-outline-success mt-4">Compra per ${ treni.prezzoTotale } <img class="bit-train-icon" src="<c:url value='/resources/img/bitTrain.png'/>"></button>
						                </c:if>
								    </div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
			<div id="criteriaForm" class="container my-3 p-4">
				<form:form action="search" method="GET" modelAttribute="treno">
					<div class="form-row">
						<div class="col-md-8">
							<input id="nome" class="form-control" type="text" name="nomeLike" placeholder="Cerca..." value="${ params.nomeLike }">
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<label class="input-group-text" for="inputGroupSelect01">Marca:</label>
								</div>
								<select id="inputGroupSelect01" class="custom-select" name="marca">
									<option value="${ params.marca }">${ params.marca }</option>
									<option value="tutte">Tutte</option>
									<option value="FrecciaRossa">FrecciaRossa</option>
									<option value="TreNord">TreNord</option>  
								</select>
							</div>
						</div>
					</div>
					<div class="form-row mt-3">
						<div class="form-group col-md-6">
								<label for="regione">Regione:</label> 
								<select id="regione" class="form-control" name="regione">
								<option value="${ params.regione }">${ params.regione }</option>
								<option value="tutte">Tutte</option>
								</select>
						</div>
						<div class="col-md-2">
      						<label for="prezzoMin">Prezzo Minimo</label>
      						<input type="number" class="form-control" name="prezzoMin" id="prezzoMin" min="0" max="3000" value="${ params.prezzoMin }" step="5">
   						</div>
						<div class="col-md-2">
      						<label for="prezzoMax">Prezzo Massimo</label>
      						<input type="number" class="form-control" name="prezzoMax" id="prezzoMax" min="0" max="3000" value="${ params.prezzoMax }" step="5">
   						</div>  
   						</div>
   						<div class="row">
   							
   								<c:if test="${ params.inVendita == true }">
   								<div class="form-check mx-3 mt-2">
  								    <input class="form-check-input" type="radio" name="inVendita" id="inVendita" value="true" checked>
  								    <label class="form-check-label" for="inVendita">In vendita</label>
  								</div>
  								 <div class="form-check mx-3 mt-2">
 							 		<input class="form-check-input" type="radio" name="inVendita" id="notInnVendita" value="false">
 							 		<label class="form-check-label" for="notInnVendita">Non in vendita</label>
							    </div>	
								</c:if>
								
								<c:if test="${ params.inVendita == false }">
   								<div class="form-check mx-3 mt-2">
  								    <input class="form-check-input" type="radio" name="inVendita" id="inVendita" value="true">
  								    <label class="form-check-label" for="inVendita">In vendita</label>
  								 </div>
  								 <div class="form-check mx-3 mt-2">
 							 	   <input class="form-check-input" type="radio" name="inVendita" id="notInnVendita" value="false" checked>
 							 	   <label class="form-check-label" for="notInnVendita">Non in vendita</label>
							    </div>	
								</c:if>

											
							<div class="col p-0">
						 	 <button class="btn btn-dark" type="submit">Cerca</button>
							</div>
   						</div>  						
				</form:form>
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
		<script src="<c:url value='/resources/js/regioni.js'/>"></script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>TrainBook - Profilo</title>
		<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>"  type="image/x-icon">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
		<!-- Custom CSS -->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/navbar.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/criteriaForm.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/profilo.css'/>">
	</head>
		<c:if test="${empty loggedInUser.nome}">
	    	<c:redirect url="01-welcome"/>
		</c:if>
	<body data-nazione="${loggedInUser.nazione}">
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
			            <img class="profile-image" src="<c:url value='${loggedInUser.immagineProfilo}'/>">
					</a>
				</div>
			</div>
		</nav>
		<div class="container mt-5">
			<!-- CRITERIA FORM DI RICERCA -->
			<div id="criteriaForm" class="container my-3 p-4 d-none">
				<form:form action="search" method="GET" modelAttribute="treno">
					<div class="form-row">
						<div class="col-md-8">
							<input id="nome" class="form-control" type="text" name="nomeLike" placeholder="Cerca..." value="">
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<label class="input-group-text" for="inputGroupSelect01">Marca:</label>
								</div>
								<select id="inputGroupSelect01" class="custom-select" name="marca">
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
								<option value="tutte">Tutte</option>
								</select>
						</div>
						<div class="col-md-2">
      						<label for="prezzoMin">Prezzo Minimo</label>
      						<input type="number" class="form-control" name="prezzoMin" id="prezzoMin" min="0" max="3000" value="0" step="5">
   						</div>
						<div class="col-md-2">
      						<label for="prezzoMax">Prezzo Massimo</label>
      						<input type="number" class="form-control" name="prezzoMax" id="prezzoMax" min="0" max="3000" value="3000" step="5">
   						</div>  
   						</div>
   						<div class="row">
   							<div class="form-check mx-3 mt-2">
  								<input class="form-check-input" type="radio" name="inVendita" id="inVendita" value="true" checked>
  								<label class="form-check-label" for="inVendita">
    						   	  In vendita
 							 	</label>
							</div>
							<div class="form-check mx-3 mt-2">
 							 	<input class="form-check-input" type="radio" name="inVendita" id="notInnVendita" value="false">
 							 	<label class="form-check-label" for="notInnVendita">
 							      Non in vendita
 								 </label>
							</div>					
							<div class="col p-0">
						 	 <button class="btn btn-dark" type="submit">Cerca</button>
							</div>
   						</div>  						
				</form:form>
			</div>
			<!-- SEZIONE PROFILO -->
			<c:if test="${not empty error}">
	    			<div class="text-center">
						<h2 class="my-3 text-secondary font-weight-bold">${ error }</h2>
						<a class="nav-link" href="03-home">Torna alla Home</a>
					</div>
			</c:if>
			
			<div class="row">
			
			<c:if test="${not empty utente}">
	    			
	    			<div id="sticky" class="col-md-5 text-center">
					<div class="d-inline-block profile-u">
					    <img class="" src="<c:url value='${utente.immagineProfilo}'/>" alt="Profilo">
					</div>
					<h3 class="mt-3">${utente.nome} ${utente.cognome}</h3>
					<h6>${utente.email}</h6>
					<img class="rounded-circle img-flag mb-3" src="" data-toggle="" data-placement="" title="">
					<p class="saldo-bittrain">saldo BitTrain: 
						<b>${utente.bitTrain} </b>
						<img class="bit-train-icon" src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain">
					</p>
					
				</div>
	    			
	    			
			</c:if>
				
				
				<!-- SEZIONE TRENI -->
				<c:if test="${not empty treni }">
				
					<div id="non-sticky" class="col-md-7">
					<h2>I treni di ${ utente.nome }</h2>
					<div class="row mt-5">
						<c:if test="${empty treni}">
							<div>
								<h6 class="pl-3 text-secondary">${ utente.nome } non ha treni da mostrare al momento</h6>
							</div>
						</c:if>
						<c:forEach var="treni" items="${ treni }">
						    <div class="col-md-6">
						        <div class="card mb-4">
						            <div class="card-body">

						                <h5 class="card-title text-truncate">
						                    <b>${treni.nome}</b>
						                </h5>
						                <c:choose>
						                    <c:when test="${treni.marca == 'FrecciaRossa'}">
						                        <img class="logo-frecciarossa mb-2" src="https://upload.wikimedia.org/wikipedia/it/4/4f/Treno_Frecciarossa_Logo.png" alt="FrecciaRossa">
						                    </c:when>
						                    <c:when test="${treni.marca == 'TreNord'}">
						                        <img class="logo-trenord mb-2" src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Trenord_Logo.svg/2560px-Trenord_Logo.svg.png" alt="TreNord">
						                    </c:when>
						                    <c:otherwise>
						                        <p class="card-text">${treni.marca}</p>
						                    </c:otherwise>
						                </c:choose>
										<img class="img-fluid train-image" src="${treni.immagine}" alt="Train image">
										<p class="mt-3 mb-2">Regione: ${treni.regione}</p>
										<p class="mb-5">
											<b> ${treni.prezzoTotale} </b>
											<img class="bit-train-icon" src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain" >
										</p>
										<div class="d-flex justify-content-between">
											<a class="btn btn-light btn-outline-primary" href="cerca-treno?idTrenoStr=${ treni.id }">Dettagli</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				
				</c:if>
				
			</div>
		</div>
	
		
		<!-- Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
		<!-- Custom JS -->
		<script src="<c:url value='/resources/js/find.js'/>"></script>
		<script src="<c:url value='/resources/js/bandierina.js'/>"></script>
	</body>
</html>
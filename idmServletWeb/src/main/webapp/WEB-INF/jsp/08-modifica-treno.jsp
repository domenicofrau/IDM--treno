<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>TrainBook - Dettaglio</title>
		<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>"  type="image/x-icon">
		<!-- Bootstrap CSS -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
		<!-- Custom CSS -->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/navbar.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/criteriaForm.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/dettaglio.css'/>">
	</head>
		<c:if test="${empty loggedInUser.nome}">
	    	<c:redirect url="01-welcome"/>
		</c:if>
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
					<li class="nav-item mr-3" id="searchIcon"><i class="ms-3 bi bi-search text-secondary"></i></li>                  
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
		<div class="container my-3">
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
						
			<c:if test="${not empty errore}">
				<div style="color: red;">
					<h3>${errore}</h3>
				</div>
			</c:if>
			<c:if test="${not empty treno}">
				<c:set var="sommaPesi" value="0" />
				<c:forEach var="vagone" items="${treno.vagoni}">
					<c:set var="sommaPesi" value="${sommaPesi + vagone.peso}" />
				</c:forEach>
				<c:set var="sommaPrezzi" value="0" />
				<c:forEach var="vagone" items="${treno.vagoni}">
					<c:set var="sommaPrezzi" value="${sommaPesi + vagone.prezzo}" />
				</c:forEach>
				<div class="row justify-content-center">
					<div class="col-8">
						<div class="card mb-3">
							<c:if test="${ empty treno.immagine }">
								<img src="<c:url value='/resources/img/train.jpg'/>"
									alt="Immagine Treno placeholder" class="img-fluid mb-3">
							</c:if>
							<img class="img-train" src="${ treno.immagine }" class="img-fluid mb-3">
							<div class="card-body">
								<h3 class="card-title mt-3 mb-4"><b>NOME:</b> ${ treno.nome }</h3>
								<p class="card-text"><b>MARCA:</b> 
									<c:if test="${ treno.marca == 'FrecciaRossa' }">
										<img src="https://upload.wikimedia.org/wikipedia/it/4/4f/Treno_Frecciarossa_Logo.png" alt="FrecciaRossa" class="logo-frecciarossa"/>
									</c:if>
									<c:if test="${ treno.marca == 'TreNord' }">
										<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Trenord_Logo.svg/2560px-Trenord_Logo.svg.png" alt="TreNord" class="logo-trenord"/>
									</c:if>								
								</p>
								<p class="card-text"><b>AUTORE:</b> ${ treno.utente.nome } ${ treno.utente.cognome }</p>
								<p class="card-text"><b>PREZZO TOTALE:</b> ${ treno.prezzoTotale } <img class="bit-train-icon" src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain"></p>
								<p class="card-text"><b>PESO TOTALE:</b> ${ sommaPesi } tonnellate</p>
							</div>
							<div class="card-body">
								<nav class="navbar navbar-expand-lg navbar-light bg-light">
									<div class="container-fluid">
										<div class="collapse navbar-collapse" id="navbarNav">
											<ul class="navbar-nav mx-auto justify-content-center">
												<li class="nav-item">
													<a class="nav-link" onclick="showDetails('locomotive', this)">Locomotive</a>
												</li>
												<c:if test="${not empty passeggeri}">
													<li class="nav-item">
														<a class="nav-link" onclick="showDetails('passeggeri', this)">Passeggeri</a>
													</li>
												</c:if>
												<c:if test="${ not empty passeggeriB}">
													<li class="nav-item">
														<a class="nav-link" onclick="showDetails('business', this)">Business</a>
													</li>
												</c:if>
												<c:if test="${ not empty ristoranti}">
													<li class="nav-item">
														<a class="nav-link" onclick="showDetails('ristoranti', this)">Ristoranti</a>
													</li>
												</c:if>
												<c:if test="${ not empty cargo}">
													<li class="nav-item">
														<a class="nav-link" onclick="showDetails('cargo', this)">Cargo</a>
													</li>
												</c:if>
											</ul>
										</div>
									</div>
								</nav>
								
								<div id="locomotive-details" class="category-details">
									<div class="row">
										<c:forEach var="locomotiva" items="${locomotive}">
											<div class="col-12 col-md-6 my-2">
												<div class="card">
													<div class="card-body">
														<p><b>PESO:</b> ${ locomotiva.peso } tonnellate</p>
														<p><b>PREZZO:</b> ${ locomotiva.prezzo } <img class="bit-train-icon" src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain"></p>
														<p><b>LUNGHEZZA:</b> ${ locomotiva.lunghezza } metri</p>
														<p><b>PESO TRAINABILE:</b> ${ locomotiva.pesoTrainabile } tonnellate</p>
														<button id="confirmDelete_locomotiva" class="btn btn-light btn-outline-danger" type="button">Elimina</button>
													</div>
												</div>
											</div>
										</c:forEach>
										<!-- Bottone Aggiungi (+) -->
										<div class="col-12 col-md-6 my-2">
											<div class="card">
												<div class="card-body d-flex justify-content-center align-items-center">
												
													<button class="add-vagone btn btn-light btn-outline-secondary my-3" type="button">
														<i class="bi bi-plus"></i>
													</button>
													
												</div>
											</div>
										</div>
									</div>
								</div>
								<c:if test="${not empty passeggeri}">
									<div id="passeggeri-details" class="category-details">
										<div class="row">
											<c:forEach var="passeggeri" items="${passeggeri}" varStatus="status">
												<div class="col-12 col-md-6 my-2">
													<div class="card">
														<div class="card-body">
															<p><b>PESO:</b> ${ passeggeri.peso } tonnellate</p>
															<p><b>PREZZO:</b> ${ passeggeri.prezzo } <img class="bit-train-icon" src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain"></p>
															<p><b>LUNGHEZZA:</b> ${ passeggeri.lunghezza } metri</p>
															<p><b>POSTI A SEDERE:</b> ${ passeggeri.postiNormali }</p>
															<p><b>POSTI PER DISABILI:</b> ${ passeggeri.postiDisabili }</p>
															<p><b>POSTI TOTALI A SEDERE:</b> ${ passeggeri.postiNormali + passeggeri.postiDisabili }</p>
															<p><b>PRESENZA SERVIZI:</b> ${ passeggeri.servizi }</p>
															<button id="confirmDelete_passeggeri" class="btn btn-light btn-outline-danger" type="button">Elimina</button>
														</div>
													</div>
												</div>
											</c:forEach>
											<!-- Bottone Aggiungi (+) -->
											<div class="col-12 col-md-6 my-2">
												<div class="card">
													<div class="card-body d-flex justify-content-center align-items-center">
													<form:form method="post" action="aggiungiPasseggeri" >
												    <input class="form-control mb-4" type="text" name="nomeTreno" value="${treno.nome}" style="display: none" />
												    <button class="add-vagone btn btn-light btn-outline-secondary my-3" type="submit">
												        <i class="bi bi-plus"></i>
												    </button>
													</form:form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${ not empty passeggeriB}">
									<div id="business-details" class="category-details">
										<div class="row">
											<c:forEach var="passeggeriB" items="${ passeggeriB }">
												<div class="col-12 col-md-6 my-2"">
													<div class="card">
														<div class="card-body">
															<p><b>PESO:</b> ${ passeggeriB.peso } tonnellate</p>
															<p><b>PREZZO:</b> ${ passeggeriB.prezzo } <img class="bit-train-icon" src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain"></p>
															<p><b>LUNGHEZZA:</b> ${ passeggeriB.lunghezza } metri</p>
															<p><b>POSTI A SEDERE:</b> ${ passeggeriB.postiNormali }</p>
															<p><b>POSTI PER DISABILI:</b> ${ passeggeriB.postiDisabili }</p>
															<p><b>POSTI TOTALI A SEDERE:</b> ${ passeggeriB.postiNormali + passeggeriB.postiDisabili }</p>
															<p><b>PRESENZA SERVIZI:</b> ${ passeggeriB.servizi }</p>
															<button id="confirmDelete_business" class="btn btn-light btn-outline-danger" type="button">Elimina</button>
														</div>
													</div>
												</div>
											</c:forEach>
											<!-- Bottone Aggiungi (+) -->
											<div class="col-12 col-md-6 my-2">
												<div class="card">
													<div class="card-body d-flex justify-content-center align-items-center">
														<form:form method="post" action="aggiungiBusiness" >
												    <input class="form-control mb-4" type="text" name="nomeTreno" value="${treno.nome}" style="display: none" />
												    <button class="add-vagone btn btn-light btn-outline-secondary my-3" type="submit">
												        <i class="bi bi-plus"></i>
												    </button>
													</form:form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${ not empty ristoranti}">
									<div id="ristoranti-details" class="category-details">
										<div class="row">
											<c:forEach var="ristorante" items="${ ristoranti }">
												<div class="col-12 col-md-6 my-2"">
													<div class="card">
														<div class="card-body">
															<p><b>PESO:</b> ${ ristorante.peso } tonnellate</p>
															<p><b>PREZZO:</b> ${ ristorante.prezzo } <img class="bit-train-icon" src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain"></p>
															<p><b>LUNGHEZZA:</b> ${ ristorante.lunghezza } metri</p>
															<p><b>NUMERO TAVOLI:</b> ${ ristorante.tavoli }</p>
															<p><b>POSTI TOTALI A SEDERE:</b> ${ ristorante.tavoli * 4 }</p>
															<p><b>PRESENZA SERVIZI:</b> ${ ristorante.servizi }</p>
															<button id="confirmDelete_ristoranti" class="btn btn-light btn-outline-danger" type="button">Elimina</button>
														</div>
													</div>
												</div>
											</c:forEach>
											<!-- Bottone Aggiungi (+) -->
											<div class="col-12 col-md-6 my-2">
												<div class="card">
													<div class="card-body d-flex justify-content-center align-items-center">
														<button class="add-vagone btn btn-light btn-outline-secondary my-3" type="button">
															<i class="bi bi-plus"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${ not empty cargo}">
									<div id="cargo-details" class="category-details">
										<div class="row">
											<c:forEach var="cargo" items="${ cargo }">
												<div class="col-12 col-md-6 my-2">
													<div class="card">
														<div class="card-body">
															<p><b>PESO:</b> ${ cargo.peso } tonnellate</p>
															<p><b>PREZZO:</b> ${ cargo.prezzo } <img class="bit-train-icon" src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain"></p>
															<p><b>LUNGHEZZA:</b> ${ cargo.lunghezza } metri</p>
															<p><b>MERCE:</b> ${ cargo.tipoMerce }</p>
															<button id="confirmDelete_cargo" class="btn btn-light btn-outline-danger" type="button">Elimina</button>
														</div>
													</div>
												</div>
											</c:forEach>
											<!-- Bottone Aggiungi (+) -->
											<div class="col-12 col-md-6 my-2">
												<div class="card">
													<div class="card-body d-flex justify-content-center align-items-center">
														<button class="add-vagone btn btn-light btn-outline-secondary my-3" type="button">
															<i class="bi bi-plus"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>	
			</c:if>
		</div>
		<!-- Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<!-- Custom JS -->
		<script src="<c:url value='/resources/js/find.js'/>"></script>
		<script src="<c:url value='/resources/js/dettaglio.js'/>"></script>
	</body>
</html>
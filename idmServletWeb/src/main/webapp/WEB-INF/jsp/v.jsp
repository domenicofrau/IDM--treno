<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	</head>
	<body>
		<!-- NAVBAR -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
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
						<img class="profile-image" src="<c:url value='/resources/img/profile-test.jpg'/>" alt="profilo">
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
				<h3 class="mainTitle text-center my-3">${ treno.nome }</h3>
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="card mb-3">
							<c:if test="${ empty treno.immagine }">
								<img src="<c:url value='/resources/img/train.jpg'/>"
									alt="Immagine Treno placeholder" class="img-fluid mb-3">
							</c:if>
							<img src="${ treno.immagine }" class="img-fluid mb-3">
							<div class="card-body">
								<h3 class="card-title"><b>NOME:</b> ${ treno.nome }</h3>
								<p class="card-text"><b>MARCA:</b> ${ treno.marca }</p>
								<p class="card-text"><b>AUTORE:</b> ${ treno.utente.nome } ${ treno.utente.cognome }</p>
								<p class="card-text"><b>PREZZO TOTALE:</b> ${ sommaPrezzi } bitTrain</p>
								<p class="card-text"><b>PESO TOTALE:</b> ${ sommaPesi } tonnellate</p>
								<p class="card-text"><b>SIGLA:</b> sigla</p>
							</div>
							<div class="card-body">
								<h3 class="card-title">
									<b>Dettaglio vagoni:</b>
								</h3>
								<div class="row">
									<div class="container">
										  <!-- Dropdown button -->
										  <div class="dropdown">
										    <button class="btn btn-primary dropdown-toggle btn-block" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										      Locomotive
										    </button>
										    <!-- Dropdown menu -->
										    <div class="dropdown-menu mt-3" aria-labelledby="dropdownMenuButton">
										      <c:forEach var="locomotiva" items="${locomotive}">
										        <a class="dropdown-item" href="#">
										          <p><b>Peso:</b> ${locomotiva.peso} tonnellate</p>
										          <p><b>Prezzo:</b> ${locomotiva.prezzo} bitTrain</p>
										          <p><b>Lunghezza:</b> ${locomotiva.lunghezza} metri</p>
										          <p><b>Peso Trainabile:</b> ${locomotiva.pesoTrainabile} tonnellate</p>
										        </a>
										      </c:forEach>
										    </div>
										  </div>
										</div>
									<c:if test="${ not empty passeggeri}">
										<div class="container">
										  <!-- Dropdown button -->
										  <div class="dropdown">
										    <button class="btn btn-primary dropdown-toggle btn-block" type="button" id="dropdownMenuButtonPasseggeri" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										      Vagoni Passeggeri
										    </button>
										    <!-- Dropdown menu -->
										    <div class="dropdown-menu w-100 p-2" aria-labelledby="dropdownMenuButtonPasseggeri"> <!-- Aggiunto p-2 per un padding attorno alla griglia -->
										      <div class="row">
										        <c:forEach var="passeggeri" items="${passeggeri}" varStatus="status">
										          <!-- Se l'indice è divisibile per 4, chiudi e riapri la riga per un nuovo set di 4 elementi. -->
										          <c:if test="${status.index % 4 == 0 && !status.first}">
										            </div><div class="row">
										          </c:if>
										          <div class="col-3 mb-2"> <!-- Aggiunto mb-2 per margine sotto ogni elemento -->
										            <a class="dropdown-item p-2 border border-1 rounded" href="#"> <!-- Aggiunte classi per bordo e arrotondamento -->
										              <div class="vagone-content"> <!-- Aggiunto div per contenuto vagone -->
										                <p><b>Peso:</b> ${passeggeri.peso} tonnellate</p>
										                <p><b>Prezzo:</b> ${passeggeri.prezzo} bitTrain</p>
										                <p><b>Lunghezza:</b> ${passeggeri.lunghezza} metri</p>
										                <p><b>Posti a sedere:</b> ${passeggeri.postiNormali}</p>
										                <p><b>Posti per disabili:</b> ${passeggeri.postiDisabili}</p>
										                <p><b>Posti totali a sedere:</b> ${passeggeri.postiNormali + passeggeri.postiDisabili}</p>
										                <p><b>Presenza servizi:</b> ${passeggeri.servizi}</p>
										              </div>
										            </a>
										          </div>
										        </c:forEach>
										      </div>
										    </div>
										  </div>
										</div>
									</c:if>
									<c:if test="${ not empty passeggeriB}">
										<div class="container">
										  <!-- Dropdown button -->
										  <div class="dropdown">
										    <button class="btn btn-primary dropdown-toggle btn-block" type="button" id="dropdownMenuButtonPasseggeriB" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										      Vagoni Passeggeri Business
										    </button>
										    <!-- Dropdown menu -->
										    <div class="dropdown-menu w-100 p-2" aria-labelledby="dropdownMenuButtonPasseggeriB">
										      <div class="row">
										        <c:forEach var="passeggeriB" items="${passeggeriB}" varStatus="status">
										          <!-- Se l'indice è divisibile per 4, chiudi e riapri la riga per un nuovo set di 4 elementi. -->
										          <c:if test="${status.index % 4 == 0 && !status.first}">
										            </div><div class="row">
										          </c:if>
										          <div class="col-3 mb-2">
										            <a class="dropdown-item p-2 border border-1 rounded" href="#">
										              <div class="vagone-content">
										                <p><b>Peso:</b> ${passeggeriB.peso} tonnellate</p>
										                <p><b>Prezzo:</b> ${passeggeriB.prezzo} bitTrain</p>
										                <p><b>Lunghezza:</b> ${passeggeriB.lunghezza} metri</p>
										                <p><b>Posti a sedere:</b> ${passeggeriB.postiNormali}</p>
										                <p><b>Posti per disabili:</b> ${passeggeriB.postiDisabili}</p>
										                <p><b>Posti totali a sedere:</b> ${passeggeriB.postiNormali + passeggeriB.postiDisabili}</p>
										                <p><b>Presenza servizi:</b> ${passeggeriB.servizi}</p>
										              </div>
										            </a>
										          </div>
										        </c:forEach>
										      </div>
										    </div>
										  </div>
										</div>
									</c:if>
									<c:if test="${ not empty ristoranti}">
										<div class="container">
										  <!-- Dropdown button -->
										  <div class="dropdown">
										    <button class="btn btn-primary dropdown-toggle btn-block" type="button" id="dropdownMenuButtonRistoranti" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										      Vagoni Ristorante
										    </button>
										    <!-- Dropdown menu -->
										    <div class="dropdown-menu w-100 p-2" aria-labelledby="dropdownMenuButtonRistoranti">
										      <div class="row">
										        <c:forEach var="ristorante" items="${ristoranti}" varStatus="status">
										          <!-- Se l'indice è divisibile per 4, chiudi e riapri la riga per un nuovo set di 4 elementi. -->
										          <c:if test="${status.index % 4 == 0 && !status.first}">
										            </div><div class="row">
										          </c:if>
										          <div class="col-3 mb-2">
										            <a class="dropdown-item p-2 border border-1 rounded" href="#">
										              <div class="vagone-content">
										                <p><b>Peso:</b> ${ristorante.peso} tonnellate</p>
										                <p><b>Prezzo:</b> ${ristorante.prezzo} bitTrain</p>
										                <p><b>Lunghezza:</b> ${ristorante.lunghezza} metri</p>
										                <p><b>Numero tavoli:</b> ${ristorante.tavoli}</p>
										                <p><b>Posti totali a sedere:</b> ${ristorante.tavoli * 4}</p>
										                <p><b>Presenza servizi:</b> ${ristorante.servizi ? 'Sì' : 'No'}</p>
										              </div>
										            </a>
										          </div>
										        </c:forEach>
										      </div>
										    </div>
										  </div>
										</div>
									</c:if>
									<c:if test="${ not empty cargo}">
										<div class="container">
										  <!-- Dropdown button -->
										  <div class="dropdown">
										    <button class="btn btn-primary dropdown-toggle btn-block" type="button" id="dropdownMenuButtonCargo" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										      Vagoni Cargo
										    </button>
										    <!-- Dropdown menu -->
										    <div class="dropdown-menu w-100 p-2" aria-labelledby="dropdownMenuButtonCargo">
										      <div class="row">
										        <c:forEach var="cargo" items="${cargo}" varStatus="status">
										          <!-- Gestisce la nuova riga ogni 4 elementi eccetto che per il primo. -->
										          <c:if test="${status.index % 4 == 0 && !status.first}">
										            </div><div class="row">
										          </c:if>
										          <div class="col-3 mb-2">
										            <a class="dropdown-item p-2 border border-1 rounded" href="#">
										              <div class="vagone-content">
										                <p><b>Peso:</b> ${cargo.peso} tonnellate</p>
										                <p><b>Prezzo:</b> ${cargo.prezzo} bitTrain</p>
										                <p><b>Lunghezza:</b> ${cargo.lunghezza} metri</p>
										                <p><b>Tipo di merce trasportata:</b> ${cargo.tipoMerce}</p>
										              </div>
										            </a>
										          </div>
										        </c:forEach>
										      </div>
										    </div>
										  </div>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>	
			</c:if>
		</div>
		<!-- Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<!-- Bootstrap JS -->
		<script src="<c:url value='/resources/js/find.js'/>"></script>

	</body>
</html>ml>
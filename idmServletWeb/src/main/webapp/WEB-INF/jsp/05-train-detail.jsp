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
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/01-welcome.css'/>">
	</head>
	
	<body>
	
		<!-- NAVBAR -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="01-welcome" style="padding-right: 50px;">
				<img src="<c:url value='/resources/img/logo_nav.png'/>" alt="" height="30" style="vertical-align: middle; margin: 0 10px;">
			</a>
	
			<!-- centro -->
			<div class="collapse navbar-collapse justify-content-center" id="navbarNav">
				<ul class="navbar-nav align-items-center">
					<li class="nav-item mr-3"><a class="nav-link" href="01-welcome">Welcome</a></li>
					<li class="nav-item mr-3"><a class="nav-link" href="02-login">Login</a></li>
					<li class="nav-item mr-3"><a class="nav-link" href="03-home">Home</a></li>
					<li class="nav-item mr-3"><a class="nav-link" href="06-crea-treno">Crea Treno</a></li>
					<li class="nav-item mr-3" id="searchIcon"><i class="ms-3 bi bi-search text-secondary"></i></li>			
				</ul>
			</div>
	
			<!-- destra -->
			<div class="navbar-nav ml-auto" style="padding-left: 50px;">
				<div class="nav-item d-flex align-items-center">
					<a class="nav-link d-inline mr-1" href="04-profile">${utente.bitTrain}</a>
						<img src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain" style="height: 20px; object-fit: cover; margin-right: 4px;">
					<a href="04-profile"> 
						<img src="<c:url value='/resources/img/profile-test.jpg'/>" alt="profilo" class="rounded-circle" style="width: 30px; height: 30px; object-fit: cover; margin-right: 10px;">
					</a>
				</div>
			</div>
		</nav>
		
		<div class="container my-3">
			
			<!-- CRITERIA FORM DI RICERCA -->
			<div class="row my-3 p-4 d-none" id="criteriaForm">
				<form action="search" method="GET" class="form-inline">
	 				 <div class="form-group">
		    			 <label for="nome">Nome del treno: </label>
		   				 <input type="text" class="form-control mx-3" id="nome" name="nome" placeholder="Nome del treno">
		   				 <div class="input-group mb-3">
		  					<div class="input-group-prepend">
		    					<label class="input-group-text" for="inputGroupSelect01">Marca:</label>
		  					</div>
		  					<select class="custom-select" id="inputGroupSelect01" name="marca">
		   						 <option selected>FrecciaRossa</option>
		   						 <option value="1">TreNord</option>
		  					</select>
						 </div>
		  				 <button type="submit" class="btn btn-dark mx-3">Submit</button>
	 				 </div>
				</form>
				<i class="ms-3 bi bi-x fs-1" id="closeIcon"></i>
			</div>
			
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
			<div class="row">
				<div class="col"></div>
				<div class="col-12 col-md-6">
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
								<div class="col-12">
									<p class="card-text font-weight-bold h4 my-2">LOCOMOTIVE:</p>
								</div>
								<c:forEach var="locomotiva" items="${ locomotive }">
									<div class="col-12 col-md-6">
										<div class="card mb-4">
											<div class="card-body">
												<p><b>PESO:</b> ${ locomotiva.peso } tonnellate</p>
												<p><b>PREZZO:</b> ${ locomotiva.prezzo } bitTrain</p>
												<p><b>LUNGHEZZA:</b> ${ locomotiva.lunghezza } metri</p>
												<p><b>PESO TRAINABILE:</b> ${ locomotiva.pesoTrainabile } tonnellate</p>
											</div>
										</div>
									</div>
								</c:forEach>
								
								<c:if test="${ not empty passeggeri}">
									<div class="col-12">
										<p class="card-text font-weight-bold h4 my-2">VAGONI PASSEGGERI:</p>
									</div>
									
									<c:forEach var="passeggeri" items="${ passeggeri }">
										<div class="col-12 col-md-6">
											<div class="card mb-4">
												<div class="card-body">
													<p><b>PESO:</b> ${ passeggeri.peso } tonnellate</p>
													<p><b>PREZZO:</b> ${ passeggeri.prezzo } bitTrain</p>
													<p><b>LUNGHEZZA:</b> ${ passeggeri.lunghezza } metri</p>
													<p><b>POSTI A SEDERE:</b> ${ passeggeri.postiNormali }</p>
													<p><b>POSTI PER DISABILI:</b> ${ passeggeri.postiDisabili }</p>
													<p><b>POSTI TOTALI A SEDERE:</b> ${ passeggeri.postiNormali + passeggeri.postiDisabili }</p>
													<p><b>PRESENZA SERVIZI:</b> ${ passeggeri.servizi }</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>

								<c:if test="${ not empty passeggeriB}">
									<div class="col-12">
										<p class="card-text font-weight-bold h4 my-2">VAGONI PASSEGGERI BUSINESS:</p>
									</div>

									<c:forEach var="passeggeriB" items="${ passeggeriB }">
										<div class="col-12 col-md-6">
											<div class="card mb-4">
												<div class="card-body">
													<p><b>PESO:</b> ${ passeggeriB.peso } tonnellate</p>
													<p><b>PREZZO:</b> ${ passeggeriB.prezzo } bitTrain</p>
													<p><b>LUNGHEZZA:</b> ${ passeggeriB.lunghezza } metri</p>
													<p><b>POSTI A SEDERE:</b> ${ passeggeriB.postiNormali }</p>
													<p><b>POSTI PER DISABILI:</b> ${ passeggeriB.postiDisabili }</p>
													<p><b>POSTI TOTALI A SEDERE:</b> ${ passeggeriB.postiNormali + passeggeriB.postiDisabili }</p>
													<p><b>PRESENZA SERVIZI:</b> ${ passeggeriB.servizi }</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>

								<c:if test="${ not empty ristoranti}">
									<div class="col-12">
										<p class="card-text font-weight-bold h4 my-2">VAGONI RISTORANTE:</p>
									</div>
									
									<c:forEach var="ristorante" items="${ ristoranti }">
										<div class="col-12 col-md-6">
											<div class="card mb-4">
												<div class="card-body">
													<p><b>PESO:</b> ${ ristorante.peso } tonnellate</p>
													<p><b>PREZZO:</b> ${ ristorante.prezzo } bitTrain</p>
													<p><b>LUNGHEZZA:</b> ${ ristorante.lunghezza } metri</p>
													<p><b>NUMERO TAVOLI:</b> ${ ristorante.tavoli }</p>
													<p><b>POSTI TOTALI A SEDERE:</b> ${ ristorante.tavoli * 4 }</p>
													<p><b>PRESENZA SERVIZI:</b> ${ ristorante.servizi }</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>

								<c:if test="${ not empty cargo}">
									<div class="col-12">
										<p class="card-text font-weight-bold h4 my-2">VAGONI CARGO:</p>
									</div>
									
									<c:forEach var="cargo" items="${ cargo }">
										<div class="col-12 col-md-6">
											<div class="card mb-4">
												<div class="card-body">
													<p><b>PESO:</b> ${ cargo.peso } tonnellate</p>
													<p><b>PREZZO:</b> ${ cargo.prezzo } bitTrain</p>
													<p><b>LUNGHEZZA:</b> ${ cargo.lunghezza } metri</p>
													<p><b>TIPO DI MERCE TRASPORTATA:</b> ${ cargo.tipoMerce }</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>

							</div>
						</div>
					</div>
				</div>
			</div>	
		</c:if>
		
		<!-- Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- Bootstrap JS -->
		<script src="<c:url value='/resources/js/find.js'/>"></script>

	</body>
</html>


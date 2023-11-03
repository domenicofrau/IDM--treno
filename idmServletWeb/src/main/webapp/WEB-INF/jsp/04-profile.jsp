<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/01-welcome.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/navbar.css'/>">
	</head>
	
<style>
.train-image {
	height: 150px;
	width: 100%;
	object-fit: cover;
}

.profile-picture {
	position: relative;
	width: 150px;
	height: 150px;
	border-radius: 50%;
	overflow: hidden;
}

.profile-picture img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: opacity 0.3s ease-in-out;
}

.profile-picture:hover img {
	opacity: 0.3;
}

.edit-overlay {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	opacity: 0;
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	font-size: 1.5em;
	transition: opacity 0.3s ease-in-out;
	user-select: none;
}

.profile-picture:hover .edit-overlay {
	opacity: 1;
}
</style>

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
	
		<div class="container mt-5">
		
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
		
			<!-- SEZIONE PROFILO -->
			<div class="row">
				<div class="col-md-5 text-center">
					<div class="profile-picture d-inline-block">
						<img src="<c:url value='/resources/img/profile-test.jpg'/>" alt="Immagine Profilo" class="img-fluid">
						<div class="edit-overlay">Modifica</div>
					</div>
					<h3 class="mt-3">${utente.nome} ${utente.cognome}</h3>
					<p>${utente.email}</p>
					<p> saldo BitTrain: 
						<b>${utente.bitTrain} </b>
						<img src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain" style="height: 20px; object-fit: cover; margin-right: 4px;">
					</p>
				</div>
	
				<!-- SEZIONE TRENI -->
				<div class="col-md-7">
					<h2>I Tuoi Treni</h2>
					<div class="row mt-5">
						<c:if test="${empty treni}">
							<div>
								<h6 class="pl-3 text-secondary">Non ci sono treni da mostrare, creane uno o aggiungilo dalla home</h6>
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
												<img src="https://upload.wikimedia.org/wikipedia/it/4/4f/Treno_Frecciarossa_Logo.png" alt="FrecciaRossa" style="height: 17px; width: auto; margin-right: 5px;" class="mb-2">
											</c:when>
											<c:when test="${treni.marca == 'TreNord'}">
												<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Trenord_Logo.svg/2560px-Trenord_Logo.svg.png" alt="TreNord" style="height: 10px; width: auto; margin-right: 5px;" class="mb-2">
											</c:when>
											<c:otherwise>
												<p class="card-text">${treni.marca}</p>
											</c:otherwise>
										</c:choose>
										<img src="${treni.immagine}" alt="Train image" class="img-fluid train-image">
										<p class="mt-3 mb-2">Vagoni: ${numeroVagoni}</p>
										<p class="mb-2">Regione: ${treni.regione}</p>
										<p class="mb-5">
											<b> ${treni.prezzoTotale} </b>
											<img src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain" style="height: 20px; object-fit: cover; margin-right: 4px;">
										</p>
										<div class="d-flex justify-content-between">
											<a href="cerca-treno?idTrenoStr=${ treni.id }" class="btn btn-secondary"> 
												<i class="bi bi-info-lg"></i>
											</a>
	
											<form id="deleteForm" method="post" action="/idmServletWeb/eliminaTreno">
												<input type="hidden" name="id" value="${treni.id}" /><input type="button" value="Elimina" class="btn btn-danger" data-toggle="modal" data-target="#confirmModal" />
											</form>
	
											<!-- MODALE -->
											<div class="modal fade" id="confirmModal" tabindex="-1"
												role="dialog" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">Conferma</h5>
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">Sei sicuro di voler restituire il treno?</div>
														<div class="modal-body">Verranno riaccreditati <b>${treni.prezzoTotale}</b> 
															<img src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain" style="height: 20px; object-fit: cover; margin-right: 4px;">
															sul tuo conto BitTrain.
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary" data-dismiss="modal">Annulla</button>
															<button type="button" class="btn btn-danger" id="confirmDelete">Vendi</button>
														</div>
													</div>
												</div>
											</div>
											
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
		
		<!-- Custom JS -->
		<script src="<c:url value='/resources/js/find.js'/>"></script>
		<script src="<c:url value='/resources/js/modale.js'/>"></script>
		
	</body>
</html>


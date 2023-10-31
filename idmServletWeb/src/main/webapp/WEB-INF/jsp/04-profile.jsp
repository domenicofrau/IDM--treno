<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TrainBook - Profilo</title>
<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>"
	type="image/x-icon">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/01-welcome.css'/>">

</head>
<style>
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
			<img src="<c:url value='/resources/img/logo_nav.png'/>" alt=""
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
					${utente.cognome}</a> <a class="nav-link d-inline mr-1"
					href="04-profile">${utente.bitTrain}</a> <img
					src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain"
					style="height: 20px; object-fit: cover; margin-right: 4px;">
				<a href="04-profile"> <img
					src="<c:url value='/resources/img/profile-test.jpg'/>"
					alt="profilo" class="rounded-circle"
					style="width: 30px; height: 30px; object-fit: cover; margin-right: 10px;">
				</a>
			</div>
		</div>

	</nav>

	<div class="container mt-5">
		<div class="row">
			<!-- Sezione Immagine Profilo -->
			<div class="col-md-5 text-center">
				<div class="profile-picture d-inline-block">
					<img src="<c:url value='/resources/img/profile-test.jpg'/>"
						alt="Immagine Profilo" class="img-fluid">
					<div class="edit-overlay">Modifica</div>
				</div>
				<h3 class="mt-3">${utente.nome}${utente.cognome}</h3>
				<p>${utente.email}</p>
				<p>
					saldo BitTrain: <b> 7k </b><img
						src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain"
						style="height: 20px; object-fit: cover; margin-right: 4px;">
				</p>

			</div>

			<!-- Sezione Treni -->
			<div class="col-md-7">
				<h2>I Tuoi Treni</h2>
				<div class="row mt-5">

					<c:forEach var="treni" items="${ treni }">
						<!-- Primo Treno -->
						<div class="col-md-6">
							<div class="card mb-4">
								<div class="card-body">
									<h5 class="card-title">${treni.nome}</h5>
									<c:choose>
										<c:when test="${treni.marca == 'FRVagoneFactory'}">
											<img
												src="https://upload.wikimedia.org/wikipedia/it/4/4f/Treno_Frecciarossa_Logo.png"
												alt="FrecciaRossa"
												style="height: 17px; width: auto; margin-right: 5px;"
												class="mb-2">
										</c:when>
										<c:when test="${treni.marca == 'TNVagoneFactory'}">
											<img
												src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Trenord_Logo.svg/2560px-Trenord_Logo.svg.png"
												alt="TreNord"
												style="height: 10px; width: auto; margin-right: 5px;"
												class="mb-2">
										</c:when>
										<c:otherwise>
											<p class="card-text">${treni.marca}</p>
										</c:otherwise>
									</c:choose>
									<img src="<c:url value='${treni.immagine}'/>" class="img-fluid">
									<p class="mt-3 mb-5">Vagoni:</p>
									<div class="d-flex justify-content-between">
										<a href="cerca-treno?idTrenoStr=${ treni.id }"
											class="btn btn-secondary"> <i class="bi bi-info-lg"></i>
										</a> <a href="javascript:void(0)" class="btn btn-danger"
											data-id="${treni.id}" onclick="showDeleteModal(this)"> <i
											class="bi bi-trash3"></i> Vendi
										</a>

										<!-- Modale di conferma eliminazione -->
										<div class="modal fade" id="confirmDeleteModal" tabindex="-1"
											aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="confirmDeleteModalLabel">Conferma</h5>
														<button type="button" class="btn-close border-0 bg-white"
															data-dismiss="modal" aria-label="Close"
															aria-label="Close">
															<i class="bi bi-x-lg"></i>
														</button>
													</div>
													<div class="modal-body">Sei sicuro di voler vendere
														questo treno?</div>
													<p class="modal-body">
														Saranno riaccreditati <b><c:out value="${treni.id}" /></b>
														<img src="<c:url value='/resources/img/bitTrain.png'/>"
															alt="bitTrain"
															style="height: 20px; object-fit: cover; margin-right: 4px;">sul
														tuo conto.
													</p>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal" aria-label="Close">Annulla</button>
														<a href="#" id="deleteButton" class="btn btn-danger">Vendi</a>
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

	<script>
		function showDeleteModal(element) {
			var id = element.getAttribute('data-id');
			var deleteButton = document.getElementById('deleteButton');
			deleteButton.href = '/eliminaTreno?id=' + id;
			$('#confirmDeleteModal').modal('show');
		}
	</script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
</body>
</html>


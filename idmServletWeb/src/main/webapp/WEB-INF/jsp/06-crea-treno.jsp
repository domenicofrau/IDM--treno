<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="UTF-8" />
		<title>TrainBook - Crea Treno</title>
		<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon" />
		
		<!-- Bootstrap CSS -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
		
		<!-- Custom CSS -->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/navbar.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/01-welcome.css'/>" />
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
					<li class="nav-item mr-3 active"><a class="nav-link" href="06-crea-treno">Crea Treno</a></li>
					<li class="nav-item mr-3" id="searchIcon"><i class="ms-3 bi bi-search text-secondary"></i></li>	
				</ul>
			</div>
	
			<!-- Link a destra -->
			<div class="navbar-nav ml-auto" style="padding-left: 50px;">
				<div class="nav-item d-flex align-items-center">
					<a class="nav-link d-inline mr-1" href="04-profile">${utente.bitTrain}</a>
					<img src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain" style="height: 20px; object-fit: cover; margin-right: 4px;">
					<a href="04-profile"> <img src="<c:url value='/resources/img/profile-test.jpg'/>" alt="profilo" class="rounded-circle" style="width: 30px; height: 30px; object-fit: cover; margin-right: 10px;">
					</a>
				</div>
			</div>
		</nav>
		
		
		<div class="container mt-3">
			
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
			
			
			<h3>Crea il tuo treno</h3>
	
			<!-- SELETTORE DELLA MARCA -->
			<p class="mt-5">Scegli la marca per il tuo nuovo treno:</p>
			<form id="factoryForm">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="factory" id="fr" value="fr" onchange="showForm()" /> 
					<label class="form-check-label" for="fr">
						<img src="https://upload.wikimedia.org/wikipedia/it/4/4f/Treno_Frecciarossa_Logo.png" alt="FrecciaRossa" style="height: 17px; width: auto; margin-right: 5px" /> 
					</label>
				</div>
				<div class="form-check mt-2">
					<input class="form-check-input" type="radio" name="factory" id="tn" value="tn" onchange="showForm()" /> 
					<label class="form-check-label" for="tn">
						<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Trenord_Logo.svg/2560px-Trenord_Logo.svg.png" alt="TreNord" style="height: 10px; width: auto; margin-right: 5px" />
					</label>
				</div>
			</form>
	
			<!-- FRECCIAROSSA -->
			<div id="frForm" style="display: none">
				<form:form method="POST" action="crea-treno-fr" modelAttribute="treno">
					<div class="form-group">
						<p class="mt-3 text">
							Per poter costruire un treno, è necessario inserire una sigla. <br />
							Tale sigla deve essere composta esclusivamente di lettere che
							indicano il tipo di vagone che si vorrebbe creare:
						</p>
						<ul class="text">
							<li><strong>H</strong> - Locomotiva (obbligatorio come primo vagone)</li>
							<li><strong>P</strong> - Passeggeri</li>
							<li><strong>B</strong> - Passeggeri business</li>
							<li><strong>R</strong> - Ristorante</li>
							<li><strong>C</strong> - Cargo</li>
						</ul>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="siglaFR">Sigla:</label> <input type="text" class="form-control" id="siglaFR" name="sigla" placeholder="esempio: HPPPRP" required pattern="[HPBRC]+|[hpbrc]+" title="Sono ammessi solo i caratteri H, P, B, R, C." />
								<div class="invalid-feedback">La sigla deve iniziare con la lettera H.</div>
							</div>
							<div class="form-group col-md-6">
								<label for="regione_fr">Regione:</label> <select class="form-control" id="regione_fr" name="regione" required></select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="nomeTrenoFR">Nome:</label> <input type="text" class="form-control" id="nomeTrenoFR" name="nomeTreno" placeholder="assegna un nome a questo treno" required minlength="3" maxlength="25" />
					</div>
					<p class="mt-3 text">Immagine:</p>
					<div class="container">
						<div class="form-group">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="imageForm_fr" id="checkDefaultForm_fr" value="defaultForm_fr" onchange="showImageForm()" checked /> 
								<label class="form-check-label" for="defaultForm_fr">Scegli tra le immagini di default</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="imageForm_fr" id="checkCustomForm_fr" value="customForm_fr" onchange="showImageForm()" /> 
								<label class="form-check-label" for="customForm_fr">Carica un'immagine</label>
							</div>
						</div>
	
						<div id="defaultForm_fr" class="row" style="display: none">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="urlSelect_fr">Cambia l'immagine di default:</label>
										<select class="form-control" id="urlSelect_fr" name="urlImmagine" onchange="updatePreview()">
											<option value="https://upload.wikimedia.org/wikipedia/commons/f/f8/Frecciarossa_1000_nuova_livrea.jpg" selected>default</option>
											<option value="https://www.touringclub.it/sites/default/files/styles/gallery_full/public/immagini_georiferite/trenoblu_nella_valle_delloglio_-_foto_f._ferrari_-_archivio_fbs-fti_mr.jpg?itok=EpCkW0po"> antico</option>
											<option value="https://www.novaratoday.it/~media/horizontal-hi/20825375045093/treno-rock.jpeg"> moderno</option>
											<option value="https://www.malpensa24.it/wp-content/uploads/2020/01/trasporto-ferroviario-3-1-1.jpg"> cargo</option>
											<option value="https://www.portalerifiutispeciali.it/wp-content/uploads/2017/02/RID-2017.jpg"> cargo radioattivo</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Anteprima:</label>
										<div id="preview_fr" style="height: 100px"></div>
									</div>
								</div>
							</div>
						</div>
	
						<div id="customForm_fr" class="row" style="display: block">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="urlImage_fr">Url dell'immagine:</label> <input type="text" class="form-control" id="urlImage_fr" name="urlImmagine" placeholder="inserire qui l'url dell'immagine che si vuole usare" oninput="updateCustomPreview('fr')" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Anteprima:</label>
										<div id="preview_custom_fr" style="height: 100px"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button id="creaTreno_fr" type="submit" class="btn btn-primary mb-5">Crea il treno</button>
				</form:form>
			</div>
	
			<!-- TRENORD -->
			<div id="tnForm" style="display: none">
				<form:form method="POST" action="crea-treno-tn" modelAttribute="treno">
					<div class="form-group">
						<p class="mt-3 text">
							Per poter costruire un treno, è necessario inserire una sigla. <br />
							Tale sigla deve essere composta esclusivamente di lettere che
							indicano il tipo di vagone che si vorrebbe creare:
						</p>
						<ul class="text">
							<li><strong>H</strong> - Locomotiva (obbligatorio come primo vagone)</li>
							<li><strong>P</strong> - Passeggeri</li>
							<li><strong>B</strong> - Passeggeri business</li>
							<li><strong>R</strong> - Ristorante</li>
							<li><strong>C</strong> - Cargo</li>
						</ul>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="siglaTN">Sigla:</label> 
								<input type="text" class="form-control" id="siglaTN" name="sigla" placeholder="esempio: HPPPRP" required pattern="[HPBRC]+|[hpbrc]+" title="Sono ammessi solo i caratteri H, P, B, R, C." />
								<div class="invalid-feedback">La sigla deve iniziare con la lettera H.</div>
							</div>
							<div class="form-group col-md-6">
								<label for="regione_tn">Regione:</label> <select class="form-control" id="regione_tn" name="regione" required></select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="nomeTrenoTN">Nome:</label> <input type="text" class="form-control" id="nomeTrenoTN" name="nomeTreno" placeholder="assegna un nome a questo treno" required minlength="3" maxlength="25" />
					</div>
	
					<p class="mt-3 text">Immagine:</p>
					<div class="container">
						<div class="form-group">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="imageForm_tn" id="checkDefaultForm_tn" value="defaultForm_tn" onchange="showImageForm()" checked /> 
								<label class="form-check-label" for="defaultForm_tn">Scegli tra le immagini di default</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="imageForm_tn" id="checkCustomForm_tn" value="customForm_tn" onchange="showImageForm()" /> 
								<label class="form-check-label" for="customForm_tn">Carica un'immagine</label>
							</div>
						</div>
	
						<div id="defaultForm_tn" class="row" style="display: none">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="urlSelect_tn">Cambia l'immagine di default:</label>
										<select class="form-control" id="urlSelect_tn" name="urlImmagine" onchange="updatePreview()">
											<option value="https://upload.wikimedia.org/wikipedia/commons/2/2c/Treno_TSR_livrea_Trenord.JPG" selected>default</option>
											<option value="https://www.touringclub.it/sites/default/files/styles/gallery_full/public/immagini_georiferite/trenoblu_nella_valle_delloglio_-_foto_f._ferrari_-_archivio_fbs-fti_mr.jpg?itok=EpCkW0po"> antico</option>
											<option value="https://www.novaratoday.it/~media/horizontal-hi/20825375045093/treno-rock.jpeg"> moderno</option>
											<option value="https://www.malpensa24.it/wp-content/uploads/2020/01/trasporto-ferroviario-3-1-1.jpg"> cargo</option>
											<option value="https://www.portalerifiutispeciali.it/wp-content/uploads/2017/02/RID-2017.jpg"> cargo radioattivo</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Anteprima:</label>
										<div id="preview_tn" style="height: 100px"></div>
									</div>
								</div>
							</div>
						</div>
	
						<div id="customForm_tn" class="row" style="display: block">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="urlImage_tn">Url dell'immagine:</label> 
										<input type="text" class="form-control" id="urlImage_tn" name="urlImmagine" placeholder="inserire qui l'url dell'immagine che si vuole usare" oninput="updateCustomPreview('tn')" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Anteprima:</label>
										<div id="preview_custom_tn" style="height: 100px"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button id="creaTreno_tn" type="submit" class="btn btn-primary mb-5">Crea il treno</button>
				</form:form>
			</div>
		</div>
		
		<!-- Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- Custom JS -->
		<script src="<c:url value='/resources/js/selectFactory.js'/>"></script>
		<script src="<c:url value='/resources/js/imagePreview.js'/>"></script>
		<script src="<c:url value='/resources/js/checkSigla.js'/>"></script>
		<script src="<c:url value='/resources/js/regioni.js'/>"></script>
		<script src="<c:url value='/resources/js/calcolaPrezzo.js'/>"></script>
		<script src="<c:url value='/resources/js/find.js'/>"></script>
	
	</body>
</html>

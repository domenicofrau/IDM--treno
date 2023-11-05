<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="it">
<style>
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@400;500;600;700;800;900&display=swap');

body {
    font-family: 'Raleway', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.main-content {
    padding: 60px 20px;
    text-align: center;
    background-color: rgba(0, 0, 0, 0.5);
    margin: 50px auto;
    max-width: 800px;
    border-radius: 8px;
}

.main-content h1 {
    font-size: 2.5em;
    margin-bottom: 20px;
}

.main-content p {
    font-size: 1.2em;
    line-height: 1.5;
}

.train-image {
	height: 200px;
	width: 100%;
	object-fit: cover;
}

.logo-frecciarossa {
	height: 17px;
	width: auto;
	margin-right: 5px;
}

.logo-trenord {
	height: 10px;
	width: auto;
	margin-right: 5px;
}

.bit-train-icon {
	height: 20px;
	object-fit: cover;
	margin-right: 4px;
}
.hidden {
    display: none;
}

.preview {
    height: 100px;
}
#searchIcon:hover {
	cursor: pointer !important;
}

#criteriaForm {
	border: 1px solid black;
	border-radius: 10px;
}

#closeIcon:hover {
	cursor: pointer !important;
}

.input-group {
	margin-bottom: 0 !important;
}
.mainTitle{
	font-weight: 800;
	font-size: 5rem;
}

.mainSubTitle{
	font-size: 1.6rem;
}
.form-container {
	margin: 20px auto;
	text-align: left;
	max-width: 400px;
}

.input-group {
	margin-bottom: 20px;
}

.input-group label {
	display: block;
	margin-bottom: 10px;
}

.input-group input {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.input-group button {
	background-color: #007BFF;
	color: #FFF;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: 0.3s;
}

.input-group button:hover {
	background-color: #0056b3;
}
.navbar {
	background-color: rgba(0, 0, 0, 0.5);
	overflow: hidden;
	padding: 10px 0;
}

.navbar .navbar-brand {
	padding-right: 50px;
}

.navbar a {
	
	float: left;
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-weight: bold;
	transition: 0.3s;
}

.navbar a:hover {
	background-color: rgba(255, 255, 255, 0.2);
}

.navbar a.right {
	float: right;
}

.logo-nav {
	vertical-align: middle;
	margin: 0 10px;
	height: 30px;
}

.nav-item-icon {
	height: 20px;
	object-fit: cover;
	margin-right: 4px;
}

.profile-image {
	width: 30px;
	height: 30px;
	object-fit: cover;
	margin-right: 10px;
	border-radius: 50%;
}

.navbar-nav-adjust {
	padding-left: 50px;
}

.sticky-top {
  position: -webkit-sticky;
  position: sticky;
  top: 0px; 
}
.navbar {
	background-color: rgba(0, 0, 0, 0.5);
	overflow: hidden;
	padding: 10px 0;
}

.navbar .navbar-brand {
	padding-right: 50px;
}

.navbar a {
	
	float: left;
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-weight: bold;
	transition: 0.3s;
}

.navbar a:hover {
	background-color: rgba(255, 255, 255, 0.2);
}

.navbar a.right {
	float: right;
}

.logo-nav {
	vertical-align: middle;
	margin: 0 10px;
	height: 30px;
}

.nav-item-icon {
	height: 20px;
	object-fit: cover;
	margin-right: 4px;
}

.profile-image {
	width: 30px;
	height: 30px;
	object-fit: cover;
	margin-right: 10px;
	border-radius: 50%;
}

.navbar-nav-adjust {
	padding-left: 50px;
}

.sticky-top {
  position: -webkit-sticky;
  position: sticky;
  top: 0px; 
}</style>
	<head>
		<meta charset="UTF-8"/>
		<title>TrainBook - Crea Treno</title>
		<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon"/>
		<!-- Bootstrap CSS -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"/>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"/>
		<!-- Custom CSS -->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/navbar.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/criteriaForm.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/create.css'/>">
	</head>
	<body>
		<!-- NAVBAR -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
			<a class="navbar-brand" href="01-welcome">
			   <img src="<c:url value='/resources/img/logo_nav.png'/>" alt="" class="logo-nav"/>
			</a>
		   <!-- centro -->
			<div id="navbarNav" class="collapse navbar-collapse justify-content-center">
				<ul class="navbar-nav align-items-center">
					<c:if test="${empty loggedInUser.nome}">
						<li class="nav-item mr-3"><a class="nav-link" href="01-welcome">Welcome</a></li>
						<li class="nav-item mr-3"><a class="nav-link" href="02-login">Login</a></li>
					</c:if>
					<li class="nav-item mr-3"><a class="nav-link" href="03-home">Home</a></li>
					<li class="nav-item mr-3 active"><a class="nav-link" href="06-crea-treno">Crea Treno</a></li>
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
		<div class="container mt-3">
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
			<h2 class="font-weight-bold">Crea il tuo treno</h2>
			<!-- SELETTORE DELLA MARCA -->
			<p class="mt-5">Scegli la marca per il tuo nuovo treno:</p>
			<form id="factoryForm">
				<div class="form-check">
					<input id="fr" class="form-check-input" type="radio" name="factory" value="fr" onchange="showForm()"/> 
					<label class="form-check-label" for="fr">
						<img class="logo-frecciarossa" src="https://upload.wikimedia.org/wikipedia/it/4/4f/Treno_Frecciarossa_Logo.png" alt="FrecciaRossa"/> 
					</label>
				</div>
				<div class="form-check mt-2">
					<input id="tn" class="form-check-input" type="radio" name="factory" value="tn" onchange="showForm()" /> 
					<label class="form-check-label" for="tn">
						<img class="logo-trenord" src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Trenord_Logo.svg/2560px-Trenord_Logo.svg.png" alt="TreNord"/>
					</label>
				</div>
			</form>
			<!-- FRECCIAROSSA -->
			<div id="frForm" class="hidden">
				<form:form method="POST" action="crea-treno-fr" modelAttribute="treno">
					<div class="form-group">
						<!-- button collapse -->
						<a class="btn btn-light my-4" data-toggle="collapse" href="#infoTrenoCollapse" role="button" aria-expanded="false" aria-controls="infoTrenoCollapse">
						  Istruzioni per la costruzione del treno
						</a>
						<!-- collapse -->
						<div class="collapse" id="infoTrenoCollapse">
							<div class="card card-body">
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
							</div>
						</div>
						<div class="form-row mt-2">
							<div class="form-group col-md-6">
								<label for="siglaFR">Sigla:</label> <input id="siglaFR" class="form-control" type="text" name="sigla" placeholder="esempio: HPPPRP" required pattern="[HPBRC]+|[hpbrc]+" title="Sono ammessi solo i caratteri H, P, B, R, C." oninput="this.value = this.value.toUpperCase()"/>
								<div class="invalid-feedback">La sigla deve iniziare con la lettera H.</div>
							</div>
							<div class="form-group col-md-6">
								<label for="regione_fr">Regione:</label> <select id="regione_fr" class="form-control" name="regione" required></select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="nomeTrenoFR">Nome:</label> <input id="nomeTrenoFR" class="form-control" type="text" name="nomeTreno" placeholder="assegna un nome a questo treno" required minlength="3" maxlength="25" />
					</div>
					<p class="mt-3 text">Immagine:</p>
					<div class="container">
						<div class="form-group">
							<div class="form-check form-check-inline">
								<input id="checkDefaultForm_fr" class="form-check-input" type="radio" name="imageForm_fr" value="defaultForm_fr" onchange="showImageForm()" checked /> 
								<label class="form-check-label" for="defaultForm_fr">Scegli tra le immagini di default</label>
							</div>
							<div class="form-check form-check-inline">
								<input id="checkCustomForm_fr" class="form-check-input" type="radio" name="imageForm_fr" value="customForm_fr" onchange="showImageForm()" /> 
								<label class="form-check-label" for="customForm_fr">Carica un'immagine</label>
							</div>
						</div>
						<div id="defaultForm_fr" class="row hidden">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="urlSelect_fr">Cambia l'immagine di default:</label>
										<select class="form-control" id="urlSelect_fr" name="urlImmagine" onchange="updatePreview()">
											<option value="https://upload.wikimedia.org/wikipedia/commons/f/f8/Frecciarossa_1000_nuova_livrea.jpg" selected>default</option>
											<option value="https://www.touringclub.it/sites/default/files/styles/gallery_full/public/immagini_georiferite/trenoblu_nella_valle_delloglio_-_foto_f._ferrari_-_archivio_fbs-fti_mr.jpg?itok=EpCkW0po">antico</option>
											<option value="https://www.novaratoday.it/~media/horizontal-hi/20825375045093/treno-rock.jpeg">moderno</option>
											<option value="https://www.malpensa24.it/wp-content/uploads/2020/01/trasporto-ferroviario-3-1-1.jpg">cargo</option>
											<option value="https://www.portalerifiutispeciali.it/wp-content/uploads/2017/02/RID-2017.jpg">cargo radioattivo</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Anteprima:</label>
										<div id="preview_fr" class="preview"></div>
									</div>
								</div>
							</div>
						</div>
						<div id="customForm_fr" class="row">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="urlImage_fr">Url dell'immagine:</label> <input id="urlImage_fr" class="form-control" type="text" name="urlImmagine" placeholder="inserire qui l'url dell'immagine che si vuole usare" oninput="updateCustomPreview('fr')" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Anteprima:</label>
										<div id="preview_custom_fr" class="preview"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button id="creaTreno_fr" class="btn btn-primary mb-5" type="submit">Crea il treno</button>
				</form:form>
			</div>
			<!-- TRENORD -->
			<div id="tnForm" class="hidden">
				<form:form method="POST" action="crea-treno-tn" modelAttribute="treno">
					<div class="form-group">
						<!-- button collapse -->
						<a class="btn btn-light my-4" data-toggle="collapse" href="#infoTrenoCollapse" role="button" aria-expanded="false" aria-controls="infoTrenoCollapse">
						  Istruzioni per la costruzione del treno
						</a>
						<!-- collapse -->
						<div class="collapse" id="infoTrenoCollapse">
							<div class="card card-body">
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
							</div>
						</div>
						<div class="form-row mt-2">
							<div class="form-group col-md-6">
								<label for="siglaTN">Sigla:</label> 
								<input id="siglaTN" class="form-control" type="text" name="sigla" placeholder="esempio: HPPPRP" required pattern="[HPBRC]+|[hpbrc]+" title="Sono ammessi solo i caratteri H, P, B, R, C." oninput="this.value = this.value.toUpperCase()"/>
								<div class="invalid-feedback">La sigla deve iniziare con la lettera H.</div>
							</div>
							<div class="form-group col-md-6">
								<label for="regione_tn">Regione:</label><select id="regione_tn" class="form-control" name="regione" required></select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="nomeTrenoTN">Nome:</label> <input id="nomeTrenoTN" class="form-control" type="text" name="nomeTreno" placeholder="assegna un nome a questo treno" required minlength="3" maxlength="25"/>
					</div>
					<p class="mt-3 text">Immagine:</p>
					<div class="container">
						<div class="form-group">
							<div class="form-check form-check-inline">
								<input id="checkDefaultForm_tn" class="form-check-input" type="radio" name="imageForm_tn" value="defaultForm_tn" onchange="showImageForm()" checked/> 
								<label class="form-check-label" for="defaultForm_tn">Scegli tra le immagini di default</label>
							</div>
							<div class="form-check form-check-inline">
								<input id="checkCustomForm_tn" class="form-check-input" type="radio" name="imageForm_tn" value="customForm_tn" onchange="showImageForm()"/> 
								<label class="form-check-label" for="customForm_tn">Carica un'immagine</label>
							</div>
						</div>
						<div id="defaultForm_tn" class="row hidden">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="urlSelect_tn">Cambia l'immagine di default:</label>
										<select id="urlSelect_tn" class="form-control" name="urlImmagine" onchange="updatePreview()">
											<option value="https://upload.wikimedia.org/wikipedia/commons/2/2c/Treno_TSR_livrea_Trenord.JPG" selected>default</option>
											<option value="https://www.touringclub.it/sites/default/files/styles/gallery_full/public/immagini_georiferite/trenoblu_nella_valle_delloglio_-_foto_f._ferrari_-_archivio_fbs-fti_mr.jpg?itok=EpCkW0po">antico</option>
											<option value="https://www.novaratoday.it/~media/horizontal-hi/20825375045093/treno-rock.jpeg">moderno</option>
											<option value="https://www.malpensa24.it/wp-content/uploads/2020/01/trasporto-ferroviario-3-1-1.jpg">cargo</option>
											<option value="https://www.portalerifiutispeciali.it/wp-content/uploads/2017/02/RID-2017.jpg">cargo radioattivo</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Anteprima:</label>
										<div id="preview_tn" class="preview"></div>
									</div>
								</div>
							</div>
						</div>
						<div id="customForm_tn" class="row">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="urlImage_tn">Url dell'immagine:</label> 
										<input id="urlImage_tn" class="form-control" type="text" name="urlImmagine" placeholder="inserire qui l'url dell'immagine che si vuole usare" oninput="updateCustomPreview('tn')"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Anteprima:</label>
										<div id="preview_custom_tn" class="preview"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button id="creaTreno_tn" class="btn btn-primary mb-5" type="submit">Crea il treno</button>
				</form:form>
			</div>
		</div>
		<!-- Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<!-- Custom JS -->
		<script type="text/javascript">var contextPath = "<%=request.getContextPath()%>";</script>
		<script src="<c:url value='/resources/js/calcolaPrezzo.js'/>"></script>
		<script src="<c:url value='/resources/js/selectFactory.js'/>"></script>
		<script src="<c:url value='/resources/js/imagePreview.js'/>"></script>
		<script src="<c:url value='/resources/js/checkSigla.js'/>"></script>
		<script src="<c:url value='/resources/js/regioni.js'/>"></script>
		<script src="<c:url value='/resources/js/find.js'/>"></script>
	
	</body>
</html>
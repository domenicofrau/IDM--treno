<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="it">
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
		<c:if test="${empty loggedInUser.nome}">
	    	<c:redirect url="01-welcome"/>
		</c:if>
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
					<a class="nav-link d-inline mr-1" href="04-profile" >${loggedInUser.nome}</a>
					<p id="saldo" style="display:none">${loggedInUser.bitTrain}</p>
					<a class="nav-link d-inline mr-1" href="04-profile">${loggedInUser.bitTrain}</a>
					<img class="nav-item-icon" src="<c:url value='/resources/img/bitTrain.png'/>" alt="bitTrain">
					<a href="04-profile">
						<img class="profile-image" src="<c:url value='${loggedInUser.immagineProfilo}'/>">
					</a>
				</div>
			</div>
		</nav>
		
		<!-- CRITERIA FORM DI RICERCA -->
		<div class="container mt-3">
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
									<option value="Tutte">Tutte</option>
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
								<option value="Tutte">Tutte</option>
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
						 	 <button class="btn btn-dark" type="submit" id="cercaCriteria">Cerca</button>
							</div>
   						</div>  						
				</form:form>
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
							    <div id="feedbackStartsWithHFR" class="invalid-feedback" style="display:none;">Il treno deve avere come primo vagone una locomotiva (H).</div>
								<div id="feedbackNeedsRFR" class="invalid-feedback" style="display:none;">Se è presente un vagone passeggeri (P), è necessaria anche un vagone ristorante (R).</div>
								<div id="feedbackNotAllowedC" class="invalid-feedback" style="display:none;">I vagoni cargo (C), non possono essere inseriti in un treno passeggeri.</div>
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
							    <div id="feedbackStartsWithHTN" class="invalid-feedback" style="display:none;">Il treno deve avere come primo vagone una locomotiva (H).</div>
 								<div id="feedbackNeedsRTN" class="invalid-feedback" style="display:none;">Se è presente un vagone passeggeri (P), è necessaria anche un vagone ristorante (R).</div>
  								<div id="feedbackNotAllowedC" class="invalid-feedback" style="display:none;">I vagoni cargo (C), non possono essere inseriti in un treno passeggeri.</div>
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
		<script src="<c:url value='/resources/js/checkSigla.js'/>"></script>
		<script src="<c:url value='/resources/js/selectFactory.js'/>"></script>
		<script src="<c:url value='/resources/js/imagePreview.js'/>"></script>
		<script src="<c:url value='/resources/js/regioni.js'/>"></script>
		<script src="<c:url value='/resources/js/find.js'/>"></script>
	
	</body>
</html>
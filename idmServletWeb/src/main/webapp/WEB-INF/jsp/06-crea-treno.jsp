<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<title>Crea il tuo treno</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/feed-style.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/01-welcome.css'/>">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="01-welcome"> <img src="logo.png"
			alt="" height="30" style="vertical-align: middle; margin: 0 10px;">
			TrainBook
		</a>

		<!-- Menu al centro -->
		<div class="collapse navbar-collapse justify-content-center"
			id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="01-welcome">Welcome</a></li>
				<li class="nav-item"><a class="nav-link" href="02-login">Login</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="03-home">Home</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="seleziona-factory">Crea Treno</a></li>
				<li class="nav-item"><a class="nav-link" href="cancella">Cancella
						Treno</a></li>
				<li class="nav-item"><a class="nav-link" href="cerca-treno">Cerca
						Treno</a>
			</ul>
		</div>

		<!-- Link a destra -->
		<div class="navbar-nav ml-auto">
			<a class="nav-item nav-link" href="04-profile">PROFILO</a>
		</div>
	</nav>

	<div class="container mt-3">
		<h3>Crea il tuo treno</h3>

		<p class="mt-5">Scegli la marca per il tuo nuovo treno:</p>
		<!-- selettore -->
		<form id="factoryForm">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="factory" id="fr"
					value="fr" onchange="showForm()"> <label
					class="form-check-label" for="fr">Freccia Rossa</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="factory" id="tn"
					value="tn" onchange="showForm()"> <label
					class="form-check-label" for="tn">TreNord</label>
			</div>
		</form>

		<div id="frForm" style="display: none;">
			<!-- Form per FR -->
			<form method="POST" action="crea-treno-fr">
				<div class="form-group">
					<p class="mt-3 text">La sigla deve essere composta da lettere
						che indicano il tipo di vagone che si vorrebbe creare:</p>
					<ul class="text">
						<li><strong>H</strong> - Locomotiva</li>
						<li><strong>P</strong> - Passeggeri</li>
						<li><strong>B</strong> - Passeggeri business</li>
						<li><strong>R</strong> - Ristorante</li>
						<li><strong>C</strong> - Cargo</li>
					</ul>
					<label for="siglaFR">Sigla:</label> <input type="text"
						class="form-control" id="siglaFR" name="sigla"
						placeholder="esempio: HPPPRP" required pattern="[HPBRC]+"
						title="Solo i caratteri H, P, B, R, C sono ammessi.">
				</div>
				<div class="form-group">
					<label for="nomeTrenoFR">Nome:</label> <input type="text"
						class="form-control" id="nomeTrenoFR" name="nomeTreno"
						placeholder="assegna un nome a questo treno" required
						minlength="3" maxlength="25">
				</div>

				<p class="mt-3 text">Immagine:</p>
				<!-- selettore -->
				<form id="imageForm_fr">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="imageForm_fr"
							id="defaultForm_fr" value="defaultForm_fr"
							onchange="showImageForm()"> <label
							class="form-check-label" for="defaultForm_fr">Scegli tra
							le immagini di default</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="imageForm_fr"
							id="customForm_fr" value="customForm_fr"
							onchange="showImageForm()"> <label
							class="form-check-label" for="customForm_fr">Carica
							un'immagine</label>
					</div>
				</form>

				<div id="defaultForm" class="row" style="display: none;">
					<!-- Colonna sinistra: menu a tendina -->
					<div class="col-md-6">
						<div class="form-group">
							<label for="urlSelect_fr">Cambia l'immagine di default:</label> <select
								class="form-control" id="urlSelect_fr" name="url"
								onchange="updatePreview()">
								<option
									value="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Frecciarossa_1000_nuova_livrea.jpg/390px-Frecciarossa_1000_nuova_livrea.jpg">default</option>
								<option
									value="https://www.touringclub.it/sites/default/files/styles/gallery_full/public/immagini_georiferite/trenoblu_nella_valle_delloglio_-_foto_f._ferrari_-_archivio_fbs-fti_mr.jpg?itok=EpCkW0po">antico</option>
								<option
									value="https://www.novaratoday.it/~media/horizontal-hi/20825375045093/treno-rock.jpeg">moderno</option>
								<option
									value="https://www.malpensa24.it/wp-content/uploads/2020/01/trasporto-ferroviario-3-1-1.jpg">cargo</option>
								<option
									value="https://www.portalerifiutispeciali.it/wp-content/uploads/2017/02/RID-2017.jpg">cargo
									radioattivo</option>
							</select>
						</div>
					</div>

					<div id="customForm" class="row" style="display: none;">
						<div class="form-group">
							<label>Url dell'immagine:</label> <input type="text"
								class="form-control" id="urlImage" name="nomeTreno"
								placeholder="inserire qui l'url dell'immagine che si vuole usare">
						</div>
					</div>

					<!-- Colonna destra: anteprima -->
					<div class="col-md-6">
						<div class="form-group">
							<label>Anteprima:</label>
							<div id="preview_fr" style="height: 100px;">
								<!-- Qui verrà visualizzata l'anteprima -->
							</div>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Crea il treno</button>
			</form>
		</div>

		<div id="tnForm" style="display: none;">
			<!-- Form per TN -->
			<div class="container">
				<form method="POST" action="crea-treno-tn">
					<div class="form-group">
						<p class="mt-3 text">La sigla deve essere composta da lettere
							che indicano il tipo di vagone che si vorrebbe creare:</p>
						<ul class="text">
							<li><strong>H</strong> - Locomotiva</li>
							<li><strong>P</strong> - Passeggeri</li>
							<li><strong>B</strong> - Passeggeri business</li>
							<li><strong>R</strong> - Ristorante</li>
							<li><strong>C</strong> - Cargo</li>
						</ul>
						<label for="siglaTN">Sigla:</label> <input type="text"
							class="form-control" id="siglaTN" name="sigla"
							placeholder="esempio: HPPPRP" required pattern="[HPBRC]+"
							title="Solo i caratteri H, P, B, R, C sono ammessi.">
					</div>
					<div class="form-group">
						<label for="nomeTrenoTN">Nome:</label> <input type="text"
							class="form-control" id="nomeTrenoTN" name="nomeTreno"
							placeholder="assegna un nome a questo treno" required
							minlength="3" maxlength="25">
					</div>

					<p class="mt-3 text">Immagine:</p>
					<div class="container">
						<!-- selettore -->
						<div class="form-group">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="imageForm_tn"
									id="checkDefaultForm_tn" value="defaultForm_tn"
									onchange="showImageForm()"> <label
									class="form-check-label" for="defaultForm_tn">Scegli
									tra le immagini di default</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="imageForm_tn"
									id="checkCustomForm_tn" value="customForm_tn"
									onchange="showImageForm()"> <label
									class="form-check-label" for="customForm_tn">Carica
									un'immagine</label>
							</div>
						</div>

						<div id="defaultForm_tn" class="row" style="display: none;">
							<div class="row">
								<!-- Colonna sinistra: menu a tendina -->
								<div class="col-md-6">
									<div class="form-group">
										<label for="urlSelect_tn">Cambia l'immagine di
											default:</label> <select class="form-control" id="urlSelect_tn"
											name="url" onchange="updatePreview()">
											<option
												value="https://upload.wikimedia.org/wikipedia/commons/2/2c/Treno_TSR_livrea_Trenord.JPG">default</option>
											<option
												value="https://www.touringclub.it/sites/default/files/styles/gallery_full/public/immagini_georiferite/trenoblu_nella_valle_delloglio_-_foto_f._ferrari_-_archivio_fbs-fti_mr.jpg?itok=EpCkW0po">antico</option>
											<option
												value="https://www.novaratoday.it/~media/horizontal-hi/20825375045093/treno-rock.jpeg">moderno</option>
											<option
												value="https://www.malpensa24.it/wp-content/uploads/2020/01/trasporto-ferroviario-3-1-1.jpg">cargo</option>
											<option
												value="https://www.portalerifiutispeciali.it/wp-content/uploads/2017/02/RID-2017.jpg">cargo
												radioattivo</option>
										</select>
									</div>
								</div>

								<!-- Colonna destra: anteprima -->
								<div class="col-md-6">
									<div class="form-group">
										<label>Anteprima:</label>
										<div id="preview_tn" style="height: 100px;">
											<!-- Qui verrà visualizzata l'anteprima -->
										</div>
									</div>
								</div>
							</div>
						</div>

						<div id="customForm_tn" class="row" style="display: none;">
							<div class="row">
								<!-- Colonna sinistra: input URL -->
								<div class="col-md-6">
									<div class="form-group">
										<label for="urlImage">Url dell'immagine:</label> <input
											type="text" class="form-control" id="urlImage"
											name="urlImage"
											placeholder="inserire qui l'url dell'immagine che si vuole usare"
											oninput="updateCustomPreview()">
									</div>
								</div>
								<!-- Colonna destra: anteprima -->
								<div class="col-md-6">
									<div class="form-group">
										<label>Anteprima:</label>
										<div id="preview_custom_tn" style="height: 100px;">
											<!-- Qui verrà visualizzata l'anteprima -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<button type="submit" class="btn btn-primary">Crea il
						treno</button>
				</form>
			</div>

			<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
			<script>
				function showForm() {
					var frForm = document.getElementById('frForm');
					var tnForm = document.getElementById('tnForm');
					var factory = document
							.querySelector('input[name="factory"]:checked').value;

					if (factory === 'fr') {
						frForm.style.display = 'block';
						tnForm.style.display = 'none';
						updatePreview();
					} else if (factory === 'tn') {
						frForm.style.display = 'none';
						tnForm.style.display = 'block';
						updatePreview();
					}
					updatePreview();
				}

				function showImageForm() {
					var defaultForm = document.getElementById('defaultForm_tn');
					var customForm = document.getElementById('customForm_tn');

					if (document.getElementById('checkDefaultForm_tn').checked) {
						defaultForm.style.display = 'block';
						customForm.style.display = 'none';
					} else if (document.getElementById('checkCustomForm_tn').checked) {
						defaultForm.style.display = 'none';
						customForm.style.display = 'block';
					}
				}

				function updateCustomPreview() {
					var urlImage = document.getElementById('urlImage').value;
					var preview = document.getElementById('preview_custom_tn');
					if (urlImage) {
						preview.innerHTML = '<img src="'
								+ urlImage
								+ '" alt="Anteprima" style="max-width: 100%; max-height: 100px; display:block;">';
					}
				}

				function updatePreview() {
					var frForm = document.getElementById('frForm');
					var tnForm = document.getElementById('tnForm');
					var urlSelect_fr = document.getElementById('urlSelect_fr');
					var urlSelect_tn = document.getElementById('urlSelect_tn');
					var preview_fr = document.getElementById('preview_fr');
					var preview_tn = document.getElementById('preview_tn');

					if (frForm.style.display === 'block') {
						var selectedUrl_fr = urlSelect_fr.options[urlSelect_fr.selectedIndex].value;
						preview_fr.innerHTML = '<img src="'
								+ selectedUrl_fr
								+ '" alt="Anteprima" style="max-width: 100%; max-height: 100px;">';
					} else if (tnForm.style.display === 'block') {
						var selectedUrl_tn = urlSelect_tn.options[urlSelect_tn.selectedIndex].value;
						preview_tn.innerHTML = '<img src="'
								+ selectedUrl_tn
								+ '" alt="Anteprima" style="max-width: 100%; max-height: 100px;">';
					}
				}
			</script>
		</div>
</body>
</html>

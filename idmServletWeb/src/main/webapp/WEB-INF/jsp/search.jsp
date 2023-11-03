<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search - TrainBook</title>
<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/01-welcome.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/navbar.css'/>">

</head>
<body>
	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand" href="01-welcome"
				style="padding-right: 50px;"> <img
				src="<c:url value='/resources/img/logo_nav.png'/>" alt=""
				height="30" style="vertical-align: middle; margin: 0 10px;">
			</a>

			<!-- Menu al centro -->
			<div class="collapse navbar-collapse justify-content-center"
				id="navbarNav">
				<ul class="navbar-nav align-items-center">
					<li class="nav-item mr-3"><a class="nav-link" href="01-welcome">Welcome</a></li>
					<li class="nav-item mr-3"><a class="nav-link" href="02-login">Login</a></li>
					<li class="nav-item mr-3"><a class="nav-link" href="03-home">Home</a></li>
					<li class="nav-item mr-3"><a class="nav-link" href="06-crea-treno">Crea Treno</a></li>
					<li class="nav-item mr-3" id="searchIcon"><i class="ms-3 bi bi-search text-secondary"></i></li>					
				</ul>
			</div>

			<!-- Link a destra -->
			<div class="navbar-nav ml-auto" style="padding-left: 50px;">
				<div class="nav-item d-flex align-items-center">
					<a class="nav-link d-inline mr-1" href="04-profile">${utente.nome}
						${utente.cognome}</a> <a href="04-profile">
						<img src="<c:url value='/resources/img/profile-test.jpg'/>"
						alt="profilo" class="rounded-circle"
						style="width: 30px; height: 30px; object-fit: cover; margin-right: 10px;">
					</a>
				</div>
			</div>
		</div>
	</nav>



	<div class="container mt-5">
	
		<div class="row my-3 p-4" id="criteriaForm">
			<form action="search" method="GET" class="form-inline">
 				 <div class="form-group">
    			<label for="nome">Nome del treno: </label>
   				 <input type="text" class="form-control mx-3" id="nome" name="nome" placeholder="Nome del treno">
  				 <button type="submit" class="btn btn-dark mx-3">Submit</button>
 				 </div>
			</form>
			<i class="ms-3 bi bi-x fs-1" id="closeIcon"></i>
			
		</div>
		<div class="feed-section">
			

			<h2 class="my-3 text-center font-weight-bold">Risultati della ricerca</h2>
			
			<c:if test="${ empty criteria }">
				<h3 class="my-3 text-center font-weight-bold">Nessun treno trovato... Prova con altri parametri!</h3>
			</c:if>

			<div class="train-cards row mt-4">

				<c:forEach var="treni" items="${ criteria }">
				
				<c:set var="sommaPesi" value="0" />			
                <c:forEach var="vagone" items="${treni.vagoni}">
                    <c:set var="sommaPesi" value="${sommaPesi + vagone.peso}" />
                </c:forEach>

					<div class="col-md-6">
						<div class="card mb-4">
							<div class="card-body">
								<c:if test="${ empty treni.immagine }">
									<img src="<c:url value='/resources/img/train.jpg'/>"
									alt="Immagine Treno placeholder" class="img-fluid mb-3">
								</c:if>
								<img src="${ treni.immagine }" class="img-fluid mb-3">
								<h4 class="font-weight-bold">NOME: ${ treni.nome }</h4>
								<p>MARCA: ${ treni.marca }</p>
								<p>PESO TOTALE DEL TRENO: ${ sommaPesi } tonnellate</p>
								<p>AUTORE: ${treni.utente.nome } ${treni.utente.cognome }</p>
								<c:set var="trenoID" value="${ treni.id }" />
								
								<a href="cerca-treno?idTrenoStr=${ treni.id }" class="btn btn-dark mt-4">Dettagli</a>
								<button class="btn btn-outline-dark mt-4">Aggiungi</button>
								
							</div>
						</div>
					</div>

				</c:forEach>

			</div>

		</div>

	</div>

<script src="<c:url value='/resources/js/find.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>
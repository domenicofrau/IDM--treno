<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>TrainBook</title>
		<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon"/>
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"/>
		<!-- Custom CSS -->
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/navbar.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/hero.css'/>"/>
	</head>
   	<body>
		<!-- NAVBAR -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
			<a class="navbar-brand" href="01-welcome">
				<img class="logo-nav" src="<c:url value='/resources/img/logo_nav.png'/>" alt="" />
			</a>
			<!-- centro -->
			<div id="navbarNav" class="collapse navbar-collapse justify-content-center" >
				<ul class="navbar-nav align-items-center">
					<li class="nav-item mr-3"><a class="nav-link" href="01-welcome">Welcome</a></li>
					<li class="nav-item mr-3"><a class="nav-link" href="02-login">Login</a></li>
					<li class="nav-item active mr-3"><a class="nav-link" href="07-about">About</a></li>
					</ul>
			</div>
		</nav>
		<!-- IDEATORI -->
		<div class="container mt-5">
	  		<h2 class="text-center mb-4">Team di Sviluppo</h2>
	  		<div class="row">
		    	<!-- davide -->
		    	<div class="col-sm-4">
		      		<div class="card">
			        	<img class="card-img-top rounded-circle mx-auto d-block mt-4" style="width: 40px; height: 40px; object-fit: cover;" src="<c:url value='/resources/img/davide.jpeg'/>" alt="Davide">
			        	<div class="card-body text-center">
			          		<h5 class="card-title">Davide Borotto Dalla Vecchia</h5>
			          		<p class="card-text">borotto.davide@gmail.com</p>
		          			<a href="https://github.com/Daviduxx" class="btn btn-light btn-outline-dark mr-2 mb-2 mt-3"><i class="bi bi-github"></i></a>
	          				<a href="https://www.linkedin.com/in/davide-borotto-dalla-vecchia-5039b61b8/" class="btn btn-light btn-outline-dark ml-2 mb-2 mt-3"><i class="bi bi-linkedin"></i></a>
		        		</div>
			      	</div>
			    </div>
			    <!-- alessandro -->
			    <div class="col-sm-4">
		      		<div class="card">
			        	<img class="card-img-top rounded-circle mx-auto d-block mt-4" style="width: 40px; height: 40px; object-fit: cover;" src="<c:url value='/resources/img/ale.png'/>" alt="Alessandro">
			        	<div class="card-body text-center">
			          		<h5 class="card-title">Alessandro Bellante</h5>
		          			<p class="card-text">alessandro@email.com</p>
			          		<a href="<link_github_alessandro>" class="btn btn-light btn-outline-dark mr-2 mb-2 mt-3"><i class="bi bi-github"></i></a>
			          		<a href="<link_linkedin_alessandro>" class="btn btn-light btn-outline-dark ml-2 mb-2 mt-3"><i class="bi bi-linkedin"></i></a>
			        	</div>
			      	</div>
			    </div>
			    <!-- domenico -->
			    <div class="col-sm-4">
		      		<div class="card">
			        	<img class="card-img-top rounded-circle mx-auto d-block mt-4" style="width: 40px; height: 40px; object-fit: cover;" src="<c:url value='/resources/img/dome.png'/>" alt="Domenico">
			        	<div class="card-body text-center">
			          		<h5 class="card-title">Domenico Frau</h5>
			          		<p class="card-text">domenico.frau@outlook.com</p>
			          		<a href="https://github.com/AleBellEpicode" target="_blank" class="btn btn-light btn-outline-dark mr-2 mb-2 mt-3"><i class="bi bi-github"></i></a>
			          		<a href="https://www.linkedin.com/in/alessandro-bellante-886246243/" target="_blank" class="btn btn-light btn-outline-dark ml-2 mb-2 mt-3"><i class="bi bi-linkedin"></i></a>
			        	</div>
			      	</div>
			    </div>
		    </div>
		    <!-- DESCRIZIONE -->
			<div class="container mt-5">
				<h2 class="text-center mt-5 mb-3">Descrizione</h2>
				<div class="row">
					<div class="col-12">
						<p class="mb-3" style="text-align: justify;">TrainBook è un social network centrato sul mondo ferroviario. Il progetto, sviluppato nel corso dell'IDM Academy 16, 
							consiste in una piattaforma web dove gli utenti possono "creare" treni personalizzati e condividere le loro creazioni 
							con altri appassionati. Per accedere a TrainBook, gli utenti possono effettuare il login utilizzando le loro credenziali, 
							o registrarsi se non dispongono ancora di un account. Una volta effettuato l'accesso, gli utenti verranno indirizzati 
							alla home page, che funge da feed e mostra tutti i treni creati dagli utenti di TrainBook, permettendo loro di 
							vedere le creazioni di altri appassionati e interagire con esse.
						</p>  
						<h2 class="text-center mt-5 mb-3">Caratteristiche</h2>
						<p class="mb-3" style="text-align: justify;">L'applicazione consente agli utenti di creare due marche di treni inserendo una stringa composta dai seguenti caratteri:
							<ul>
								<li>H per il vagone locomotiva;</li>
								<li>P per il vagone passeggeri;</li>
								<li>B per il vagone passeggeri business;</li>
								<li>R per il vagone ristorante;</li>
								<li>C per il vagone cargo;</li>
							</ul>
							La creazione dei treni è gestita tramite l'inserimento di una stringa composta da caratteri i quali rappresentano 
							i diversi tipi di vagoni.
							All'interno del feed, ogni treno può essere acquistato dagli altri utenti utilizzando una valuta interna 
							chiamata "bitTrain". Una volta acquistato, il treno viene aggiunto alla lista dei treni personali dell'utente, 
							mentre il costo in bitTrain viene sottratto dal saldo del loro budget. Per guadagnare altri bitTrain, gli utenti 
							possono restituire uno o più dei loro treni alla piattaforma, oppure guadagnare dalla vendita di un treno ad un 
							altro utente.
						</p>
						<h2 class="text-center mt-5 mb-3">Tecnologie Utilizzate</h2>
						<p class="mb-3" style="text-align: justify;">Abbiamo usato Java v.17 per la struttura dei dati attraverso l’implementazione di alcuni design pattern come, ad esempio, 
							il Builder e l’Abstract Factory; per le dipendenze, invece, è stato utilizzato il framework Spring MVC.
							L'ambiente di sviluppo utilizzato è Eclipse in un progetto Maven con l'utilizzo di Git per il versioning del codice 
							e per la suddivisione dei task, con Tomcat come application server. Inoltre, abbiamo utilizzato MySQL per la scrittura 
							del database ma l’applicazione è configurata anche per l’utilizzo di PostgreSQL. Per l'implementazione di JPA 
							e per la persistenza dei dati, abbiamo usato Hibernate.
							Il frontend è stato realizzato in HTML5 e CSS3, con l'utilizzo di Bootstrap per alcune componenti della pagina web 
							e Javascript per logica e gestione dati. 
							Il tutto è stato gestito all’interno di pagine .jsp usando anche tag custom JSTL.
						</p>
						<h2 class="text-center mt-5 mb-3">Conclusione</h2>
						<p class="mb-3" style="text-align: justify;">TrainBook è il risultato del lavoro di squadra e dell'impegno di tutti i membri del team nel creare una piattaforma 
							unica nel suo genere. Questa collaborazione è stata molto utile per tutto il team, anche perché abbiamo imparato 
							a lavorare con la metodologia SCRUM.
						</p>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
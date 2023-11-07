<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1" />
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
			         <li class="nav-item active mr-3">
			            <a class="nav-link" href="01-welcome">Welcome</a>
			         </li>
			         <li class="nav-item mr-3">
			            <a class="nav-link" href="02-login">Login</a>
			         </li>
			         <li class="nav-item mr-3">
			            <a class="nav-link" href="07-about">About</a>
			         </li>
		      	</ul>
		   </div>
		</nav>
      	<!-- HERO -->
		<div class="container mt-5">
			<div class="row">
		    	<div class="col-12 col-md-6 p-3">
		      		<h1 class="mainTitle">Benvenuto su TrainBook!</h1>
			         <p class="mainSubTitle">
			            TrainBook è il primo social network dedicato agli appassionati di
			            treni. Qui puoi creare il tuo treno personalizzato e condividerlo
			            con il resto del mondo. Esplora le creazioni degli altri utenti e
			            lasciati ispirare!
			        </p>
		      		<div class="d-flex justify-content-between">
		            	<a class="btn btn-primary mt-4" href="02-login">Login</a>
		            	<a class="btn btn-outline-dark mt-4" href="02-login?show=register">Registrati</a>
		      		</div>
		      	</div>
		      	<div class="col-12 col-md-6 my-3">
		      		<img class="img-fluid mt-5" src="<c:url value='/resources/img/trainbg.png'/>" alt="Train Background"/>
		      	</div>
		   	</div>
		</div>		
   	</body>
</html>
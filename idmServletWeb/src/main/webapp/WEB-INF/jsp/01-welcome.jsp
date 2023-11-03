<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/01-welcome.css'/>"/>
	</head>
   <body>
   
		<!-- NAVBAR -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		   <a class="navbar-brand" href="01-welcome">
		      <img src="<c:url value='/resources/img/logo_nav.png'/>" alt="" class="logo-nav"/>
		   </a>
		   <!-- Center -->
		   <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
		      <ul class="navbar-nav align-items-center">
		         <li class="nav-item active mr-3">
		            <a class="nav-link" href="01-welcome">Welcome</a>
		         </li>
		         <li class="nav-item mr-3">
		            <a class="nav-link" href="02-login">Login</a>
		         </li>
		      </ul>
		   </div>
		</nav>

      
      <!-- HERO -->
		<div class="container mt-5">
		   <div class="row">
		      <div class="col-12 col-md-6 p-3">
		         <h1 class="mainTitle">Benvenuto su TrainBook!</h1>
		         <p class="mainPara">
		            TrainBook è il primo social network dedicato agli appassionati di
		            treni. Qui puoi creare il tuo treno personalizzato e condividerlo
		            con il resto del mondo. Esplora le creazioni degli altri utenti e
		            lasciati ispirare!
		         </p>
		         <!-- Button container -->
		         <div class="d-flex justify-content-between">
		            <a href="02-login" class="btn btn-primary mt-4">Login</a>
		            <a href="02-login" class="btn btn-outline-dark mt-4">Registrati</a>
		         </div>
		      </div>
		      <div class="col-12 col-md-6 my-3">
		         <img class="img-fluid mt-5" src="<c:url value='/resources/img/trainbg.png'/>" alt="Train Background"/>
		      </div>
		   </div>
		</div>
      
   </body>
</html>
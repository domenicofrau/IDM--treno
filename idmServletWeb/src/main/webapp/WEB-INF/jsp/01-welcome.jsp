<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
		      </ul>
		   </div>
		</nav>
      	<!-- HERO -->
		<div class="container mt-5">
		   <div class="row">
		      <div class="col-12 col-md-6 p-3">
		         <h1 class="mainTitle">Benvenuto su TrainBook!</h1>
		         <p class="mainSubTitle">
		            TrainBook � il primo social network dedicato agli appassionati di
		            treni. Qui puoi creare il tuo treno personalizzato e condividerlo
		            con il resto del mondo. Esplora le creazioni degli altri utenti e
		            lasciati ispirare!
		         </p>
		         <div class="d-flex justify-content-between">
		            <a class="btn btn-primary mt-4" href="02-login">Login</a>
		            <a class="btn btn-outline-dark mt-4" href="02-login">Registrati</a>
		         </div>
		      </div>
		      <div class="col-12 col-md-6 my-3">
		         <img class="img-fluid mt-5" src="<c:url value='/resources/img/trainbg.png'/>" alt="Train Background"/>
		      </div>
		   </div>
		</div>
   	</body>
</html>
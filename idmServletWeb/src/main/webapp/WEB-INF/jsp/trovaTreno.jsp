<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trova Treno</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

<h1>Trova Treno</h1>

<form action="cerca-treno" method="get">
    <label for="idTreno">ID del Treno:</label>
    <input type="text" id="idTreno" name="idTrenoStr" required>
    <input type="submit" value="Cerca Treno">
</form>

<c:if test="${not empty errore}">
    <div style="color: red;">
        <h3>${errore}</h3>
    </div>
</c:if>

<c:if test="${not empty treno}">

	<h3>Ecco il treno richiesto</h3>

	<div class="row">
	
		<div class="col"></div>

		<div class="col-12 col-md-6">
	
			<div class="card mb-3">
  			<img src="${ treno.immagine }" class="img-fluid mb-3">
  				<div class="card-body">
    				<h3 class="card-title">${ treno.nome }</h3>
    				<p class="card-text">${ treno.marca }</p>
    				<p class="card-text">AUTORE: ${ treno.utente.nome } ${ treno.utente.cognome }</p>
    				<p class="card-text">PREZZO TOTALE: prezzo</p>
    				<p class="card-text">STRUTTURA DEL TRENO</p>
  				</div>
  				<div class="card-body">
    				<h3 class="card-title">Dettaglio vagoni:</h3>
    				
    				<div class="row">
    				
    				<div class="col-12">
    				<p class="card-text">LOCOMOTIVE:</p>
    				</div>
    				
    				
    				<c:forEach var="locomotiva" items="${ locomotive }">
        	 	
        	 			<div class="col-12 col-md-6">
							<div class="card mb-4">
								<div class="card-body">
									<p>${ locomotiva.peso }</p>
									<p>${ locomotiva.prezzo }</p>
									<p>${ locomotiva.lunghezza }</p>
									<p>${ locomotiva.pesoTrainabile }</p>
								</div>
							</div>
						</div>
				
    		  		</c:forEach>
    		  		
    		  		<div class="col-12">
    				<p class="card-text">VAGONI PASSEGGERI:</p>
    				</div>
    		  		
    		  		
    		  		<c:forEach var="passeggeri" items="${ passeggeri }">
        	 	
        	 			<div class="col-12 col-md-6">
							<div class="card mb-4">
								<div class="card-body">
									<p>${ passeggeri.peso }</p>
									<p>${ passeggeri.prezzo }</p>
									<p>${ passeggeri.lunghezza }</p>
									<p>${ passeggeri.postiNormali }</p>
									<p>${ passeggeri.postiDisabili }</p>
									<p>${ passeggeri.servizi }</p>
								</div>
							</div>
						</div>
				
    		  		</c:forEach>
    		  		
    		  		<div class="col-12">
    				<p class="card-text">VAGONI PASSEGGERI BUSINESS:</p>
    				</div>
    		  		
    		  		<c:forEach var="passeggeriB" items="${ passeggeriB }">
        	 	
        	 			<div class="col-12 col-md-6">
							<div class="card mb-4">
								<div class="card-body">
									<p>${ passeggeriB.peso }</p>
									<p>${ passeggeriB.prezzo }</p>
									<p>${ passeggeriB.lunghezza }</p>
									<p>${ passeggeriB.postiNormali }</p>
									<p>${ passeggeriB.postiDisabili }</p>
									<p>${ passeggeriB.servizi }</p>
								</div>
							</div>
						</div>
				
    		  		</c:forEach>
    		  		
    		  		<div class="col-12">
    				<p class="card-text">VAGONI RISTORANTE:</p>
    				</div>
    		  		
    		  		<c:forEach var="ristorante" items="${ ristoranti }">
        	 	
        	 			<div class="col-12 col-md-6">
							<div class="card mb-4">
								<div class="card-body">
									<p>${ ristorante.peso }</p>
									<p>${ ristorante.prezzo }</p>
									<p>${ ristorante.lunghezza }</p>
									<p>${ ristorante.tavoli }</p>
								</div>
							</div>
						</div>
				
    		  		</c:forEach>
    		  		
    		  		<div class="col-12">
    				<p class="card-text">VAGONI CARGO:</p>
    				</div>
    				
    				<c:choose>
    				
  						<c:when test="${ empty cargo }">
    						<p>Non ci sono vagoni cargo su questo treno</p>
  						</c:when>
  						
 						 <c:when test="${not empty cargo}">
 						 
 						 	<c:forEach var="cargo" items="${ cargo }">
        	 	
        	 					<div class="col-12 col-md-6">
									<div class="card mb-4">
										<div class="card-body">
											<p>${ cargo.peso }</p>
											<p>${ cargo.prezzo }</p>
											<p>${ cargo.lunghezza }</p>
											<p>${ cargo.tipoMerce }</p>
										</div>
									</div>
								</div>
				
    		  				</c:forEach>
    
 						 </c:when>
 						 
						</c:choose>
    				
    				</div>

  				</div>
			</div>
	
		</div>
		
		<div class="col"></div>
	
	</div>

</c:if>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>


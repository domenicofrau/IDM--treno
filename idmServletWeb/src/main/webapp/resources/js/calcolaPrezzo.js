
	var userBitTrain = 1;
document.addEventListener('DOMContentLoaded', function() {
	document.getElementById('siglaFR').addEventListener('input', function() {
		var sigla = document.getElementById('siglaFR').value;
		var button = document.getElementById('creaTreno_fr');
		var saldo= parseFloat(document.getElementById('saldo').textContent);
		
		if (sigla === '') {
			button.innerText = 'Crea il treno';
		} else {
			
			var prezzo = calcolaPrezzo_fr(sigla);
			var prezzo2= parseFloat(prezzo);
			if(saldo<prezzo2){
				button.innerHTML='saldo non sufficente';
				button.disabled = true;
			}else
			button.innerHTML = 'Crea il treno (' + prezzo + ' <img class="bit-train-icon" src="' + contextPath + '/resources/img/bitTrain.png"/>)';
		}
	});

	function calcolaPrezzo_fr(sigla) {
		var prezzo = 0;
		for (var i = 0; i < sigla.length; i++) {
			switch (sigla[i].toUpperCase()) {
				case 'H':
					prezzo += 150;
					break;
				case 'P':
					prezzo += 50;
					break;
				case 'B':
					prezzo += 70;
					break;
				case 'R':
					prezzo += 100;
					break;
				case 'C':
					prezzo += 35;
					break;
			}
		}
		return prezzo;
	}
});

document.addEventListener('DOMContentLoaded', function() {
	document.getElementById('siglaTN').addEventListener('input', function() {
		var sigla = document.getElementById('siglaTN').value;
		var button = document.getElementById('creaTreno_tn');
		if (sigla === '') {
			button.innerText = 'Crea il treno';
		} else {
			var prezzo = calcolaPrezzo_tn(sigla);
			button.innerHTML = 'Crea il treno (' + prezzo + ' <img class="bit-train-icon" src="' + contextPath + '/resources/img/bitTrain.png"/>)';
		}
	});

	function calcolaPrezzo_tn(sigla) {
		var prezzo = 0;
		for (var i = 0; i < sigla.length; i++) {
			switch (sigla[i].toUpperCase()) {
				case 'H':
					prezzo += 150;
					break;
				case 'P':
					prezzo += 40;
					break;
				case 'B':
					prezzo += 60;
					break;
				case 'R':
					prezzo += 120;
					break;
				case 'C':
					prezzo += 30;
					break;
			}
		}
		return prezzo;
	}
});
document.addEventListener("DOMContentLoaded", function() {

	const apiUrl = 'https://raw.githubusercontent.com/matteocontrini/comuni-json/master/comuni.json';

	fetch(apiUrl)
		.then(response => response.json())
		.then(data => {

			const regioniUniche = new Set(data.map(comune => comune.regione.nome));

			const regioniOrdinate = Array.from(regioniUniche).sort();

			const selectFr = document.getElementById('regione_fr');
			const selectTn = document.getElementById('regione_tn');
			const selectAll = document.getElementById('regione');
			
			regioniOrdinate.forEach(regione => {
				if(selectFr && selectTn){
				const optionFr = document.createElement('option');
				optionFr.value = regione;
				optionFr.text = regione;
				selectFr.appendChild(optionFr);

				const optionTn = document.createElement('option');
				optionTn.value = regione;
				optionTn.text = regione;
				selectTn.appendChild(optionTn);
				}
				
				if(selectAll){
				const optionAll = document.createElement('option');
				optionAll.value = regione;
				optionAll.text = regione;
				selectAll.appendChild(optionAll);	
				}
				
			});
		})
});
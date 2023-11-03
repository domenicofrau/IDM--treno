document.getElementById("frForm").addEventListener("submit",
	function(event) {
		var sigla = document.getElementById("siglaFR");
		if (sigla.value.charAt(0).toUpperCase() !== "H") {
			sigla.classList.add("is-invalid");
			event.preventDefault(); // Previene l'invio del form
		} else {
			sigla.classList.remove("is-invalid");
		}
	});

document.getElementById("tnForm").addEventListener("submit",
	function(event) {
		var sigla = document.getElementById("siglaTN");
		if (sigla.value.charAt(0).toUpperCase() !== "H") {
			sigla.classList.add("is-invalid");
			event.preventDefault(); // Previene l'invio del form
		} else {
			sigla.classList.remove("is-invalid");
		}
	});
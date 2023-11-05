// Funzione per verificare se la stringa contiene solo i caratteri permessi
function containsOnlyAllowedCharacters(str) {
	return /^[hpbcry]*$/i.test(str);
}

document.getElementById("siglaFR").addEventListener("input", function(event) {
	var sigla = event.target;
	var feedbackStartsWithHFR = document.getElementById("feedbackStartsWithHFR");
	var value = sigla.value;

	// Rimuovi i caratteri non permessi
	var newValue = value.split('').filter(function(char) {
		return containsOnlyAllowedCharacters(char);
	}).join('');

	// Se il valore è stato modificato, aggiorna il campo di input
	if (value !== newValue) {
		sigla.value = newValue;
	}

	if (newValue.charAt(0).toUpperCase() !== "H") {
		feedbackStartsWithHFR.style.display = "block";
	} else {
		feedbackStartsWithHFR.style.display = "none";
	}
});

document.getElementById("siglaTN").addEventListener("input", function(event) {
	var sigla = event.target;
	var feedbackStartsWithHTN = document.getElementById("feedbackStartsWithHTN");
	var value = sigla.value;

	// Rimuovi i caratteri non permessi
	var newValue = value.split('').filter(function(char) {
		return containsOnlyAllowedCharacters(char);
	}).join('');

	// Se il valore è stato modificato, aggiorna il campo di input
	if (value !== newValue) {
		sigla.value = newValue;
	}

	if (newValue.charAt(0).toUpperCase() !== "H") {
		feedbackStartsWithHTN.style.display = "block";
	} else {
		feedbackStartsWithHTN.style.display = "none";
	}
});

// Controllo al momento del submit per la presenza di 'P' senza 'R'
document.getElementById("frForm").addEventListener("submit", function(event) {
	var sigla = document.getElementById("siglaFR").value;
	var feedbackNeedsRFR = document.getElementById("feedbackNeedsRFR");

	if (sigla.toUpperCase().includes("P") && !sigla.toUpperCase().includes("R")) {
		feedbackNeedsRFR.style.display = "block";
		event.preventDefault(); // Previene l'invio del form
	} else {
		feedbackNeedsRFR.style.display = "none";
	}
});

document.getElementById("tnForm").addEventListener("submit", function(event) {
	var sigla = document.getElementById("siglaTN").value;
	var feedbackNeedsRTN = document.getElementById("feedbackNeedsRTN");

	if (sigla.toUpperCase().includes("P") && !sigla.toUpperCase().includes("R")) {
		feedbackNeedsRTN.style.display = "block";
		event.preventDefault(); // Previene l'invio del form
	} else {
		feedbackNeedsRTN.style.display = "none";
	}
});

document.getElementById("frForm").addEventListener("submit", function(event) {
    var sigla = document.getElementById("siglaFR").value.toUpperCase(); // Usiamo toUpperCase per rendere il controllo case-insensitive
    var feedbackNeedsRFR = document.getElementById("feedbackNeedsRFR");
    var feedbackNotAllowedC = document.getElementById("feedbackNotAllowedC"); // Assicurati che questo elemento esista nell'HTML

    // Resetta i messaggi di feedback
    feedbackNeedsRFR.style.display = "none";
    feedbackNotAllowedC.style.display = "none";

    var hasP = sigla.includes("P");
    var hasC = sigla.includes("C");
    var hasB = sigla.includes("B");
    var hasR = sigla.includes("R");

    if (hasC && (hasP || hasB || hasR)) {
        feedbackNotAllowedC.style.display = "block";
        event.preventDefault();
    } else if (hasP && !hasR) {
        feedbackNeedsRFR.style.display = "block";
        event.preventDefault();
    }
});

document.getElementById("tnForm").addEventListener("submit", function(event) {
    var sigla = document.getElementById("siglaTN").value.toUpperCase(); // Usiamo toUpperCase per rendere il controllo case-insensitive
    var feedbackNeedsRTN = document.getElementById("feedbackNeedsRTN");
    var feedbackNotAllowedC = document.getElementById("feedbackNotAllowedC"); // Assicurati che questo elemento esista nell'HTML

    // Resetta i messaggi di feedback
    feedbackNeedsRTN.style.display = "none";
    feedbackNotAllowedC.style.display = "none";

    var hasP = sigla.includes("P");
    var hasC = sigla.includes("C");
    var hasB = sigla.includes("B");
    var hasR = sigla.includes("R");

    if (hasC && (hasP || hasB || hasR)) {
        feedbackNotAllowedC.style.display = "block";
        event.preventDefault();
    } else if (hasP && !hasR) {
        feedbackNeedsRTN.style.display = "block";
        event.preventDefault();
    }
});

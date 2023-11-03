function showForm() {
	var frForm = document.getElementById("frForm");
	var tnForm = document.getElementById("tnForm");
	var factory = document
		.querySelector('input[name="factory"]:checked').value;

	if (factory === "fr") {
		frForm.style.display = "block";
		tnForm.style.display = "none";
		document.getElementById("siglaTN").value = "";
		document.getElementById("nomeTrenoTN").value = "";
		document.getElementById("checkDefaultForm_fr").checked = true;
		document.getElementById("checkCustomForm_fr").checked = false;
		document.getElementById("urlImage_fr").value = "";
		document.getElementById("preview_custom_tn").innerHTML = ""; // Svuota l'anteprima del form tn
		showImageForm();
	} else if (factory === "tn") {
		frForm.style.display = "none";
		tnForm.style.display = "block";
		document.getElementById("siglaFR").value = "";
		document.getElementById("nomeTrenoFR").value = "";
		document.getElementById("checkDefaultForm_tn").checked = true;
		document.getElementById("checkCustomForm_tn").checked = false;
		document.getElementById("urlImage_tn").value = "";
		document.getElementById("preview_custom_fr").innerHTML = ""; // Svuota l'anteprima del form fr
		showImageForm();
	}

	updatePreview();
	showImageForm();
}
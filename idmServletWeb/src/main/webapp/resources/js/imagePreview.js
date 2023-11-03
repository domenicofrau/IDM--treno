
function showImageForm() {
	var defaultForm_tn = document.getElementById("defaultForm_tn");
	var customForm_tn = document.getElementById("customForm_tn");
	var defaultForm_fr = document.getElementById("defaultForm_fr");
	var customForm_fr = document.getElementById("customForm_fr");

	if (document.getElementById("checkDefaultForm_tn").checked) {
		defaultForm_tn.style.display = "block";
		customForm_tn.style.display = "none";
	} else if (document.getElementById("checkCustomForm_tn").checked) {
		defaultForm_tn.style.display = "none";
		customForm_tn.style.display = "block";
	}

	if (document.getElementById("checkDefaultForm_fr").checked) {
		defaultForm_fr.style.display = "block";
		customForm_fr.style.display = "none";
	} else if (document.getElementById("checkCustomForm_fr").checked) {
		defaultForm_fr.style.display = "none";
		customForm_fr.style.display = "block";
	}
}

function updateCustomPreview(formId) {
	var url = document.getElementById("urlImage_" + formId).value;
	var preview = document.getElementById("preview_custom_" + formId);
	preview.innerHTML = "";
	var img = document.createElement("img");
	document.getElementById("urlSelect_fr").value = "";
	document.getElementById("urlSelect_tn").value = "";
	img.src = url;
	img.style.maxHeight = "100px";
	img.style.maxWidth = "100%";
	img.onerror = function() {
		preview.innerHTML = "L'immagine non può essere caricata. Si prega di controllare l'URL e riprovare.";
	};

	preview.appendChild(img);
}

function updatePreview() {
	var frForm = document.getElementById("frForm");
	var tnForm = document.getElementById("tnForm");
	var urlSelect_fr = document.getElementById("urlSelect_fr");
	var urlSelect_tn = document.getElementById("urlSelect_tn");
	var preview_fr = document.getElementById("preview_fr");
	var preview_tn = document.getElementById("preview_tn");

	if (frForm.style.display === "block") {
		var selectedUrl_fr = urlSelect_fr.options[urlSelect_fr.selectedIndex].value;
		preview_fr.innerHTML = '<img src="'
			+ selectedUrl_fr
			+ '" alt="Anteprima" style="max-width: 100%; max-height: 100px;">';
	} else if (tnForm.style.display === "block") {
		var selectedUrl_tn = urlSelect_tn.options[urlSelect_tn.selectedIndex].value;
		preview_tn.innerHTML = '<img src="'
			+ selectedUrl_tn
			+ '" alt="Anteprima" style="max-width: 100%; max-height: 100px;">';
	}
}
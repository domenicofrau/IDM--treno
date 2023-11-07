document.getElementById('confirmDelete').addEventListener('click',
	function() {
		document.getElementById('deleteForm').submit();
	});

function submitForm(idTreno) {
	document.getElementById('formStatoVendita' + idTreno).submit();
}

document.getElementById('confermaCompra').addEventListener('click',
	function() {
		document.getElementById('compraForm').submit();
	});


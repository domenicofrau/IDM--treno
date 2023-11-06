function showRegisterForm() {
	document.getElementById('loginForm').style.display = 'none';
	document.getElementById('registerForm').style.display = 'block';
}

function showLoginForm() {
	document.getElementById('registerForm').style.display = 'none';
	document.getElementById('loginForm').style.display = 'block';
}

window.onload = function() {
	const params = new URLSearchParams(window.location.search);
	if (params.get('show') === 'register') {
		showRegisterForm();
	} else {
		showLoginForm();
	}
};

function updateProfilePicPreview() {
	var inputUrl = document.getElementsByName('profilePic')[0].value;
	var profilePicPreview = document.getElementById('profilePicPreview');
	if (inputUrl) {
		profilePicPreview.src = inputUrl;
	} else {
		profilePicPreview.src = profilePicPreview.getAttribute('data-default-src');
	}
}
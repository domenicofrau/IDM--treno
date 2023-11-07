$(document).ready(function() {
	var loggedInUser = '<%=session.getAttribute("loggedInUser")%>';
	if (loggedInUser) {
		$.post('doLogin', { email: loggedInUser.email, password: loggedInUser.password }, function(data) {
			window.location.href = '03-home';
		}).fail(function() {
			window.location.href = 'pagina-errore-login';
		});
	}
});
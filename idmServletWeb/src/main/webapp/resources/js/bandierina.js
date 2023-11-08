document.addEventListener("DOMContentLoaded", function() {
	const apiUrl = 'https://restcountries.com/v3.1/all';
	const userCountryName = document.body.getAttribute('data-nazione');

	fetch(apiUrl)
		.then(response => response.json())
		.then(data => {
			const userCountry = data.find(country => country.name.common === userCountryName);

			const flagImageElement = document.querySelector('.img-flag');
			if (userCountry && userCountry.flags && userCountry.flags.png && flagImageElement) {
				flagImageElement.src = userCountry.flags.png;
			}
				flagImageElement.setAttribute('title', userCountry.name.common);
				flagImageElement.setAttribute('data-toggle', 'tooltip');
				flagImageElement.setAttribute('data-placement', 'right'); 
				
				$(flagImageElement).tooltip();

		})

});
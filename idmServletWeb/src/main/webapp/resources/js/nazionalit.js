document.addEventListener("DOMContentLoaded", function() {
    const apiUrl = 'https://restcountries.com/v3.1/all';

    fetch(apiUrl)
    .then(response => response.json())
    .then(data => {
        const selectElement = document.getElementById('nazione');
        if (!selectElement) {
            return;
        }
        
        const defaultOption = document.createElement('option');
        defaultOption.textContent = "Scegli una nazione";
        defaultOption.value = "";
        selectElement.appendChild(defaultOption);

        defaultOption.selected = true;
        
        data.sort((a, b) => a.name.common.localeCompare(b.name.common));

		data.forEach(country => {
		    const option = document.createElement('option');
		    option.value = country.name.common;
		    option.textContent = country.name.common;
		    selectElement.appendChild(option);
		});
    })
    
});
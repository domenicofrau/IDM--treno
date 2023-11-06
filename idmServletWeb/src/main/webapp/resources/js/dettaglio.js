function hideAllDetails() {
    document.querySelectorAll('.category-details').forEach((detail) => {
        detail.style.display = 'none';
    });
    
    document.querySelectorAll('.nav-link').forEach((navLink) => {
        navLink.classList.remove('active');
    });
}

function showDetails(categoryId) {
    hideAllDetails();
    
    var detailsElement = document.getElementById(categoryId + '-details');
    if(detailsElement) {
        detailsElement.style.display = 'block';
    }
    
    element.classList.add('active');
}

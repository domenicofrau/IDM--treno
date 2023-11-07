function showModalPic() {
    $('#editImageModal').modal('show');
}

// Aggiungi un listener per l'input dell'URL per aggiornare l'anteprima dell'immagine
document.getElementById('newImageUrl').addEventListener('input', function() {
    var url = this.value;
    var imgPreview = document.getElementById('previewImage');
    if(url) {
        imgPreview.src = url;
        imgPreview.style.display = 'block';
    } else {
        imgPreview.style.display = 'none';
    }
});
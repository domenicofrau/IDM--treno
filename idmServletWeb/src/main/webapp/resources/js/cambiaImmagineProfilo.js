function showModalPic() {
	$('#editImageModal').modal('show');
}

document.getElementById('newImageUrl').addEventListener('input', function() {
	var url = this.value;
	var imgPreview = document.getElementById('previewImage');
	if (url) {
		imgPreview.src = url;
		imgPreview.style.display = 'block';
	} else {
		imgPreview.style.display = 'none';
	}
});

function showModalUser() {
	$('#editUserModal').modal('show');
}
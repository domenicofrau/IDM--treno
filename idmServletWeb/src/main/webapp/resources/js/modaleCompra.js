$(document).ready(function(){
    $('#confermaAcquistoModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget);
        var idTreno = button.data('id');
        $('#formAcquisto').find('input[name="id"]').val(idTreno);
    });

    $('#confermaAcquisto').click(function(){
        $('#formAcquisto').submit();
    });
});
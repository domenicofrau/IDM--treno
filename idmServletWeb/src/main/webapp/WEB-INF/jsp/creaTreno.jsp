<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crea Treno</title>
</head>
<body>

Scegli la factory del treno:

<!-- selettore -->

<form id="factoryForm">
    <input type="radio" name="factory" value="fr" id="fr" onchange="showForm()"> FR
    <input type="radio" name="factory" value="tn" id="tn" onchange="showForm()"> TN
</form>

<div id="frForm" style="display: none;">
    <!-- Form per FR -->
    <form method="POST" action="crea-treno-fr">
        <table>
            <tr>
                <td>Sigla:</td>
                <td><input type="text" name="sigla"></td>
            </tr>
            <tr>
                <td>Nome Treno:</td>
                <td><input type="text" name="nomeTreno"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Invia"></td>
            </tr>
        </table>
    </form>
</div>

<div id="tnForm" style="display: none;">
    <!-- Form per TN -->
    <form method="POST" action="crea-treno-tn">
        <table>
            <tr>
                <td>Sigla:</td>
                <td><input type="text" name="sigla"></td>
            </tr>
            <tr>
                <td>Nome Treno:</td>
                <td><input type="text" name="nomeTreno"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Invia"></td>
            </tr>
        </table>
    </form>
</div>

<script>
function showForm() {
    var fr = document.getElementById('fr');
    var tn = document.getElementById('tn');
    var frForm = document.getElementById('frForm');
    var tnForm = document.getElementById('tnForm');

    if (fr.checked) {
        frForm.style.display = 'block';
        tnForm.style.display = 'none';
    } else if (tn.checked) {
        frForm.style.display = 'none';
        tnForm.style.display = 'block';
    }
}
</script>

</body>
</html>

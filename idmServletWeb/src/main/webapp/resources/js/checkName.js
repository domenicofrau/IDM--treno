const inputNomeTrenoFR = document.getElementById('nomeTrenoFR');
const inputNomeTrenoTN = document.getElementById('nomeTrenoTN');
const nomiTreniElement = document.getElementById('nomiTreni');
const sameNameFR = document.getElementById('feedbackSameNameFR');
const sameNameTN = document.getElementById('feedbackSameNameTN');

inputNomeTrenoFR.addEventListener('input', (event) => {
  const inputValue = event.target.value.trim();
const nomiTreniText = nomiTreniElement.textContent;
  const nomiTreniList = nomiTreniText.split(',').map(str => str.trim());
  if (nomiTreniList.includes(inputValue)) {
    sameNameFR.style.display = "block";
  } else {
    sameNameFR.style.display = "none";
  }
});



inputNomeTrenoTN.addEventListener('input', (event) => {
  const inputValue = event.target.value.trim();
  // Ottieni il testo contenuto nell'elemento 'nomiTreni'
  const nomiTreniText = nomiTreniElement.textContent || nomiTreniElement.innerText;

  if (nomiTreniText.includes(inputValue)) {
    sameNameTN.style.display = "block";
  } else {
    sameNameTN.style.display = "none";
  }
});
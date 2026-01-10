document.addEventListener('DOMContentLoaded', function() {
    var personaggi = document.querySelectorAll('.personaggio');
    var prontoButton = document.getElementById('pronto-button');

    prontoButton.setAttribute('disabled', 'disabled');

    personaggi.forEach(function(personaggio) {
        var confirmationBox = personaggio.querySelector('.confirmation-box');

        personaggio.addEventListener('click', function() {
            if (confirmationBox.textContent === '✘') {
                confirmationBox.textContent = '✔';
                personaggio.classList.add('selected');
            } else {
                confirmationBox.textContent = '✘';
                personaggio.classList.remove('selected'); 
            }

            var almenoUnoSelezionato = Array.from(personaggi).some(function(p) {
                return p.classList.contains('selected');
            });

            if (almenoUnoSelezionato) {
                prontoButton.removeAttribute('disabled');
            } else {
                prontoButton.setAttribute('disabled', 'disabled');
            }
        });
    });
});

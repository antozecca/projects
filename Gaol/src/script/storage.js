function inizializzaStorage() {
    var utenti = ['Giocatore_1', 'Giocatore_2', 'Giocatore_3', 'Giocatore_4'];
    var classi = ['stregone', 'cavaliere', 'cacciatrice', 'chierico'];

    utenti.forEach(function(utente) {
        var dati = caricaDati(utente);

        if (!dati) {
            dati = {
                stats: {},
                classes: {}
            };

            classi.forEach(function(classe) {
                dati.classes[classe] = {
                    livello: 1,
                    esperienza: 0
                };
            });

            dati.stats.punteggioMassimo = 0;
            dati.stats.danniInflitti = 0;
            dati.stats.danniSubiti = 0;
            dati.stats.esperienzaTotale = 0;
            dati.stats.partiteGiocate = 0;
            dati.stats.vittorieTotali = 0;
        }

        localStorage.setItem(utente, JSON.stringify(dati));
    });
}

function caricaDati(utente) {
    return JSON.parse(localStorage.getItem(utente)) || null;
}

inizializzaStorage();

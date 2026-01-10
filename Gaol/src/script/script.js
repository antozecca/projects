const playButton = document.getElementById("playButton");

playButton.addEventListener("click", () => {
    window.location.href = "game_lobby.php";
});

const classesButton = document.getElementById("classesButton");

classesButton.addEventListener("click", () => {
    window.location.href = "classes.php";
});

const progressButton = document.getElementById("progressButton");

progressButton.addEventListener("click", () => {
    window.location.href = "progress.php";
});

const exitButton = document.getElementById("exitButton");

exitButton.addEventListener("click", () => {
    const result = confirm("Sicuro di voler tornare alla schermata iniziale?");
    if (result) {
        fetch('logout.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === "success") {
                window.location.href = "index.html";
            } else {
                alert("Errore durante la disconnessione.");
            }
        })
        .catch(error => console.error('Errore:', error));
    }
});

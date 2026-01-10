
document.addEventListener('DOMContentLoaded', function() {
    /*-------------------------SLIDER IMMAGINI-------------------------------*/ 
    const slider = document.querySelector('.slider');
    let currentIndex = 0;
    const slides = document.querySelectorAll('.slider img');
    const totalSlides = slides.length;

    function autoScroll() {
        console.log("Scrolling to slide: " + currentIndex);
        currentIndex = (currentIndex + 1) % totalSlides;
        slider.scrollTo({
            left: currentIndex * slider.clientWidth,
            behavior: 'smooth'
        });
    }
    setInterval(autoScroll, 4500);
});

document.getElementById('get-location-btn').addEventListener('click', function() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
        var lat = position.coords.latitude;
        var lon = position.coords.longitude;
        
        document.getElementById('latitudine').value = lat;
        document.getElementById('longitudine').value = lon;
        

        fetch(`/reverse_geocode?lat=${lat}&lon=${lon}`)
            .then(response => response.json())
            .then(data => {
            if (data.address) {
                document.getElementById('indirizzo').value = data.address; 
            } else {
                alert("Indirizzo non trovato");
            }
            })
            .catch(error => console.error('Errore nel geocoding:', error));
        });
    } else {
        alert("Geolocalizzazione non supportata dal browser.");
    }
});

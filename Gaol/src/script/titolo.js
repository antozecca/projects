window.onload = function() {
    var canvas = document.querySelector('.game-canvas');
    var ctx = canvas.getContext('2d');
    
    document.querySelector('.game-container')

    var titleImage = new Image();
    titleImage.src = '/immagini/logo.png';

    var backgroundImage = new Image();
    backgroundImage.src = '/immagini/sfondo.png';

    backgroundImage.onload = function() {
        drawBackground();
    };

    function drawBackground() {
        ctx.drawImage(backgroundImage, 0, 0, canvas.width, canvas.height);
        var logoHeight = 400;
        var logoWidth = titleImage.width * (logoHeight / titleImage.height);
        var logoX = canvas.width / 2 - logoWidth / 2;
        var logoY = 40;
        ctx.drawImage(titleImage, logoX, logoY, logoWidth, logoHeight);
    }

    document.querySelector("#show-login").addEventListener("click",function(){
        document.querySelector(".popup").classList.add("active");
    });
    document.querySelector(".popup .close-btn").addEventListener("click",function(){
        document.querySelector(".popup").classList.remove("active");
    });
}
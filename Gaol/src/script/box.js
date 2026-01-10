const classBoxes = document.querySelectorAll('.class-box');

classBoxes.forEach(box => {
    box.addEventListener('mouseenter', () => {
        box.querySelector('img').style.transform = 'scale(1.1)';
        box.querySelector('.class-name').style.opacity = '1';
    });

    box.addEventListener('mouseleave', () => {
        box.querySelector('img').style.transform = 'scale(1)';
        box.querySelector('.class-name').style.opacity = '0';
    });
});
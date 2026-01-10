document.addEventListener('DOMContentLoaded', function() {
    var classBoxes = document.querySelectorAll('.class-box');

    classBoxes.forEach(function(box) {
        box.addEventListener('click', function() {
            var classId = this.id;

            window.location.href = classId + '.php';
        });
    });
});
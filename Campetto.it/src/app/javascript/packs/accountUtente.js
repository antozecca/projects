document.addEventListener('DOMContentLoaded', function() {
    const changePasswordLink = document.getElementById('changePassw');
    const formChangePassword = document.getElementById('form__changepassword');
    const closeButton = document.querySelector('.close-btn');
    const blurBackground = document.getElementById('blur-background');

    function openForm() {
      formChangePassword.style.display = 'block';
      blurBackground.style.display = 'block';
    }
    
    function closeForm() {
      formChangePassword.style.display = 'none';
      blurBackground.style.display = 'none'; 
    }
  
    changePasswordLink.addEventListener('click', function(event) {
      event.preventDefault();
      openForm();
    });

    blurBackground.addEventListener('click', closeForm);
    closeButton.addEventListener('click', closeForm);

    document.getElementById("changePasswordForm").onsubmit = function() {
        return validatePassw();
    };

    document.getElementById("signup_password").addEventListener("input", checkPassword);

});

  
function validatePassw() {
    console.log("Validazione in corso...");
    var password = document.getElementById("signup_password").value;
    var confpassword = document.getElementById("conferma_password").value;
    var passwordRegex = /^(?=.*\d)(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/; 

    
    if (!passwordRegex.test(password)) {
        alert("La password deve essere lunga almeno 8 caratteri, contenere almeno una maiuscola, un numero e un carattere speciale.");
        return false; 
    }

    
    if (password !== confpassword) {
        alert("Le nuove password non corrispondono.");
        return false;
    }

    return true;
}

function checkPassword() {
    var password = document.getElementById("signup_password").value;
    var lunghezza = document.getElementById("lunghezza");
    var maiuscole = document.getElementById("maiuscole");
    var numeri = document.getElementById("numeri");
    var speciale = document.getElementById("speciale");


    if (password.length >= 8) {
        lunghezza.classList.add("checked");
    } else {
        lunghezza.classList.remove("checked");
    }

    if (/[A-Z]/.test(password)) {
        maiuscole.classList.add("checked");
    } else {
        maiuscole.classList.remove("checked");
    }

    if (/\d/.test(password)) {
        numeri.classList.add("checked");
    } else {
        numeri.classList.remove("checked");
    }

    if (/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
        speciale.classList.add("checked");
    } else {
        speciale.classList.remove("checked");
    }
}
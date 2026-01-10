document.addEventListener("DOMContentLoaded", () => {
    // Funzioni per mostrare/nascondere la password
    document.getElementById("occhioLogin").onclick = function() {
        mostraPasswordLogin();
    };
    document.getElementById("occhioReg").onclick = function() {
        mostraPassword();
    };
    document.getElementById("occhioConf").onclick = function() {
        mostraPasswordConf();
    };

    document.getElementById("id_form_signup").onsubmit = function() {
        return validateReg();
    };
    document.getElementById("signup_password").addEventListener("input", checkPassword);
});


/*-----------Collegamenti form------------------*/
function getParameterByName(name) {
    let url = window.location.href;
    name = name.replace(/[\[\]]/g, '\\$&');
    let regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)');
    let results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

window.onload = function() {
    let formType = getParameterByName('form');

    let formLogin = document.getElementById("form__login");
    let formSignup = document.getElementById("form__reg");

    if (formType === 'login') {
        formLogin.style.display = 'block';
        formSignup.style.display = 'none';
    } else if (formType === 'signup') {
        formLogin.style.display = 'none';
        formSignup.style.display = 'block';
    } else {
        // Mostra il form di login di default se non ci sono parametri
        formLogin.style.display = 'block';
        formSignup.style.display = 'none';
    }
};


const popupForm = document.getElementById("form__login");
const popupFormReg = document.getElementById("form__reg");

const loginToReg = document.getElementById("toSignup");

loginToReg.addEventListener("click",() =>{
    popupForm.style.display = "none";
    popupFormReg.style.display = "block";
});

const regToLogin = document.getElementById("toLogin");

regToLogin.addEventListener("click",() =>{
    popupForm.style.display = "block";
    popupFormReg.style.display = "none";
});

const loginToForgot = document.getElementById("toForgotPass");
const popupFormForgot = document.getElementById("form__password");


loginToForgot.addEventListener("click",() =>{
    popupForm.style.display = "none";
    popupFormForgot.style.display = "block";
});

/*-------------Mostra/Nascondi Password dei Form-----------------*/
function mostraPassword() {
    var passwordInput = document.getElementById("signup_password");
    var eyeIcon = document.getElementById("occhioReg");
    
    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        eyeIcon.classList.remove("fa-eye");
        eyeIcon.classList.add("fa-eye-slash");
    } else {
        passwordInput.type = "password";
        eyeIcon.classList.remove("fa-eye-slash");
        eyeIcon.classList.add("fa-eye");
    }
}

function mostraPasswordLogin() {
    var passwordInput = document.getElementById("password_login");
    var eyeIcon = document.getElementById("occhioLogin");
    
    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        eyeIcon.classList.remove("fa-eye");
        eyeIcon.classList.add("fa-eye-slash");
    } else {
        passwordInput.type = "password";
        eyeIcon.classList.remove("fa-eye-slash");
        eyeIcon.classList.add("fa-eye");
    }
}

function mostraPasswordConf() {
    var passwordInput = document.getElementById("conferma_password");
    var eyeIcon = document.getElementById("occhioConf");
    
    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        eyeIcon.classList.remove("fa-eye");
        eyeIcon.classList.add("fa-eye-slash");
    } else {
        passwordInput.type = "password";
        eyeIcon.classList.remove("fa-eye-slash");
        eyeIcon.classList.add("fa-eye");
    }
}

/*-----------Vaidazione Registrazione e controllo Password*/
function validateReg() {
    console.log("Validazione in corso...");
    var password = document.getElementById("signup_password").value;
    var confpassword = document.getElementById("conferma_password").value;
    var checkbox = document.getElementById("policy");
    var passwordRegex = /^(?=.*\d)(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/; 

    
    if (!passwordRegex.test(password)) {
        alert("La password deve essere lunga almeno 8 caratteri, contenere almeno una maiuscola, un numero e un carattere speciale.");
        return false; 
    }

    
    if (password !== confpassword) {
        alert("Le password non corrispondono.");
        return false;
    }

    if (!checkbox.checked) {
        alert("Devi accettare i termini e condizioni.");
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

/*--------------------Form Cambio Password--------------------------*/
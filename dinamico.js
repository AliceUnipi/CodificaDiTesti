//Mappatura immagine
const area = document.querySelectorAll("area");
const b = document.querySelectorAll(".numero");

area.forEach( riga => {
    riga.addEventListener("click", () => {
        const verifica = `#${riga.attributes[2].value}`;
        b.forEach( numero => {
            numero.style.backgroundColor = "inherit";
            numero.style.color = "inherit";

            if(numero.attributes[0].value === verifica){
                numero.style.backgroundColor = "#357e7e";
                numero.style.radius = "10px";
                numero.style.color = "#fff";
            }
        })
    })
})

//Scroll top fonte: w3schools.com
// Prendi il bottone dal codice:
let mybutton = document.getElementById("myBtn");

// Appena si scrolla di 20px compare il bottone
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// Click del bottone 
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

//Bottoni per evidenziare i termini

//per selezionare i nodi html query selctor con class creata in xsl

//Correzioni
const correzione = document.querySelector("#correzione");
const orig = document.querySelectorAll(".orig");
const reg = document.querySelectorAll(".reg");

//Glottonimi
const glottonimo = document.querySelector("#glottonimo");
const lang = document.querySelectorAll(".lang");

//Cancellazioni
const cancellazione = document.querySelector("#cancellazione");
const del = document.querySelectorAll(".del");
const gap = document.querySelectorAll(".gap");

//Aggiunte
const aggiunta = document.querySelector("#aggiunta");
const add = document.querySelectorAll(".add");

//Toponimi
const toponimo = document.querySelector("#toponimo");
//name che sarebbe il tag di toponimo non è utilizzabile perché è una costante
const toponimi = document.querySelectorAll(".toponimo");

//Terminologia
const termini = document.querySelector("#termini");
const terms = document.querySelectorAll(".terms");

//Abbreviazioni
const abbreviazione = document.querySelector("#abbreviazione");
const abbr = document.querySelectorAll(".abbr");
const expan = document.querySelectorAll(".expan");

correzione.addEventListener("click", () => {
    orig.forEach(scelta => scelta.classList.toggle("none"));
    reg.forEach(estensione => estensione.classList.toggle("inline_block"));
})

glottonimo.addEventListener("click", () => {
    lang.forEach(ln => ln.classList.toggle("green"));
})

cancellazione.addEventListener("click", () => {
    del.forEach(cancella => cancella.classList.toggle("line_through"));
    gap.forEach(vuota => vuota.classList.toggle("none"));
})

aggiunta.addEventListener("click", () => {
    add.forEach(suppl => suppl.classList.toggle("inline_block"));
})

toponimo.addEventListener("click", () => {
    toponimi.forEach(nomi => nomi.classList.toggle("light_coral"));
})

termini.addEventListener("click", () => {
    terms.forEach(termine => termine.classList.toggle("yellow"));
})

abbreviazione.addEventListener("click", () => {
    abbr.forEach(abbreviaz => abbreviaz.classList.toggle("none"));
    expan.forEach(expans => expans.classList.toggle("inline_block"));
})
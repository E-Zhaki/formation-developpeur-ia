// Jeu de billes — correction du formateur (consigne : enonce.pdf)

const qs = (elem) => document.querySelector(elem);
const qa = (elem) => document.querySelectorAll(elem);

// function qs(elem) {
//   return document.querySelector(elem);
// }

const form = qs("form");

const jeu = qs("#jeu");

let joueurs = [];
let joueurActif = 0;
let nombreBille;
let nombreBilleInitial;
let coup = 0;

let btns = qa("#btn button"); // [b1, b2, b3]

form.addEventListener("submit", (e) => {
  e.preventDefault();

  let joueur1 = qs("#joueur1").value;
  let joueur2 = qs("#joueur2").value;
  nombreBille = Number(qs("#nbBille").value);
  nombreBilleInitial = nombreBille;

  joueurs.push(
    { prenom: joueur1, coup: [], somme: 0 },
    { prenom: joueur2, coup: [], somme: 0 },
  );

  form.classList.add("d-none");
  jeu.classList.remove("d-none");

  startGame();
});

btns.forEach((btn) => {
  btn.addEventListener("click", (e) => {
    coup = e.target.textContent; // btn.textContent
    nombreBille -= coup;

    btn.setAttribute("disabled", true);

    btns.forEach((btnActif) => {
      if (btnActif.textContent !== coup) {
        btnActif.removeAttribute("disabled");
      }

      if (btnActif.textContent > nombreBille) {
        btnActif.setAttribute("disabled", true);
      }
    });

    progression();
    history();
    verifJeu();
    startGame();
  });
});

function progression() {
  let barre = qs(".progression");

  barre.style.width = (nombreBille / nombreBilleInitial) * 100 + "%";
}

function history() {
  joueurs[joueurActif].coup.push(coup);
  joueurs[joueurActif].somme += Number(coup);
}

function verifJeu() {
  if (nombreBille == 0 || (coup == 1 && nombreBille == 1)) {
    jeu.classList.add("d-none");

    qs("#fin").classList.remove("d-none");
    qs("#gagnant").textContent = joueurs[joueurActif].prenom;

    qs("#j1").innerHTML = `<h4>${joueurs[0].prenom}</h4>
							<div>Coups :${joueurs[0].coup.join(",")} </div>
							<div>Total :${joueurs[0].somme} </div>
							`;

    qs("#j2").innerHTML = `<h4>${joueurs[1].prenom}</h4>
							<div>Coups :${joueurs[1].coup.join(",")} </div>
							<div>Total :${joueurs[1].somme} </div>
							`;

    return;
  }

  joueurActif = joueurActif == 1 ? 0 : 1; // (joueurActif + 1) % joueurs.length;
}

function startGame() {
  qs("#bille").textContent = "";

  for (let i = 0; i < nombreBille; i++) {
    qs("#bille").textContent += "🥎";
  }

  qs("#reste").textContent = `Billes restantes : ${nombreBille}`;
  qs("#precedent").textContent = `Coup précédent : ${coup}`;
  qs("#joueurActif").textContent = joueurs[joueurActif].prenom;
}

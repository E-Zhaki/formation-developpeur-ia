// Code transmis par le formateur : version DOM, avec la colonne Total à compléter.
let courses = [
    { libelle: "Riz", prix: 50, stock: 10 },
    { libelle: "Pain", prix: 1, stock: 10 }
];

let liste = document.getElementById("liste");

function afficher() {
    liste.innerHTML = "";

    if (courses.length) {
        courses.forEach((prod) => {
            let tr = document.createElement("tr");
            let colLib = document.createElement("td");
            let colPrix = document.createElement("td");
            let colStoc = document.createElement("td");

            colLib.textContent = prod.libelle;
            colPrix.textContent = prod.prix;
            colStoc.textContent = prod.stock;

            tr.append(colLib, colPrix, colStoc);
            liste.append(tr);
        });
    } else {
        // Une ligne et une cellule gardent une structure HTML valide dans tbody.
        let tr = document.createElement("tr");
        let td = document.createElement("td");
        td.colSpan = 4;
        td.textContent = "Panier Vide !!";
        tr.append(td);
        liste.append(tr);
    }
    console.log("\n\n");
}

function ajouter(libelle, prix, stock) {
    if (prodPosition(libelle) == -1) {
        courses.push({ libelle, prix, stock });
        afficher();
    } else {
        console.log("Ce produit est déjà dans le panier !");
    }
}

function supprimer(libelle) {
    let pos = prodPosition(libelle);
    if (pos !== -1) {
        courses.splice(pos, 1);
        afficher();
    } else {
        console.log("Produit introuvable !");
    }
}

function prodPosition(prod) {
    return courses.findIndex(
        (produit) => produit.libelle.toLowerCase() === prod.toLowerCase()
    );
}

function vider() {
    courses = [];
    // Comme dans le cours, appeler afficher() ensuite pour actualiser la page.
}

afficher();
ajouter("Choco", 25, 30);
supprimer("pain");
// vider();
// afficher();

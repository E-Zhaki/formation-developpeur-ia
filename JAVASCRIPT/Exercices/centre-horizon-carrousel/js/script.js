"use strict";

// Données : tableau d'objets décrivant les photos (au moins 6), avec src, titre et alt.

// R1 : au chargement, afficher la première photo, son titre, son alt et le compteur « 1 / N ».
// R2 : le lien toolbar-toggle affiche ou masque les boutons (preventDefault, classList, aria-expanded).
// R3 : suivant, avec retour à la première après la dernière.
// R4 : précédent, avec passage à la dernière avant la première.
// R5 : photo au hasard, jamais celle déjà affichée (Math.random).
// R6 : lecture automatique toutes les 3 secondes, bouton pause/lecture (setInterval, clearInterval).
// R7 : flèches gauche et droite du clavier (keydown, e.key).
// R8 : chaque action de l'utilisateur relance le délai de la lecture automatique.
// R9 : le titre et le texte alternatif changent avec la photo.

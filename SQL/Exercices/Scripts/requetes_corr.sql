-- TP : requêtes SQL sur la base Films

-- 1. Sélections simples
-- 1.1  Tous les titres de films.


-- 1.2  Nom et prénom des internautes normands.
SELECT prenom, nom, region FROM internaute WHERE region like "%normandie%";

-- 1.3  Titre et année de tous les drames, triés par année ascendante. Donnez ensuite le tri par année descendante.
SELECT titre, annee FROM film where genre = "drame" ORDER BY annee ASC;

-- 1.4  Nom et année de naissance des artistes nés avant 1950.


-- 1.5  Titre et année de tous les films parus entre 1960 et 1980.


-- 1.6  Tous les genres de films (éliminez les doublons).


-- 1.7  Titre, genre et résumé des films qui sont soit des drames, soit des westerns (utilisez la construction IN), et dont le résumé contient la chaîne de caractères « vie ».
SELECT titre, genre, resume FROM film where genre IN ("drame", "western") AND resume like "%vie%";

-- 1.8  Les artistes dont le nom commence par « H » (commande LIKE).


-- 1.9  Quels sont les artistes dont on ignore l'année de naissance ? (Attention : cela signifie que la valeur est absente.)
SELECT prenom, annee_naissance FROM artiste where annee_naissance IS NULL;

-- 1.10  Prénom, nom et âge de chaque artiste (l'âge est la différence entre l'année courante et l'année de naissance). Nommez âge la colonne obtenue (commande AS).
SELECT prenom, nom, YEAR(CURRENT_DATE) - annee_naissance as "âge" FROM artiste;


-- 2. Jointures
-- 2.1  Qui a joué le rôle de Morpheus (nom et prénom) ?
SELECT DISTINCT prenom, nom, nom_role 
FROM artiste
INNER JOIN `role`
ON id = id_acteur
AND nom_role = "morpheus";

-- 2.2  Qui est le réalisateur de Alien ?
SELECT prenom, nom, titre 
FROM artiste
INNER JOIN film
ON id = id_realisateur
AND titre = "alien";

-- 2.3  Prénom et nom des internautes qui ont donné une note de 4 à un film (donner aussi le titre du film).
SELECT prenom, nom, titre, note
FROM internaute as i
INNER JOIN notation as n
ON i.email = n.email
AND note = 4;

-- 2.4  Quels acteurs ont joué quel rôle dans le film Vertigo ?
SELECT prenom, nom, nom_role, titre
FROM artiste
INNER JOIN role 
ON id_acteur = id
AND titre = "vertigo";

-- 2.5  Films dont le réalisateur est Tim Burton et dont un des acteurs est Johnny Depp.
SELECT Tim.prenom "prenom Tim", Tim.nom "nom Tim", act.prenom, act.nom, film.titre 
FROM film 
INNER JOIN artiste AS Tim
ON Tim.id = id_realisateur
INNER JOIN role
ON film.titre = role.titre
INNER JOIN artiste AS act
ON act.id = id_acteur
AND Tim.prenom = "Tim"
AND Tim.nom = "burton"
AND act.prenom = "johnny"
AND act.nom = "depp";

-- 2.6  Titre des films dans lesquels a joué Bruce Willis. Donner aussi le nom du rôle.
SELECT prenom, nom, titre, nom_role
FROM artiste
INNER JOIN role 
ON id = id_acteur
AND nom = 'willis'
AND prenom = "bruce";

-- 2.7  Quel metteur en scène a tourné dans ses propres films ? Donner le nom, le rôle et le titre des films.
SELECT nom, prenom, nom_role, film.titre, id_acteur, id_realisateur
FROM artiste 
INNER JOIN film 
ON id = id_realisateur
INNER JOIN role
ON id = id_acteur
AND id_acteur = id_realisateur;

-- 2.8  Quel metteur en scène a tourné en tant qu'acteur, mais pas dans son propre film ? Donner le nom, le rôle et le titre des films où le metteur en scène a joué.
SELECT nom, prenom, nom_role, film.titre
FROM artiste 
INNER JOIN film 
ON id = film.id_realisateur
INNER JOIN role
ON id = id_acteur
INNER JOIN film act
ON act.titre = role.titre
AND id != act.id_realisateur;

-- 2.9  Dans quels films le metteur en scène a-t-il le même prénom que l'un des interprètes ? (titre, nom du metteur en scène, nom de l'interprète). Le metteur en scène et l'interprète ne doivent pas être la même personne.
SELECT realisateur.prenom, realisateur.nom, act.prenom, act.nom, film.titre
FROM artiste AS realisateur
INNER JOIN film
ON realisateur.id = id_realisateur
INNER JOIN role
ON film.titre = role.titre
INNER JOIN artiste AS act
ON act.id = id_acteur
AND realisateur.prenom = act.prenom
AND realisateur.id != act.id;


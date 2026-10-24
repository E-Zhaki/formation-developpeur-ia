CREATE TABLE livre (
    id_livre INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(50) NOT NULL,
    annee_pub INT
);

CREATE TABLE auteur (
    id_auteur INT PRIMARY KEY AUTO_INCREMENT,
    nom_auteur VARCHAR(30),
    prenom_auteur VARCHAR(30)
);

CREATE TABLE adherent (
    id_adherent INT PRIMARY KEY AUTO_INCREMENT,
    nom_adh VARCHAR(30),
    prenom_adh VARCHAR(30)
);

CREATE TABLE emprunt (
    id_emprunt INT PRIMARY KEY AUTO_INCREMENT,
    date_emprunt DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_retour DATETIME,
    date_retour_eff DATETIME,
    id_adherent INT,
    id_livre INT,
    FOREIGN KEY (id_adherent) REFERENCES adherent(id_adherent),
    FOREIGN KEY (id_livre) REFERENCES livre(id_livre)
);

CREATE TABLE rediger (
    id_auteur INT,
    id_livre INT,
    PRIMARY KEY (id_auteur, id_livre),
    FOREIGN KEY (id_auteur) REFERENCES auteur(id_auteur),
    FOREIGN KEY (id_livre) REFERENCES livre(id_livre)
);
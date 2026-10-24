-- Base des exercices : centre de formation (MySQL / MariaDB)
DROP DATABASE IF EXISTS centre;
CREATE DATABASE centre CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE centre;

CREATE TABLE formation (
  id_formation INT PRIMARY KEY AUTO_INCREMENT,
  code VARCHAR(10) NOT NULL UNIQUE,
  intitule VARCHAR(100) NOT NULL,
  duree INT NOT NULL,
  niveau VARCHAR(20) NOT NULL
);
CREATE TABLE formateur (
  id_formateur INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE apprenant (
  id_apprenant INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE session (
  id_session INT PRIMARY KEY AUTO_INCREMENT,
  date_debut DATE NOT NULL,
  date_fin DATE NOT NULL,
  id_formation INT NOT NULL,
  id_formateur INT NOT NULL,
  FOREIGN KEY (id_formation) REFERENCES formation(id_formation),
  FOREIGN KEY (id_formateur) REFERENCES formateur(id_formateur)
);
CREATE TABLE inscription (
  id_apprenant INT NOT NULL,
  id_session INT NOT NULL,
  date_inscription DATE NOT NULL,
  PRIMARY KEY (id_apprenant, id_session),
  FOREIGN KEY (id_apprenant) REFERENCES apprenant(id_apprenant),
  FOREIGN KEY (id_session) REFERENCES session(id_session)
);

INSERT INTO formation (code, intitule, duree, niveau) VALUES
 ('PY-INI','Python initiation',35,'Débutant'),
 ('SQL-BAS','SQL et bases de données',21,'Débutant'),
 ('ML-INT','Machine learning',42,'Intermédiaire'),
 ('DL-AVA','Deep learning',56,'Avancé'),
 ('API-WEB','API web avec Flask',28,'Intermédiaire');
INSERT INTO formateur (nom, prenom, email) VALUES
 ('Diallo','Aminata','a.diallo@centre.fr'),('Martin','Paul','p.martin@centre.fr'),
 ('Nguyen','Linh','l.nguyen@centre.fr'),('Bernard','Sophie','s.bernard@centre.fr');
INSERT INTO apprenant (nom, prenom, email) VALUES
 ('Moreau','Lucas','lucas.moreau@mail.fr'),('Mbaye','Awa','awa.mbaye@mail.fr'),
 ('Dupont','Camille','camille.dupont@mail.fr'),('Martin','Léa','lea.martin@mail.fr'),
 ('Diop','Moussa','moussa.diop@mail.fr'),('Petit','Hugo','hugo.petit@mail.fr'),
 ('Leroy','Emma','emma.leroy@mail.fr'),('Morel','Noah','noah.morel@mail.fr');
INSERT INTO session (date_debut, date_fin, id_formation, id_formateur) VALUES
 ('2026-01-12','2026-01-23',1,1),('2026-02-02','2026-02-13',2,2),('2026-03-02','2026-03-20',3,3),
 ('2026-04-06','2026-04-17',1,4),('2026-05-04','2026-05-15',2,2),('2026-06-01','2026-06-12',5,1);
INSERT INTO inscription (id_apprenant, id_session, date_inscription) VALUES
 (1,1,'2025-12-10'),(2,1,'2025-12-15'),(3,1,'2026-01-05'),(5,1,'2025-12-20'),
 (1,2,'2026-01-10'),(4,2,'2026-01-14'),(5,2,'2026-01-20'),
 (2,3,'2026-02-01'),(4,3,'2026-02-03'),(5,3,'2026-02-10'),(7,3,'2026-02-15'),
 (6,4,'2026-03-01'),(7,4,'2026-03-05');
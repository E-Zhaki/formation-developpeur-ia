-- 1. Compter les apprenants.
SELECT COUNT(*) AS nb_apprenant FROM apprenant;

-- 2. Compter les inscrits de chaque session.
SELECT session.id_session, intitule, COUNT(id_apprenant) AS nb_inscrits
FROM session LEFT JOIN inscription
ON session.id_session = inscription.id_session
INNER JOIN formation
ON formation.id_formation = session.id_formation
GROUP BY id_session;

-- 3. Afficher les sessions qui ont plus de 3 inscrits.
SELECT session.id_session, intitule, COUNT(id_apprenant) AS nb_inscrits
FROM session LEFT JOIN inscription
ON session.id_session = inscription.id_session
INNER JOIN formation
ON formation.id_formation = session.id_formation
GROUP BY id_session
HAVING nb_inscrits > 3;

-- 4. Calculer la durée moyenne des formations par niveau.
SELECT niveau, AVG(duree) AS duree_moyenne
FROM formation
GROUP BY niveau;

-- 5. Calculer la durée en jours de chaque session.
SELECT id_session,intitule, date_debut, date_fin, DATEDIFF(date_fin, date_debut) AS duree_jours
FROM session
INNER JOIN formation
ON formation.id_formation = session.id_formation;

-- 6. Compter les inscriptions par mois (format AAAA-MM).
SELECT DATE_FORMAT(date_inscription, '%Y-%m') AS mois, COUNT(*) AS nb_inscriptions
FROM inscription
GROUP BY mois;
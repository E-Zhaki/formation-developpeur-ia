# Organisation et pratiques Git

Ces consignes reprennent les préférences de Zhaki pour ce projet.

## Dossiers

- Conserver un dépôt Git pour cette formation, avec un dossier par module. Éviter les dépôts Git imbriqués. Un projet indépendant peut avoir son propre dépôt.
- Dans chaque module, utiliser `Leçons/` pour les supports et `Exercices/` pour le code.
- Pour JavaScript, classer les petits exercices par chapitre (`variables/`, `operateurs/`, `conditions/`, puis les autres chapitres lorsqu'ils sont étudiés). Utiliser un fichier HTML par exercice et garder `Exercices/index.html` comme sommaire. Conserver les essais et les corrections du cours en indiquant les exercices encore incomplets.
- Garder ensemble les fichiers d'un même exercice. Éviter les doublons et les déplacements inutiles.
- Pour les fichiers d'exercices, garder une présentation minimale : la consigne et les résultats attendus en texte simple dans un seul `<p>`, puis le `<script>` pour travailler. Éviter les balises supplémentaires comme `<code>`, `<h1>`, `<h2>` et `<pre>`. Une consigne en commentaire dans le script convient aussi.
- Après un déplacement, vérifier que les fichiers sont conservés et mettre à jour les chemins et les liens du README.

## Branches et sauvegardes

- Avant une opération Git, vérifier le dépôt, le remote, la branche active et les modifications en attente.
- Choisir une branche dont le nom correspond au module ou à la tâche. Pour un nouveau sujet, créer une branche depuis une base adaptée. Ne pas réutiliser la branche d'un ancien exercice sans rapport.
- Partir normalement de `main` à jour pour un travail indépendant. Vérifier la base avant de créer la branche afin d'éviter d'y inclure des travaux sans rapport encore non fusionnés. Si le travail dépend d'une autre branche, expliquer cette dépendance.
- Utiliser des noms explicites, par exemple `feat/js-remises`, `fix/js-conversion` ou `docs/organisation`. Garder une branche pour un ensemble de changements cohérent.
- La branche `javascript` a été fusionnée dans `main` par la pull request #10 le 28 octobre 2026. Pour un nouveau travail indépendant, repartir de `main` à jour avec une branche adaptée au sujet plutôt que recycler une branche déjà fusionnée. Conserver les modifications locales en cours avant toute transition.
- Garder `main` comme référence stable et travailler habituellement sur une branche dédiée.
- La branche locale `integration/js-cours` réunit les chapitres et les guides pour garder tous les fichiers accessibles pendant les fusions. Les sauvegardes et les pull requests restent séparées par objectif sur leurs branches dédiées ; commencer les nouveaux sujets indépendants depuis `main` à jour.
- Faire des commits cohérents avec des messages clairs. Examiner les fichiers avant de les ajouter ; conserver les documents personnels exclus du dépôt.
- Limiter chaque commit à un objectif et privilégier les messages `type(portée): action précise`, par exemple `feat(js): ajouter le calcul des remises`, `fix(js): convertir la saisie en nombre` et `docs: décrire l'organisation du projet`. Ne pas regrouper deux sujets indépendants dans une même sauvegarde par commodité.
- Lorsqu'une sauvegarde sur GitHub est demandée, effectuer le commit et le push des changements concernés, puis vérifier leur synchronisation.
- Distinguer explicitement l'envoi sur une branche de sa fusion dans `main`. Indiquer la branche sauvegardée et fournir le lien correspondant.
- Pour intégrer un travail dans `main`, examiner les différences et privilégier une pull request. Signaler clairement si la fusion reste à faire.

## Suivi du projet et vérification

- Découper le travail en petites tâches avec un résultat attendu clair. Pour les projets qui le justifient, utiliser les issues et un suivi simple : à faire, en cours, terminé.
- Garder le README fidèle à l'état réel du projet : organisation, accès aux exercices et instructions utiles.
- Avant un commit, examiner le diff et effectuer les vérifications adaptées au changement. Ne pas annoncer de vérifications qui n'ont pas été effectuées.
- Préparer des pull requests centrées sur un objectif, avec une description du changement et de sa validation. Vérifier aussi l'ensemble des différences avec la branche cible.
- Après un push ou une fusion, vérifier le résultat sur la branche concernée et signaler les changements locaux qui restent en attente. Ne pas réécrire l'historique partagé ni supprimer des branches sans nécessité liée à la demande.
- Adapter ces pratiques à la taille de l'exercice et expliquer les opérations à Zhaki avec des mots simples.

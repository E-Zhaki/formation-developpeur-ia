# Git et GitHub : méthode de travail et bilan

Audit effectué le 28 octobre 2026 sur les 19 dépôts publics du compte [E-Zhaki](https://github.com/E-Zhaki?tab=repositories). L'examen détaillé porte surtout sur la formation actuelle, Miftah Arabi, le blog Symfony et les anciens exercices Git. Les réglages privés du compte et le fonctionnement des applications ne font pas partie de cet audit.

## Comprendre les éléments

| Élément | Son rôle |
| --- | --- |
| Dépôt, ou repository | Contient un projet et son historique. La formation peut rester dans un dépôt avec plusieurs modules. |
| Branche | Permet de travailler sur un objectif. Elle peut contenir plusieurs commits. |
| Commit | Enregistre une étape cohérente dans l'historique local. |
| Push | Envoie les commits sur GitHub. |
| Pull request, ou PR | Présente les différences d'une branche pour préparer leur intégration dans une autre. |
| Merge, ou fusion | Intègre ces changements dans la branche cible, habituellement `main`. |

Les dossiers organisent les fichiers. Les branches organisent les travaux en cours : changer de module peut justifier une nouvelle branche, mais une branche représente l'état du dépôt entier.

## Ce que vous faisiez dans l'ancienne formation

Dans [git-tp](https://github.com/E-Zhaki/git-tp/pulls?q=is%3Apr+is%3Amerged), les branches `feat/my-feature-name` et `feat/my-second-feature` ont chacune donné lieu à une pull request fusionnée.

Dans [Miftah Arabi](https://github.com/E-Zhaki/projet-miftah-arabi/branches), vous utilisiez notamment :

```text
sprint2-ticketA-feat/registration-system
```

- `sprint2` : la période de travail.
- `ticketA` : une tâche identifiée dans cette période.
- `feat` : une fonctionnalité.
- `registration-system` : le sujet, ici l'inscription.

Miftah Arabi compte 28 pull requests fusionnées et [le blog Symfony](https://github.com/E-Zhaki/dwwm22-symfony-blog/pulls?q=is%3Apr+is%3Amerged) en compte 24 au moment de l'audit. Vous utilisiez donc déjà un suivi par tâches, des branches et des fusions.

Une branche accueille les commits nécessaires à la tâche. Il n'est pas nécessaire de créer une branche pour chaque commit.

## État constaté lors de l'audit initial

La [pull request #10](https://github.com/E-Zhaki/formation-developpeur-ia/pull/10) a été fusionnée le 28 octobre 2026. Le [dossier JAVASCRIPT est désormais dans `main`](https://github.com/E-Zhaki/formation-developpeur-ia/tree/main/JAVASCRIPT), avec `Leçons/` et `Exercices/`.

Les 10 pull requests du dépôt sont fusionnées. Les six branches de travail encore présentes sur GitHub sont intégrées dans `origin/main` d'après la vérification de leur historique. La copie locale de `main` est toutefois en retard de huit commits sur GitHub au moment de l'audit.

Le contenu des commits sauvegardés sur `javascript` correspond à celui de `origin/main`. Le fichier JavaScript de travail contient en plus des modifications locales non commitées. Le fichier de consignes `AGENTS.md` est également encore local.

### Sauvegarde après l'audit

La réorganisation par chapitre a ensuite été fusionnée dans `main` par la [pull request #11](https://github.com/E-Zhaki/formation-developpeur-ia/pull/11). La copie locale de `main` a été actualisée avant de préparer les sauvegardes suivantes, chacune depuis cette base :

- `feat/js-date-valide` : correction des années bissextiles et exercice de validation des dates, avec des commits distincts.
- `feat/js-boucles` : préparation du fichier pour les exemples du nouveau chapitre.
- `docs/git-workflow` : consignes du projet et présent guide.

La branche locale `integration/js-cours` réunit ces travaux pour garder tous les fichiers visibles pendant le cours. Les pull requests se préparent depuis les trois branches dédiées vers `main`. Leur envoi sur GitHub et leur fusion dans `main` sont deux étapes distinctes.

### Ce qui est déjà bien

- Un dépôt regroupe la formation ; les modules ont des dossiers distincts.
- La structure `Leçons/` et `Exercices/` est cohérente.
- Le README donne accès aux exercices.
- Les documents personnels du dossier `Docs/` sont exclus du dépôt.
- Les pull requests et les fusions sont déjà utilisées.

### Les corrections à prévoir

1. **Créer les branches depuis la bonne base.** La branche `javascript` a initialement repris les changements HTML, Bootstrap et SQL de `exercice-tab-form`. La fusion est maintenant faite : les nouveaux travaux peuvent repartir de `main` actualisé. Changer le nom d'une branche ne sépare pas ses anciens commits.

2. **Séparer les objectifs dans les commits.** Le commit `97df6af` regroupe le projet HTML de groupe et les exercices JavaScript. Pour les prochains changements, utiliser des commits distincts par objectif. Conserver l'historique déjà publié ; améliorer la méthode pour la suite.

3. **Regrouper les deux copies de Centre Horizon.** `HTML-CSS/Exercices/projet-groupe/` et `HTML-CSS/Exercices/TP-C13-groupe/` contiennent des copies identiques de `formation.html` et `formation.css`. Le premier contient les images et les maquettes ; le second contient aussi les pages d'accueil et d'inscription. Préparer un dossier final unique en réunissant les ressources utiles, puis vérifier les liens avant de retirer les doublons.

4. **Réparer les liens du site regroupé.** Dans `projet-groupe`, les liens vers `index.html` et `inscription.html` ne trouvent pas ces pages. Dans `TP-C13-groupe`, l'accueil référence trois fichiers SVG absents de son dossier `images`, et le lien `Accueil` de la page d'inscription n'est pas un chemin de fichier valide.

5. **Nettoyer les branches terminées.** Vérifier la fusion de chaque branche avant son nettoyage. Une branche terminée peut être retirée ; les commits et les pull requests fusionnées restent dans l'historique. Ne pas supprimer toutes les anciennes branches sans cette vérification.

6. **Compléter la présentation des projets.** Plusieurs dépôts n'ont pas de description. Le README de `portfolio` ne contient que deux lignes. Pour les projets à présenter, ajouter l'objectif, les fonctionnalités, les technologies, les étapes de lancement et, si disponibles, une capture et un lien vers la démonstration. Préciser dans les README quels projets sont des exercices refaits volontairement.

7. **Examiner la protection de `main`.** L'API indique `main` comme non protégée dans les quatre dépôts examinés pour ce réglage. Une protection adaptée peut imposer le passage par une PR et empêcher les réécritures accidentelles. Adapter les exigences de revue au travail en solo ou en équipe.

## Une méthode simple pour les prochains travaux

```text
Tâche → branche → modifications → vérification → commits → push → PR → fusion
```

1. Définir un petit objectif vérifiable. Une issue est utile pour un projet suivi ; une courte liste suffit pour un exercice simple.
2. Vérifier `git status`, le dépôt et la branche active. Conserver le travail local en cours dans des commits adaptés avant de changer de base.
3. Actualiser `main`, puis créer la branche du nouvel objectif depuis cette base.
4. Écrire et vérifier le code. Examiner le diff pour sélectionner les fichiers concernés.
5. Faire un ou plusieurs commits, chacun avec un objectif clair.
6. Envoyer la branche sur GitHub.
7. Ouvrir une PR qui explique le résultat, les changements et leur validation. Examiner les différences avec `main`.
8. Fusionner lorsque le travail est prêt, actualiser le `main` local, puis nettoyer la branche terminée après vérification.

Pour cette formation, `main` et des branches de travail par sujet suffisent. Les noms de sprint et de ticket restent utiles lorsqu'un projet est réellement organisé ainsi.

## Exemples de noms

| Travail | Branche possible | Commit possible |
| --- | --- | --- |
| Ajouter un exercice sur les conditions | `feat/js-conditions` | `feat(js): ajouter l'exercice sur les conditions` |
| Corriger une conversion de saisie | `fix/js-conversion` | `fix(js): convertir la saisie en nombre` |
| Regrouper Centre Horizon | `refactor/centre-horizon` | `refactor(html-css): regrouper les fichiers Centre Horizon` |
| Documenter la méthode Git | `docs/git-workflow` | `docs(git): expliquer le cycle de travail GitHub` |

La convention des messages aide à comprendre l'historique. Le point essentiel reste d'indiquer précisément ce que change le commit et de garder un objectif cohérent.

## Priorités pour la prochaine mise au propre

1. Conserver séparément le travail JavaScript en cours et la documentation Git.
2. Actualiser la base locale avec le `main` désormais fusionné, puis commencer le prochain sujet sur une branche adaptée.
3. Regrouper Centre Horizon dans un dossier unique, réparer les chemins et vérifier les trois pages avant la fusion.
4. Nettoyer les branches confirmées comme terminées et compléter progressivement les README des projets importants.

## Références

- [GitHub flow : branches, commits, pull requests et fusion](https://docs.github.com/en/get-started/using-github/github-flow).
- [Conventional Commits : une convention possible pour les messages](https://www.conventionalcommits.org/en/v1.0.0/).
- [Protection des branches sur GitHub](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches).

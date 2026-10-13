# Pipeline assets → vidéo LTX

Ce pipeline impose une bible visuelle avant toute génération vidéo. La CLI LTX-2.5 installée expose les pipelines vidéo et l'image comme conditionnement ; elle n'expose pas de commande autonome de génération d'images. Cette limite doit être vérifiée avant de présenter une fiche d'assets comme générée par LTX. Une image générée par un autre outil reste une référence externe et ne passe pas automatiquement la gate LTX.

## Garde de passage

Une vidéo ne peut être lancée que lorsque le manifeste de l’épisode contient :

- une référence de style avec empreinte SHA-256 et provenance connue ;
- une fiche personnage avec face, trois-quarts, profil et dos ;
- les expressions et proportions à conserver ;
- les tenues séparées et leurs règles de combinaison ;
- les accessoires importants avec vues nécessaires ;
- le décor avec vues large, moyenne et rapprochée ;
- une matrice plans → assets → image de conditionnement LTX ;
- un contrôle humain `approved` pour chaque asset requis.

Un asset absent ou non approuvé bloque la génération du plan concerné. Les médias restent locaux et ignorés par Git.

## Phases

1. **Style lock** : enregistrer l’image source, son empreinte, le rendu 3D, la lumière, le fond, les proportions et les interdits.
2. **Asset bible** : produire les vues du personnage, les tenues, les accessoires et les décors. Chaque asset reçoit un identifiant stable. Si l'objectif est « LTX uniquement », bloquer ici tant qu'une commande image LTX officiellement disponible n'est pas identifiée.
3. **QA de cohérence** : comparer les vues entre elles ; refuser les dérives de visage, silhouette, palette, matière ou perspective.
4. **Shot list** : écrire le scénario éducatif, puis associer à chaque plan les assets approuvés, le mouvement et la référence LTX.
5. **Génération CLI** : lancer un plan court à la fois avec seed, résolution, nombre d’images, prompt et conditionnement consignés. Le contournement consistant à générer une vidéo de 9 images puis à extraire une image fixe n'est pas équivalent à une génération d'asset et doit être marqué comme expérimental.
6. **Montage et validation** : contrôler continuité, compréhension enfant, audio, export et absence d’artefacts avant d’enchaîner les plans.

## Premier épisode de test

Référence fournie : `wallpaper.jpg`, style cartoon 3D, enfant stylisé, expression boudeuse, fond gris clair. Cette image fixe le style ; elle ne doit pas être traitée comme la fiche complète du personnage.

Sujet recommandé : **« Le raccourci qui fait perdre du temps »**. Un jeune personnage veut gagner du temps en prenant un raccourci mal indiqué, découvre calmement pourquoi le chemin sûr existe, puis explique la leçon à un ami. Aucun lieu réel, aucune marque et aucun texte généré dans l’image.

Le premier test vidéo doit rester minimal : un seul plan, 9 ou 17 images, 256×256 pour valider la chaîne CLI et l’empreinte visuelle. Il ne constitue pas encore un épisode publiable.

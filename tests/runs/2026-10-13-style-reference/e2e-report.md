# Rapport du premier cycle bout en bout

Date du cycle : 2026-10-14  
Projet : LTX Desktop 1.3.0 / LTX-2.5 local  
Référence : `references/style-reference.jpg`  
Modèle image : Z-Image-Turbo local  
Modèle vidéo : LTX-2.5 split local

## Ressources

Le préflight a été validé avant les générations : environ 132 Go libres sur D:, 30 Go de RAM libre et environ 23 Go de mémoire GPU libre. Les poids restent hors dépôt.

## Runs

### Run 1 — asset image

L'image-à-image conserve le visage et le style, mais la tenue reste grise. Rejet automatique selon le brief Atlas jaune.

### Run 2 — asset image puis tentative vidéo

La force d'édition augmentée produit une tenue jaune lisible, des yeux séparés et une anatomie cohérente. La première commande vidéo avec `nvfp4-cast` s'arrête avant le calcul, car l'extension locale `ltx-kernels` manque. Le paramètre est remplacé par `fp8-cast`.

### Run 3 — vidéo de contrôle

Le format portrait `256x448`, le conditionnement fort et le mouvement réduit donnent un plan stable de présentation. Le fichier MP4 est valide : 9 images, 12 fps, 0,75 seconde. Il ne réalise cependant pas l'arrivée depuis la droite.

### Run 4 — vidéo d'arrivée

Le format portrait et 17 images rendent le décor visible, mais des silhouettes fantômes apparaissent pendant l'entrée depuis la droite. Le fichier MP4 est valide : 17 images, 12 fps, 1,42 seconde. Le rendu est rejeté visuellement.

### Run 5 — arrivée seule avec ancrage sur la dernière image

La tentative a été arrêtée pendant le rechargement des poids du modèle, avant le débruitage, avec une erreur de stockage mémoire CUDA/Python. Aucun fichier vidéo valide n'a été produit. Le plafond de cinq runs est désormais atteint.

## Décision

Le pipeline CLI LTX fonctionne de bout en bout pour image-à-image et vidéo conditionnée. La gate de production reste bloquée : le plan fixe est exploitable comme test de présentation, mais l'arrivée animée nécessite une stratégie de mouvement plus stable, probablement un décor et une position de départ générés comme références séparées avant la prochaine itération.

Le plafond de cinq runs a été respecté : cinq runs ont été consommés, aucun sixième run ne sera lancé. Les sorties lourdes restent locales et ignorées par Git.

## Suite validée

La suite recommandée est de composer le résultat en trois plans indépendants : arrivée très courte, présentation fixe stable issue du run 3, puis plaquette et zoom du site. La génération d'une scène d'arrivée plus ambitieuse est reportée à un nouveau cycle explicitement autorisé.


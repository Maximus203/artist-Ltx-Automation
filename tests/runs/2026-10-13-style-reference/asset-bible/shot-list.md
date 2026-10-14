# Shot list — Atlas présente le site

Statut : validation vidéo en cours ; la voie d'assets LTX est disponible, mais l'arrivée animée reste à corriger.

## Direction

- Personnage : Atlas, même identité visuelle que la référence fournie.
- Tenue : la tenue jaune déjà validée dans la bible visuelle, sans réinterprétation.
- Mouvement : arrivée lente depuis le chemin à droite, puis arrêt face caméra ; pas de déplacement latéral complexe.
- Site : version claire de `https://cherif-diouf.artist-dev.com/fr/`.
- Plaquette : asset dédié, face caméra, URL ajoutée de façon déterministe en post-composition si le rendu LTX ne garantit pas une typographie lisible.

## Plans

1. **Arrivée** — plan large fixe ; Atlas arrive depuis la droite et avance vers la caméra. Aucun changement de décor.
2. **Présentation** — plan moyen fixe ; Atlas s'arrête, regarde la caméra et dit : « Bonjour, je m'appelle Atlas. Je suis l'assistante de Cherif. »
3. **Plaquette** — plan rapproché ; Atlas présente la plaquette avec l'adresse du site. Texte parlé : « Voici son site : cherif-diouf.artist-dev.com. »
4. **Transition site** — la plaquette reste au centre ; zoom progressif vers la capture claire du site jusqu'à remplir l'écran.
5. **Fin** — écran du site ; incrustation URL et conclusion : « Allez-y, et à bientôt ! »

## Gate

- [ ] Assets Atlas et plaquette générés avec la voie LTX retenue.
- [ ] Vues incohérentes refusées : profil avec yeux déformés ; vue dos avec plaquette visible derrière le corps.
- [ ] Capture claire du site réalisée.
- [ ] Chaque plan possède une référence d'asset et un prompt consignés.
- [ ] Préflight RAM/espace OK.

## Résultat du premier cycle bout en bout

- Run 1 : asset front conservant la tenue grise ; rejeté.
- Run 2 : asset front jaune obtenu ; vidéo bloquée par la quantification NVFP4 non installée.
- Run 3 : vidéo portrait stable avec un seul personnage ; le mouvement d'arrivée n'est pas réalisé.
- Run 4 : décor visible, mais silhouettes fantômes pendant l'arrivée ; rejeté visuellement.
- Run 5 : échec de chargement mémoire avant débruitage ; aucun MP4 produit.
- Limite appliquée : cinq runs utilisés sur cinq maximum ; aucun sixième run ne sera lancé automatiquement.

# Plan de test LTX-2.5

## Critères de réussite

- génération locale confirmée, sans bascule API involontaire ;
- vidéo et audio lisibles ;
- durée et résolution conformes aux paramètres ;
- absence d’erreur persistante dans les logs ;
- pour la continuité : identité reconnaissable du personnage et décor cohérent.

## Ordre des essais

1. **Smoke test** : texte vers vidéo, une scène, 720p, 6 s, audio activé.
2. **Image vers vidéo** : même personnage à partir d’une image de référence.
3. **Multishot** : deux plans dans une seule génération, même personnage et même lieu.
4. **Ingredients / IC-LoRA** : planche de référence personnage + accessoire + décor.

## Règles de mesure

Pour chaque essai, noter dans le manifeste : date, modèle, résolution, durée,
prompt, temps de génération, résultat et anomalie visuelle. Ne pas juger la
cohérence sur une seule image : regarder toute la séquence.


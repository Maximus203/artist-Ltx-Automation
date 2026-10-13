---
id: ltx-workflow-animated-youth-stories
type: workflow-idea
status: to_validate
created: 2026-10-12
updated: 2026-10-12
target_channel: to_confirm
audience: young-audience-age-to-confirm
formats: [animated-short-film, youtube-video]
tags: [ltx, storytelling, animation, youth, africa]
---

# Courts-métrages animés : histoires, choix et conséquences

## Intention exprimée
Créer des histoires africaines et non africaines pour un public jeune : éveiller la curiosité, faire réfléchir aux choix de vie, aux relations et aux mœurs. Chaîne YouTube dédiée déjà existante mais sans contenu selon Cherif ; nom et URL non confirmés. Ne pas inventer le nom ni publier sur une autre chaîne.

## Questions avant le pilote
Confirmer nom exact et lien de chaîne, tranche d'âge, langues et registre, durée cible, esthétique, présence de narration et périmètre culturel. Court-métrage et YouTube Short ne sont pas synonymes ; définir le format avant le cadrage.

## Pipeline proposé, pas encore exécuté
1. Verrouiller une image de style et sa provenance : rendu, lumière, palette, proportions et interdits.
2. Choisir un thème concret et un public : une situation vécue par un personnage, un choix, puis une conséquence compréhensible.
2. Documenter les sources si conte/tradition/histoire existante. Séparer fiction originale, adaptation et fait historique. Vérifier les droits des références et éviter les stéréotypes culturels.
3. Écrire synopsis puis scénario : conflit simple, progression et conclusion ouverte à la réflexion. Éviter une moralisation plaquée.
4. Produire la bible d'assets avant la vidéo : personnages face/profil/dos/trois-quarts, expressions, tenues séparées, accessoires multi-angles et décors wide/medium/close. Aucun plan ne passe si un asset requis n'est pas approuvé.
5. Faire storyboard et animatique pour valider l'histoire avant les rendus coûteux.
6. Associer chaque plan aux assets approuvés, à une image de conditionnement et à un prompt anglais concret. Lancer LTX par CLI, un plan court à la fois ; tester Multi-Key Frame seulement après vérification réelle de ses limites et prévoir des plans séparés comme repli.
7. Monter, enregistrer narration et bruitages, équilibrer voix et musique, ajouter sous-titres si utiles. Contrôler cohérence des personnages, raccords, compréhension et adéquation à la tranche d'âge.
8. Soumettre le pilote pour validation. Préparer titre, miniature et description ; vérifier réglages d'audience YouTube selon le public réel avant toute publication.
9. Reporter IDs d'épisode/export/publication et liens confirmés dans le registre dédié, sans doublons. Aucune programmation automatique n'est activée par cette note.

La procédure reproductible et le manifeste sont décrits dans [`docs/asset-pipeline.md`](../../docs/asset-pipeline.md) et préparés par `scripts/prepare-asset-bible.ps1`.

## Pistes de scénarios originales à discuter
- Un jeune accepte un raccourci séduisant et découvre son coût pour ses proches.
- Deux amis doivent choisir entre sauver les apparences et reconnaître une erreur.
- Une rencontre entre générations révèle l'origine d'une coutume et permet de la questionner.
Ce sont des pistes proposées, pas des scénarios validés.

## Critères du pilote
Histoire comprise sans explication supplémentaire, personnage identifiable entre plans, rythme adapté au public, voix intelligible, contexte culturel vérifié, aucune image présentée comme une preuve historique si elle est générée.
Budget, durée, modèle et calendrier restent à établir après un premier essai mesuré.

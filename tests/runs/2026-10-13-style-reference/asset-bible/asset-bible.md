# Asset bible — 2026-10-13-style-reference

## Style lock

- Référence : `references/style-reference.jpg`
- SHA-256 : `80cfd53e3c9629350245323dcad2609943d8747697cddafb1f541ec2cfab2332`
- Dimensions : 736×1308
- Rôle : référence de style uniquement, pas une fiche personnage complète.

## Personnage — child-style-reference

Statut : prêt pour régénération avec le pipeline image LTX Desktop headless. La fiche précédente a été produite avec un outil externe et ne constitue pas un asset LTX validé.

| Vue | Fichier | Statut | Notes QA |
|---|---|---|---|
| Face | à générer avec `scripts/ltx-image-generate.py` | pending_ltx_generation | proportions, visage, cheveux |
| Trois-quarts | à générer avec `scripts/ltx-image-generate.py` | pending_ltx_generation | volume et profondeur |
| Profil | à générer avec `scripts/ltx-image-generate.py` | pending_ltx_generation | yeux distincts et alignés |
| Dos | à générer avec `scripts/ltx-image-generate.py` | pending_ltx_generation | aucun accessoire visible derrière |

Fichier généré localement : `references/character-turnaround.png` — SHA-256 `F078EB928594157E2F423F3E1DACA0DC7661816AF44C29440DD569F955CDD4F5`.

Expressions à verrouiller : neutral, joy, concern, determined.

## Tenues

- `base-outfit` — `references/outfit-variants-sheet.png` — rejected_external_image_generation
- `yellow-outfit-atlas` — à générer avec la voie LTX retenue — blocked

Empreinte locale : `outfit-variants-sheet.png` — SHA-256 `59F0DB7B9866C8BBBD3DE88A9A1AF1B72F53BE68EE3C9F579F02462024117B47`.

## Accessoires et décors

- `prop-placard-site-url` — à générer avec la voie LTX retenue — blocked
- `environment-safe-path` — `references/environment-safe-path-sheet.png` — vues wide, medium, close — rejected_external_image_generation

Empreintes locales :

- `prop-signpost-sheet.png` — SHA-256 `2AFDCDA88CA0C2F25B804A14E1FEAECA240A6FCE351095A45253D30482F18FAA`
- `environment-safe-path-sheet.png` — SHA-256 `F5A71DE649EBB3BB6A3114B92856F09A84BD35BD8324B3CE69ADF8CC67917265`

## Gate de génération

- [ ] Toutes les vues requises existent dans une version générée par LTX.
- [ ] Chaque vue est cohérente avec le style lock.
- [ ] Chaque asset requis est marqué `approved`.
- [x] La shot list est préparée dans `shot-list.md`.
- [ ] La commande LTX CLI et son résultat sont consignés.
- [ ] Le préflight RAM/espace est OK.

## Corrections à respecter

- Atlas doit reprendre la tenue jaune déjà validée, pas une nouvelle tenue jaune inventée.
- La vue de profil doit conserver des yeux distincts et correctement alignés.
- La vue de dos ne doit pas montrer la plaquette derrière Atlas ; la plaquette est un accessoire tenu devant elle et sera cadrée dans les plans utiles.

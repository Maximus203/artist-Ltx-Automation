# Asset bible — 2026-10-13-style-reference

## Style lock

- Référence : `references/style-reference.jpg`
- SHA-256 : `80cfd53e3c9629350245323dcad2609943d8747697cddafb1f541ec2cfab2332`
- Dimensions : 736×1308
- Rôle : référence de style uniquement, pas une fiche personnage complète.

## Personnage — child-style-reference

| Vue | Fichier | Statut | Notes QA |
|---|---|---|---|
| Face | `references/character-turnaround.png` | generated_pending_review | proportions, visage, cheveux |
| Trois-quarts | `references/character-turnaround.png` | generated_pending_review | volume et profondeur |
| Profil | `references/character-turnaround.png` | generated_pending_review | silhouette et nez/menton |
| Dos | `references/character-turnaround.png` | generated_pending_review | cheveux, vêtements, proportions |

Fichier généré localement : `references/character-turnaround.png` — SHA-256 `F078EB928594157E2F423F3E1DACA0DC7661816AF44C29440DD569F955CDD4F5`.

Expressions à verrouiller : neutral, joy, concern, determined.

## Tenues

- `base-outfit` — `references/outfit-variants-sheet.png` — generated_pending_review
- `safe-path-outfit` — `references/outfit-variants-sheet.png` — generated_pending_review

Empreinte locale : `outfit-variants-sheet.png` — SHA-256 `59F0DB7B9866C8BBBD3DE88A9A1AF1B72F53BE68EE3C9F579F02462024117B47`.

## Accessoires et décors

- `prop-signpost` — `references/prop-signpost-sheet.png` — vues front, side, three-quarter, top — generated_pending_review
- `environment-safe-path` — `references/environment-safe-path-sheet.png` — vues wide, medium, close — generated_pending_review

Empreintes locales :

- `prop-signpost-sheet.png` — SHA-256 `2AFDCDA88CA0C2F25B804A14E1FEAECA240A6FCE351095A45253D30482F18FAA`
- `environment-safe-path-sheet.png` — SHA-256 `F5A71DE649EBB3BB6A3114B92856F09A84BD35BD8324B3CE69ADF8CC67917265`

## Gate de génération

- [ ] Toutes les vues requises existent.
- [ ] Chaque vue est cohérente avec le style lock.
- [ ] Chaque asset requis est marqué `approved`.
- [ ] La shot list référence uniquement des assets approuvés.
- [ ] La commande LTX CLI et son résultat sont consignés.

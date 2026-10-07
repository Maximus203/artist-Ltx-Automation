# LTX-2.5 — espace de tests local

Ce dossier contient uniquement les éléments de préparation et de test pour
LTX Desktop / LTX-2.5 sur cette machine Windows.

## Emplacements

- `models/` : poids téléchargés par LTX Desktop — non versionnés.
- `references/` : images ou planches de référence dédiées aux tests.
- `outputs/` : vidéos générées — non versionnées.
- `logs/` : journaux et captures de diagnostic — non versionnés.
- `config/ltx-test-config.json` : configuration de référence du protocole.
- `scripts/preflight.ps1` : contrôle matériel et espace avant test.
- `tests/test-manifest.json` : scénarios reproductibles.

## Première configuration

1. Lancer l’installateur officiel.
2. Choisir `D:\\01-Dev\\LTX-Desktop\\models` comme emplacement des modèles si
   l’application le demande.
3. Sélectionner `LTX 2.5 Fast` et le mode local.
4. Utiliser d’abord le mode single-stage en 720p / 6 secondes.
5. Exécuter `scripts\\preflight.ps1` avant chaque série de tests.

Le pipeline Python brut n’est pas le premier chemin de test : la machine a
24 Go de VRAM alors que la documentation LTX indique 32 Go+ pour la
configuration standard. LTX Desktop est le chemin local adapté à cette carte.


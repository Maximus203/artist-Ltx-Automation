# LTX-2.5 — règles du projet de test

Ce dossier sert exclusivement aux essais locaux de LTX Desktop / LTX-2.5.

- Ne jamais versionner les modèles, sorties vidéo, journaux lourds ou secrets.
- Utiliser `config/ltx-test-config.json` comme référence des chemins locaux.
- Exécuter `scripts/preflight.ps1` avant une série de générations.
- Noter chaque essai dans `tests/test-manifest.json` ou dans un journal dédié.
- Ne pas utiliser de personnes, marques ou décors réels sans autorisation.
- Le mode local doit être vérifié dans l’interface ; ne pas supposer qu’une
  génération est locale parce que l’application est installée.

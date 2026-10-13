# artist-Ltx-Automation

Protocole léger de préparation et de test local de LTX Desktop / LTX-2.5.

Ce dépôt ne contient ni modèle, ni installeur, ni vidéo générée. Il conserve uniquement la documentation, la configuration de référence, le manifeste des scénarios et les scripts nécessaires pour reproduire les essais.

## État actuel

- Matériel ciblé : Windows + NVIDIA CUDA + RTX 5090 Laptop, 24 Go de VRAM.
- Modèle visé : **LTX 2.5 Fast**.
- Premier scénario : texte vers vidéo, 720p, 6 secondes, audio activé, génération locale.
- Préflight : validé le 5 octobre 2026.
- Génération LTX : non encore validée ; l’installeur local v1.2.7 se termine actuellement avec le code 2 sans ouvrir l’application.

## Démarrage

1. Installer LTX Desktop depuis une source officielle, en dehors de ce dépôt.
2. Ouvrir l’application et sélectionner **LTX 2.5 Fast**.
3. Vérifier visuellement que le mode choisi est **Local**.
4. Choisir Text to Video, 720p, 6 secondes et audio activé.
5. Exécuter le préflight :

   ```powershell
   .\scripts\preflight.ps1
   ```

6. Lancer le smoke test et noter le résultat dans `tests/test-manifest.json` ou dans un journal dédié.

## Organisation

- `config/ltx-test-config.json` : paramètres de référence portables.
- `docs/test-plan.md` : ordre des essais et critères de réussite.
- `docs/asset-pipeline.md` : pipeline obligatoire des assets avant la vidéo.
- `scripts/preflight.ps1` : vérification de l’espace disque, de la mémoire et du GPU.
- `scripts/prepare-asset-bible.ps1` : préparation reproductible d’une bible d’assets depuis une image de style.
- `tests/test-manifest.json` : scénarios reproductibles.
- `references/` : références visuelles et notes de continuité, sans médias lourds.
- `models/`, `outputs/`, `logs/` : dossiers locaux ignorés par Git.

## Scénarios

1. Smoke test texte vers vidéo.
2. Image vers vidéo avec ancrage visuel.
3. Continuité entre deux plans.
4. Cohérence à partir d’une planche de références.

Les essais doivent éviter les personnes, marques et décors réels sans autorisation. Chaque génération doit conserver ses réglages, son résultat et ses anomalies observées.

## Limites connues

Le dépôt décrit le protocole et les tests prévus ; il ne prétend pas qu’une génération locale a déjà réussi. La validation finale nécessite une application LTX Desktop fonctionnelle et une vérification dans son interface.

Une première bible d’assets a été préparée localement à partir de `wallpaper.jpg` : personnage multi-angle, variantes de tenue, panneau indicateur et décor de chemin. Les planches sont ignorées par Git et portent le statut `generated_pending_review` jusqu’à validation visuelle.

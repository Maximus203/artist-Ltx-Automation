# Génération d'images avec LTX Desktop

## Résultat de la vérification

LTX Desktop installé localement est en version 1.3.0. La génération d'images existe bien, mais elle n'est pas exposée par le module public `ltx_pipelines` qui fournit les commandes vidéo `distilled` et `ti2vid_one_stage`.

Le backend livré avec LTX Desktop contient à la place :

- le pipeline local `ZitImageGenerationPipeline` ;
- le modèle `Z-Image-Turbo` ;
- la route backend `/api/generate-image` ;
- les modes texte-vers-image et image-vers-image.

Le modèle local est installé hors du dépôt de test, dans le répertoire de modèles LTX configuré sur la machine. Les poids restent ignorés par Git.

## Commande headless du projet

Le wrapper `scripts/ltx-image-generate.py` réutilise directement le pipeline image embarqué dans LTX Desktop, sans ouvrir l'interface et sans piloter la souris.

Exemple de smoke test :

```powershell
$py = 'C:\Users\diouf\AppData\Local\LTXDesktop\python\python.exe'
& $py scripts/ltx-image-generate.py `
  --model-path 'D:\01-Dev\Model\LTX\Z-Image-Turbo' `
  --prompt 'A stylized 3D cartoon girl named Atlas, wearing the approved yellow outfit, front view, neutral studio background, consistent child-friendly character design' `
  --output 'outputs\image-smoke\atlas-yellow-front.png' `
  --width 512 --height 512 --steps 4 --seed 10
```

## Limites

- Cette commande utilise le composant image officiel embarqué par LTX Desktop, mais pas le modèle vidéo LTX-2.5 lui-même.
- Elle nécessite le dossier local complet `Z-Image-Turbo` et suffisamment de RAM/VRAM.
- Le texte exact d'une plaquette doit être vérifié après génération ; si la typographie dérive, la plaquette doit être composée séparément à partir d'une image générée sans texte.
- Les assets générés doivent encore passer la gate humaine de cohérence avant la génération vidéo.

## Sources officielles

- [LTX Desktop — README](https://github.com/Lightricks/LTX-Desktop)
- [Spécification officielle du modèle Z-Image-Turbo](https://github.com/Lightricks/LTX-Desktop/blob/main/backend/runtime_config/model_download_specs.py)
- [Pipeline image du backend LTX Desktop](https://github.com/Lightricks/LTX-Desktop/tree/main/backend/services/image_generation_pipeline)

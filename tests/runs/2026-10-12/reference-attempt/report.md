# Référence courte — constat du 12 octobre 2026

## Verdict

La génération de référence n'a pas abouti. Aucun test de la matrice T02–T08 n'a été lancé. Le parcours UI n'a pas reçu d'entrée Kimi et le parcours CLI n'a produit aucun média. Cette note sépare ces échecs des capacités confirmées par inspection de l'interface, du paquet local et de la documentation officielle.

## Préflight observé

- Windows 11 x64, build 10.0.26200 ; Intel Core Ultra 9 275HX (24 cœurs logiques).
- RTX 5090 Laptop, pilote 610.88, 24 463 MiB VRAM ; au relevé initial 24 137 MiB libres, 0 MiB utilisés, 54 °C.
- RAM : 63,4 GiB détectés, 18,2 GiB libres avant la tentative CLI ; le minimum observé pendant la tentative est tombé à 0 GiB libres. Après arrêt du processus, 27,8 GiB étaient libres.
- Fichier d'échange Windows : 58 324 MiB alloués, 2 685 MiB utilisés au relevé initial (pic historique du démarrage : 35 473 MiB).
- Volume D : 85,0 GiB libres sur 976,6 GiB. Le préflight du dépôt échoue à son seuil de 160 GiB.
- LTX Desktop 1.3.0 ; backend Python embarqué 3.13.12, ltx-pipelines/ltx-core 1.4.1, PyTorch 2.10.0+cu128. FFmpeg 9.0.
- Les poids LTX 2.5 sont déjà présents sous le répertoire configuré localement. Aucun poids ni paquet n'a été téléchargé.

## Parcours UI — Kimi Computer Use

- Observation initiale : écran Generate Multi-Key Frame Video, compteur 0/10, sélection de modèle LTX 2.5 Fast, durée 5 s, 540p, 24 fps, 16:9. L'écran ne montrait aucune image ajoutée.
- Cette observation ne prouve pas la génération ni la sémantique des dix emplacements.
- L'entrée Kimi a d'abord répondu computer_use_busy car une autre session Computer Use détenait le contrôle ; la capture suivante était noire. Plus tard, la lecture seule a révélé une boîte de dialogue LoRAs. Une fois le contrôle disponible, j'ai fermé cette boîte et ouvert Explore Tools pour inspecter le catalogue, sans lancer de génération ni saisir de prompt.
- Le catalogue UI exposait Image to Video, Audio to Video, Text to Video, Extend, Layout to Render, Restore, Retake, Day to Night, Deblur, Colorization, Clean Plate, Decompression, Water Simulation et les outils de caméra Jib Up/Down, Dolly In/Out, Drone Flythrough, OpenWheel T-Cam, Transition et VBVR. Ce sont des entrées observées ; leur compatibilité avec le modèle local ou la qualité de leurs rendus n'a pas été testée. Cela ne permet pas d'attester le workflow Multi-Key Frame.
- Aucun prompt de test, paramètre d'essai, lancement, média ou temps de génération UI n'est donc rapporté comme résultat.
- Les journaux locaux antérieurs attestent le mode backend streaming_models_loading et CUDA, mais pas une génération UI réussie. Le 5 octobre, deux chargements du text encoder ont échoué en une seconde avec Windows os error 1455 (fichier de pagination insuffisant). Ce sont des incidents historiques, distincts de cet essai.

## Parcours CLI — référence courte

CLI officielle disponible dans l'environnement Python embarqué de Desktop : python -m ltx_pipelines.distilled. Le --help installé confirme les chemins séparés du transformer, text encoder, VAE vidéo/audio, duration head et spatial upsampler, ainsi que --image PATH FRAME_IDX STRENGTH [CRF] répétable et --num-generated-keyframes. Ces derniers désignent des images conditionnantes et des emplacements générés différents.

Le premier lancement a été refusé avant le chargement du modèle car la valeur CPU était invalide. Le code installé définit les valeurs sensibles à la casse none, cpu, disk; la tentative corrigée a utilisé disk. Le mode cpu déclare dans le code local environ 36 Go de RAM et 5 Go de VRAM nécessaires ; disk relit les poids et est décrit comme environ 5 Go de RAM et 5 Go de VRAM.

Commande exécutée (sortie dans %TEMP%, hors dépôt) :

    $py = "$env:LOCALAPPDATA\LTXDesktop\python\python.exe"
    $m = 'D:\01-Dev\Model\LTX\ltx-2.5'
    & $py -m ltx_pipelines.distilled --transformer-path "$m\ltx-2.5-22b-distilled-transformer-bf16.safetensors" --text-encoder-path "$m\gemma4-12b-with-proj-ltx-2.5-bf16.safetensors" --video-vae-path "$m\ltx-2.5-video-vae-bf16.safetensors" --audio-vae-path "$m\ltx-2.5-audio-vae-bf16.safetensors" --duration-head-path "$m\ltx-2.5-duration-head-bf16.safetensors" --spatial-upsampler-path "$m\ltx-2.5-latent-spatial-upscaler-x2-bf16-1.0.safetensors" --prompt 'A small red clay figure begins seated cross-legged, slowly opens its eyes and rises into a poised martial-arts stance in a simple red studio; locked camera, one continuous shot.' --output-path "$env:TEMP\ltx-po-cli-reference-2026-10-12.mp4" --num-frames 9 --height 256 --width 256 --frame-rate 24 --offload disk

Le processus a commencé à charger le text encoder, a consommé toute la mémoire physique disponible et a été arrêté pour rendre la machine utilisable. Au dernier relevé, son working set était 7,89 GiB, RAM libre 0 GiB, VRAM utilisée 3 984 MiB ; ces mesures sont des échantillons et non des maxima garantis. Aucun fichier vidéo n'existe à l'emplacement demandé. Durée totale de tentative observée : environ une minute, sans inférence terminée. Ne pas traiter le code d'aide ou le chargement des poids comme une génération.

La commande n'est donc pas une baseline de qualité : seul le fait que la CLI accepte cette configuration reste à vérifier jusqu'à la génération. Ne pas exécuter T02–T08 avant une référence qui termine sans épuiser la mémoire, et ne pas fermer l'application Desktop actuellement ouverte sans coordination.

## Multi-Key Frame : capacité vérifiée / inconnue

- L'interface locale exposait un compteur de 0 à 10, mais aucun essai n'a vérifié le nombre de keyframes ajoutables, leur placement temporel, les images intermédiaires, ni la sortie.
- L'aide CLI locale accepte plusieurs arguments --image PATH FRAME_IDX STRENGTH [CRF] et --num-generated-keyframes N; elle ne fournit pas la même UI. Les images de conditionnement sont assignées à des indices de frame ; les slots générés sont une option distincte.
- Les pages officielles décrivent le conditionnement image et les slots de keyframes générés, mais cela ne démontre pas la compatibilité exacte du paquet Desktop 1.4.1 installé avec la UI de l'application 1.3.0. Références : [LTX Desktop](https://github.com/Lightricks/LTX-Desktop), [guide conditioning LTX-2](https://github.com/Lightricks/LTX-2/blob/main/packages/ltx-pipelines/docs/conditioning.md), [README des pipelines](https://github.com/Lightricks/LTX-2/blob/main/packages/ltx-pipelines/README.md).

## Skills, données et suite

Aucun skill canonique dédié à LTX n'est présent dans le catalogue local ; les skills montage/préflight consultés ne décrivent pas la génération LTX. Aucun skill n'a donc été modifié ni resynchronisé au moyen d'une copie improvisée. La suite devra d'abord rétablir le contrôle Computer Use, réduire la pression mémoire (processus concurrents ou choix runtime validé), refaire une référence avec mesure continue, puis seulement commencer les tests un changement à la fois.

Aucune référence Pinterest n'a été téléchargée ; aucune empreinte d'image ou de vidéo n'est disponible. Aucun secret, poids, journal lourd ni vidéo n'est inclus dans ce rapport.

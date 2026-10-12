# Essais locaux UI et CLI — 12 octobre 2026

## État et autorisation
Travail directement sur main, sans branche ni PR, autorisé par Cherif pour CE dépôt seulement. Préserver le travail local et les contributions concurrentes. Le README décrit un incident du 5 octobre : ne pas traiter cet incident historique comme l'état actuel. L'application est utilisée par Cherif ; aucun essai comparatif reproductible UI/CLI n'est encore attesté ici.

## Objectif
Comparer LTX Desktop piloté avec Kimi Computer Use et une voie CLI officielle compatible avec les versions installées. Améliorer les compétences locales utiles après lecture de leurs instructions, sans inventer une compétence ou une API. La machine annoncée possède 64 Go RAM et 24 Go VRAM ; mesurer le matériel, les pilotes, versions, mémoire libre et disque avant essais.

## Sources à vérifier
- https://github.com/Lightricks/LTX-Desktop
- https://github.com/Lightricks/LTX-2
- https://docs.ltx.io/open-source-model/usage-guides/prompting-guide
Lire les instructions du checkout. Relever les commandes réellement disponibles via l'aide des modules officiels installés. Consigner version et lien source de chaque commande. Aucun endpoint privé ou commande CLI conjecturale.

## Références Po
1. https://www.pinterest.com/pin/16044142419637519/
2. https://www.pinterest.com/pin/1078401073288687957/
3. https://www.pinterest.com/pin/767160117816004373/
Télécharger les images autorisées pour l'essai, conserver originaux et empreintes. Redresser la première dans une copie. Pour la troisième, sélectionner la première image du carrousel (pose kung-fu). Même rendu 3D détaillé et fond rouge. Ne pas envoyer des médias privés au cloud sans accord spécifique.

## Parcours UI
Utiliser Kimi Computer Use si disponible. Vérifier compte/mode Local/modèle et les champs réels du panneau Generate Multi-Key Frame Video. Noter si plusieurs images intermédiaires, temps ou indices sont réellement acceptés, leurs contraintes et le modèle requis. Importer une image par position selon l'interface. Ne pas remplacer une fonction manquante par une promesse ; si seules les première/dernière images sont disponibles, noter la limite et utiliser trois plans assemblés comme repli. Garder captures des réglages et export local.

## Parcours CLI
Installer seulement les dépendances nécessaires à une voie officielle compatible, sans supprimer les modèles existants ni acheter de service. Ne pas supposer que Desktop expose une CLI. Si la CLI repose sur ltx-pipelines séparé, documenter cette différence de moteur, versions et chargement des poids. Vérifier aide, image conditioning, timecodes/frame indices, format, export audio et compatibilité ; puis publier les commandes exactes reproduites. Réutiliser les mêmes références et paramètres autant que possible ; signaler toute différence qui interdit une comparaison directe.

## Matrice
- T00 : préflight et inventaire des compétences/outils réellement disponibles.
- T01 : texte vers vidéo court, baseline locale.
- T02 : image 1 vers vidéo, caméra fixe, seed 42.
- T03 : trois images clés dans une seule séquence si supporté ; ordre méditation, éveil, kung-fu.
- T04 : repli trois plans, environ 4 s chacun, assemblage en une vidéo.
- T05 : Dolly Out seul, puis Jib Up seul, mêmes références.
- T06 : VBVR seul, uniquement si compatible avec le modèle ; comparer au baseline.
- T07 : Torch Compile seul ; exclure la compilation initiale du calcul du gain chaud.
- T08 : reprise après interruption et déduplication des sorties.
Commencer à résolution modérée et durée courte proposées par le mode. Diffusion Stage Cache désactivé pour les premiers tests 24 Go. N'activer qu'un changement par comparaison.

## Prompts anglais
### Meditation
Po sits in meditation with his eyes closed. His chest and belly rise and fall gently with each slow breath. His hands remain still and his expression is peaceful. The camera stays locked off. Preserve the reference composition, detailed fur and stylized 3D appearance, deep red background and soft facial lighting. Quiet breathing, no dialogue or music.
### Awakening
Po continues meditating, then slowly opens his eyes and forms a small confident smile. He lifts his head slightly. Preserve his face, clothing, proportions and detailed fur. The camera stays stationary, with the same deep red background and soft lighting. One smooth, simple movement. Quiet breathing, no dialogue or music.
### Kung-fu
Po holds the kung-fu stance of the reference image. He shifts his weight slightly forward, makes one controlled paw movement, then holds his pose with a determined smile. Preserve his anatomy, clothing and detailed fur. Stationary camera, consistent stylized 3D appearance and deep red lighting. Brief soft movement sound, no dialogue or music.
### Séquence continue si le mode est confirmé
Po begins seated in peaceful meditation, breathing slowly with his eyes closed. He gently opens his eyes, smiles and rises into the kung-fu stance of the final reference. He performs one controlled paw movement and holds his final pose. Maintain his identity, clothing, proportions and detailed fur throughout. Consistent stylized 3D animation, deep red background and soft lighting. Locked-off camera, smooth continuous motion. Quiet breathing followed by a soft movement sound; no dialogue or music.
La deuxième référence montre aussi des yeux fermés : une keyframe imposée ne doit pas être décrite comme une image d'yeux ouverts. Adapter le moment d'éveil entre les références.

## Résultats durables
Un dossier tests/runs/YYYY-MM-DD/run-id/ contenant un rapport Markdown et un manifeste JSON non sensible : test_id, route, date Dakar avec offset, versions, git_sha, modèle et adaptateurs, source_sha256, prompt, seed, résolution, durée/fps, commande exacte ou étapes UI, statut (planned/running/passed/failed/blocked), elapsed_seconds, peak_vram_mib, ram_available_mib, export local et empreinte, anomalies, limites.
Les vidéos restent locales dans outputs/ et ne doivent pas être poussées comme médias lourds. Aucun jeton/mot de passe/session privée dans Git. Le seed ne garantit pas identité ou égalité bit à bit entre moteurs.
Contrôler temporalité, visage/proportions, membres, raccords, fourrure, flou/scintillement, audio et décodage export. Distinguer mesures échantillonnées et pics absolus.

### Premier constat (12 octobre 2026)

La tentative de référence est bloquée avant la génération dans les deux parcours : Kimi Computer Use n'a pas pu prendre le contrôle de l'UI ; la CLI a épuisé la RAM disponible au chargement du texte, sans exporter de vidéo. Les essais T02–T08 restent à faire. Détails, commandes et relevés dans [le rapport de tentative](../tests/runs/2026-10-12/reference-attempt/report.md) et son [manifeste](../tests/runs/2026-10-12/reference-attempt/manifest.json).

## Fin de passage
Actualiser les compétences utiles via leur mécanisme de synchronisation prévu et documenter les modifications. Exécuter les validations pertinentes. Publier documentation et outils non sensibles directement sur main, sans force-push ; en cas de concurrence, récupérer et intégrer proprement. Fournir SHA distant vérifié, résultats UI et CLI séparés, commandes reproductibles et les éventuels blocages. Ne déclarer ni installation ni succès sans preuve.

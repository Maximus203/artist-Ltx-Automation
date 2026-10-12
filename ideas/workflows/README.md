---
type: workflow-registry
updated: 2026-10-12
status: active
---

# Registre des idées de workflows LTX

Une note Markdown par workflow, lisible sur GitHub et dans Obsidian. Ce dossier est le registre canonique des workflows LTX : ne pas créer de copie indépendante dans le vault. L'agent local doit d'abord vérifier le vault existant puis choisir un lien ou une synchronisation documentée qui préserve les modifications. Aucune connexion Obsidian n'est encore configurée ici.

## Index
- [Courts-métrages animés pour les jeunes](./animated-youth-stories.md)

## Convention
Nom stable en kebab-case et identifiant immuable. Frontmatter : id, type, status, created, updated, target_channel, audience, formats, tags. Statuts : idea, to_validate, approved, in_production, ready, scheduled, published, blocked, archived.
Les agents enrichissent les idées, les sources et les variantes, vérifient les doublons avant création et mettent à jour cet index. Une idée n'autorise pas sa publication. Une note ne prouve pas qu'un workflow tourne.
Chaque épisode futur doit être relié au workflow, à son scénario, aux références et au registre de production/publication. Préférer les chemins relatifs et les liens Markdown standards.
Ne pas mettre de secrets, données personnelles, médias lourds ou jetons dans Git.
Écritures autorisées sur main pour ce dépôt, sans PR ni force-push. Préserver les modifications concurrentes.

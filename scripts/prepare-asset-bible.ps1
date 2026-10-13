[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$ReferenceImage,
    [string]$RunId = (Get-Date -Format 'yyyy-MM-dd'),
    [string]$CharacterId = 'child-style-reference'
)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$referenceDir = Join-Path $projectRoot 'references'
$runDir = Join-Path $projectRoot (Join-Path 'tests\runs' $RunId)
$assetDir = Join-Path $runDir 'asset-bible'
$localReference = Join-Path $referenceDir 'style-reference.jpg'

if (-not (Test-Path -LiteralPath $ReferenceImage -PathType Leaf)) {
    throw "Image de référence introuvable : $ReferenceImage"
}

New-Item -ItemType Directory -Force -Path $referenceDir, $assetDir | Out-Null
Copy-Item -LiteralPath $ReferenceImage -Destination $localReference -Force

Add-Type -AssemblyName System.Drawing
$image = [Drawing.Image]::FromFile($localReference)
try {
    $width = $image.Width
    $height = $image.Height
} finally {
    $image.Dispose()
}

$hash = (Get-FileHash -LiteralPath $localReference -Algorithm SHA256).Hash.ToLowerInvariant()
$manifest = [ordered]@{
    workflow = 'ltx-workflow-animated-youth-stories'
    run_id = $RunId
    status = 'blocked_until_asset_review'
    reference = [ordered]@{
        file = 'references/style-reference.jpg'
        source_name = [IO.Path]::GetFileName($ReferenceImage)
        sha256 = $hash
        width = $width
        height = $height
        role = 'style reference only'
    }
    character = [ordered]@{
        id = $CharacterId
        required_views = @('front', 'three-quarter', 'profile', 'back')
        expressions = @('neutral', 'joy', 'concern', 'determined')
        outfits = @('base-outfit', 'safe-path-outfit')
        status = 'planned'
    }
    assets = @(
        @{ id = 'character-sheet'; kind = 'character'; views = @('front', 'three-quarter', 'profile', 'back'); status = 'planned' },
        @{ id = 'outfit-base'; kind = 'outfit'; views = @('front', 'back', 'detail'); status = 'planned' },
        @{ id = 'prop-signpost'; kind = 'prop'; views = @('front', 'side', 'three-quarter', 'top'); status = 'planned' },
        @{ id = 'environment-safe-path'; kind = 'environment'; views = @('wide', 'medium', 'close'); status = 'planned' }
    )
    shots = @()
}
$manifest | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $assetDir 'manifest.json') -Encoding utf8

$template = @'
# Asset bible — __RUN_ID__

## Style lock

- Référence : `references/style-reference.jpg`
- SHA-256 : `__HASH__`
- Dimensions : __WIDTH__×__HEIGHT__
- Rôle : référence de style uniquement, pas une fiche personnage complète.

## Personnage — __CHARACTER_ID__

| Vue | Fichier | Statut | Notes QA |
|---|---|---|---|
| Face | — | planned | proportions, visage, cheveux |
| Trois-quarts | — | planned | volume et profondeur |
| Profil | — | planned | silhouette et nez/menton |
| Dos | — | planned | cheveux, vêtements, proportions |

Expressions à verrouiller : neutral, joy, concern, determined.

## Tenues

- `base-outfit` — planned
- `safe-path-outfit` — planned

## Accessoires et décors

- `prop-signpost` — vues front, side, three-quarter, top — planned
- `environment-safe-path` — vues wide, medium, close — planned

## Gate de génération

- [ ] Toutes les vues requises existent.
- [ ] Chaque vue est cohérente avec le style lock.
- [ ] Chaque asset requis est marqué `approved`.
- [ ] La shot list référence uniquement des assets approuvés.
- [ ] La commande LTX CLI et son résultat sont consignés.
'@
$template = $template.Replace('__RUN_ID__', $RunId).
    Replace('__HASH__', $hash).
    Replace('__WIDTH__', [string]$width).
    Replace('__HEIGHT__', [string]$height).
    Replace('__CHARACTER_ID__', $CharacterId)
$template | Set-Content -LiteralPath (Join-Path $assetDir 'asset-bible.md') -Encoding utf8

Write-Output "Asset bible préparée : $assetDir"
Write-Output "Référence copiée localement : $localReference"
Write-Output "SHA-256 : $hash"

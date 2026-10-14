[CmdletBinding()]
param(
    [ValidateRange(1, 5)]
    [int]$MaxRuns = 5,
    [switch]$AssetsOnly
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$py = 'C:\Users\diouf\AppData\Local\LTXDesktop\python\python.exe'
$imageModel = 'D:\01-Dev\Model\LTX\Z-Image-Turbo'
$videoModel = 'D:\01-Dev\Model\LTX\ltx-2.5'
$reference = Join-Path $root 'references\style-reference.jpg'
$runRoot = Join-Path $root 'outputs\e2e'
$logPath = Join-Path $root 'tests\runs\2026-10-13-style-reference\e2e-run-log.jsonl'
$imageScript = Join-Path $root 'scripts\ltx-image-generate.py'

function Get-Resources {
    $drive = Get-Volume -DriveLetter D
    $os = Get-CimInstance Win32_OperatingSystem
    [pscustomobject]@{
        disk_gb = [math]::Round($drive.SizeRemaining / 1GB, 1)
        ram_gb = [math]::Round($os.FreePhysicalMemory / 1MB, 1)
    }
}

function Invoke-Preflight {
    & powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root 'scripts\preflight.ps1')
    if ($LASTEXITCODE -ne 0) { throw 'Préflight LTX échoué.' }
}

function Write-RunLog([int]$run, [string]$phase, [string]$status, [string]$detail) {
    $entry = [ordered]@{
        timestamp = (Get-Date).ToUniversalTime().ToString('o')
        run = $run
        phase = $phase
        status = $status
        detail = $detail
        resources = Get-Resources
    }
    $entry | ConvertTo-Json -Compress | Add-Content -LiteralPath $logPath
}

if (-not (Test-Path $reference)) { throw "Référence de style absente : $reference" }
if (-not (Test-Path $imageModel)) { throw "Modèle image LTX absent : $imageModel" }
New-Item -ItemType Directory -Force -Path $runRoot | Out-Null

for ($run = 1; $run -le $MaxRuns; $run++) {
    Invoke-Preflight
    Write-RunLog $run 'preflight' 'passed' 'Ressources suffisantes.'

    $dir = Join-Path $runRoot ("run-{0:D2}" -f $run)
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    $front = Join-Path $dir 'atlas-yellow-front.png'
    $strength = if ($run -eq 1) { 0.78 } else { 0.70 }
    $prompt = 'Atlas, same child-friendly stylized 3D cartoon girl identity from the reference, short dark brown bob haircut, warm orange skin, rounded face, large clear separated eyes, wearing a clearly bright solid yellow outfit, front-facing full body, neutral light studio background, no text, no sign, no extra characters, coherent anatomy.'
    & $py $imageScript --model-path $imageModel --image-path $reference --strength $strength --prompt $prompt --output $front --steps 4 --seed (20261014 + $run)
    if ($LASTEXITCODE -ne 0 -or -not (Test-Path $front)) { Write-RunLog $run 'asset-front' 'failed' 'Image front absente.'; continue }
    Write-RunLog $run 'asset-front' 'produced' $front

    if ($AssetsOnly) { continue }
    Write-RunLog $run 'asset-gate' 'blocked' 'Contrôle visuel humain requis avant la génération vidéo.'
    break
}

Write-Host "Workflow arrêté au point de gate visuelle. Les assets candidats et le journal sont dans outputs/e2e et tests/runs/2026-10-13-style-reference."

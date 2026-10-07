[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$drive = Get-Volume -DriveLetter D
$os = Get-CimInstance Win32_OperatingSystem
$gpu = nvidia-smi --query-gpu=name,memory.total,memory.free,driver_version --format=csv,noheader 2>$null

Write-Host "LTX-2.5 local preflight"
Write-Host "Project : $projectRoot"
Write-Host ("D: libre : {0:N1} Go" -f ($drive.SizeRemaining / 1GB))
Write-Host ("RAM libre : {0:N1} Go" -f ($os.FreePhysicalMemory / 1MB))
Write-Host "GPU : $gpu"

if ($drive.SizeRemaining -lt 160GB) {
    throw "Espace libre inférieur à 160 Go sur D:. Libérer de l’espace avant de télécharger les modèles."
}

$required = @(
    (Join-Path $projectRoot 'models'),
    (Join-Path $projectRoot 'outputs'),
    (Join-Path $projectRoot 'references'),
    (Join-Path $projectRoot 'logs')
)
$required | ForEach-Object { New-Item -ItemType Directory -Force -Path $_ | Out-Null }
Write-Host 'Préflight OK : dossiers présents et espace suffisant.'

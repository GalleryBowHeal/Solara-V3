# Check for SolaraV3 updates
#   irm https://raw.githubusercontent.com/ChampionWand/SolaraV3/main/scripts/update.ps1 | iex
$ErrorActionPreference = "Stop"
$Repo = "ChampionWand/SolaraV3"
$LocalVer = ""
if (Test-Path "C:\SolaraV3\version.txt") { $LocalVer = (Get-Content "C:\SolaraV3\version.txt" -Raw).Trim() }
try {
  $rel = Invoke-RestMethod -Uri "https://api.github.com/repos/$Repo/releases/latest" -TimeoutSec 20
  Write-Host "Latest : $($rel.tag_name) — $($rel.name)"
  Write-Host "Local  : $LocalVer"
  Write-Host "URL    : $($rel.html_url)"
  if ($LocalVer -and ($rel.tag_name -notlike "*$LocalVer*")) {
    Write-Host "[!] Update available. Re-run install.ps1 to update." -ForegroundColor Yellow
  } else { Write-Host "[+] You are up to date (or version file missing)." -ForegroundColor Green }
} catch { Write-Host "[-] Cannot reach GitHub API: $_" -ForegroundColor Red }

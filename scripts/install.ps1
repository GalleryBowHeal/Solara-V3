# SolaraV3 — one-line installer
# Usage (admin PowerShell):
#   irm https://raw.githubusercontent.com/ChampionWand/SolaraV3/main/scripts/install.ps1 | iex

$ErrorActionPreference = "Stop"
$Repo = "ChampionWand/SolaraV3"
$InstallDir = "C:\SolaraV3"
$ZipName = "SolaraV3.zip"

Write-Host "=== SolaraV3 installer ===" -ForegroundColor Cyan
Write-Host "[!] If Windows Defender deletes Solara, disable AV first, then add exclusion after first run." -ForegroundColor Yellow

# must be admin for inject later, warn now
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) { Write-Host "[!] Tip: re-open PowerShell as Administrator for inject to work." -ForegroundColor Yellow }

New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

# resolve latest release asset url via GitHub API, fallback to fixed file
$AssetUrl = ""
try {
  $rel = Invoke-RestMethod -Uri "https://api.github.com/repos/$Repo/releases/latest" -TimeoutSec 20
  $asset = $rel.assets | Where-Object { $_.name -like "*.zip*" } | Select-Object -First 1
  if ($asset) { $AssetUrl = $asset.browser_download_url }
} catch { Write-Host "[*] GitHub API unreachable, using direct release link" -ForegroundColor DarkGray }

if ([string]::IsNullOrWhiteSpace($AssetUrl)) {
  $AssetUrl = "https://github.com/$Repo/releases/latest/download/$ZipName"
}

$ZipPath = Join-Path $env:TEMP $ZipName
Write-Host "[*] Downloading: $AssetUrl"
Invoke-WebRequest -Uri $AssetUrl -OutFile $ZipPath -UseBasicParsing

Write-Host "[*] Extracting to $InstallDir"
Expand-Archive -Path $ZipPath -DestinationPath $InstallDir -Force
Remove-Item $ZipPath -Force -ErrorAction SilentlyContinue

# desktop shortcut to first exe found
$exe = Get-ChildItem -Path $InstallDir -Filter *.exe -Recurse | Select-Object -First 1
if ($exe) {
  $Wsh = New-Object -ComObject WScript.Shell
  $lnk = $Wsh.CreateShortcut("$env:USERPROFILE\Desktop\SolaraV3.lnk")
  $lnk.TargetPath = $exe.FullName
  $lnk.WorkingDirectory = $exe.DirectoryName
  $lnk.Save()
  Write-Host "[+] Shortcut created: $($exe.FullName)" -ForegroundColor Green
}

# check .NET Desktop Runtime
$dotnet = Get-ChildItem "HKLM:\SOFTWARE\dotnet\Setup\InstalledVersions\x64\sharedfx\Microsoft.WindowsDesktop.App" -ErrorAction SilentlyContinue
if (-not $dotnet) {
  Write-Host "[!] .NET Desktop Runtime x64 NOT found. Install it:" -ForegroundColor Yellow
  Write-Host "    https://dotnet.microsoft.com/download/dotnet/8.0/runtime" -ForegroundColor White
} else { Write-Host "[+] .NET Desktop Runtime found" -ForegroundColor Green }

Write-Host ""
Write-Host "Done. Steps:" -ForegroundColor Cyan
Write-Host " 1. Start Roblox, join game, wait until you can move"
Write-Host " 2. Right-click Solara -> Run as administrator -> Attach (red->green) -> Execute"
Write-Host " 3. Add $InstallDir to Defender exclusions so AV does not delete it"

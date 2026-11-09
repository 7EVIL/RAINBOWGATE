param()
$ErrorActionPreference = 'Stop'
Set-Location 'C:\WORK\RAINBOWGATE'
$pakDir = 'Saved\StagedBuilds\Windows\LUCID\Content\Paks'
if (Test-Path $pakDir) {
  if (Get-Process 'LUCID-Win64-Shipping' -ErrorAction SilentlyContinue) { throw 'Close production game before restaging.' }
  $backup = 'Saved\Backup\PackagedLanguages_' + (Get-Date -Format yyyyMMdd_HHmmss)
  New-Item -ItemType Directory -Path $backup | Out-Null
  Move-Item $pakDir "$backup\PreviousPaks"
}
# BuildCookRun overrides ProjectParams: its CookCultures syntax is plus-separated.
& 'C:\Program Files\Epic Games\UE_5.8\Engine\Build\BatchFiles\RunUAT.bat' BuildCookRun '-project=C:\WORK\RAINBOWGATE\LUCID.uproject' -noP4 -platform=Win64 -clientconfig=Shipping -skipbuild -skipcook -stage -pak -iostore -package -compressed -distribution -prereqs -NoCleanStage -IgnorePaksFromDifferentCookSource '-CookCultures=en+th+zh-Hans' -I18NPreset=All -utf8output -unattended
exit $LASTEXITCODE

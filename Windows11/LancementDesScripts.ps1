# Chemin du script courant
$scriptPath = $MyInvocation.MyCommand.Path
$scriptDirectory = Split-Path -Parent $scriptPath

# Fonction pour exécuter un script avec des privilèges élevés
function Run-WithElevatedPrivileges {
    param (
        [string]$ScriptToRun
    )
    $command = "& '$ScriptToRun'"
    Start-Process powershell.exe -ArgumentList "-NoProfile -NoExit -Command $command" -Verb RunAs
}

# Obtenir tous les scripts .bat et .ps1 dans le répertoire courant sauf ce script
$scripts = Get-ChildItem -Path $scriptDirectory -Filter *.ps1 -Recurse | Where-Object { $_.FullName -ne $scriptPath }
$scripts += Get-ChildItem -Path $scriptDirectory -Filter *.bat -Recurse

# Exécuter chaque script avec des privilèges élevés
foreach ($script in $scripts) {
    Write-Host "Exécution du script : $($script.FullName)"
    Run-WithElevatedPrivileges -ScriptToRun $script.FullName
}

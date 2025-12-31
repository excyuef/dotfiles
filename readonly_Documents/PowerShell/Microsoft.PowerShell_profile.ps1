Import-Module Terminal-Icons
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Set-PSReadLineKeyHandler -Key Ctrl+l -Function ClearScreen



# Linux-like aliases
Set-Alias ls Get-ChildItem
Set-Alias ll "Get-ChildItem -Force -Detail"
Set-Alias cat Get-Content
Set-Alias pwd Get-Location
Set-Alias clear Clear-Host

# Linux-like functions
Function cp { Copy-Item @args }
Function mv { Move-Item @args }
Function rm { Remove-Item @args }
Function touch {
    param([string]$path)
    if (Test-Path $path) { (Get-Item $path).LastWriteTime = Get-Date } 
    else { New-Item -Path $path -ItemType File }
}

Invoke-Expression (&starship init powershell)


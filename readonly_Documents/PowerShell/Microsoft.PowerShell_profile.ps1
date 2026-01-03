Import-Module Terminal-Icons
Import-Module PSReadLine
Invoke-Expression (&starship init powershell)

# =====================================================
# PowerShell Linux-like Final Profile (starship)
# Target: PowerShell 7+
# =====================================================

# -----------------------------
# Safety
# -----------------------------
Set-StrictMode -Version Latest
$ErrorActionPreference = "Continue"

# -----------------------------
# Basic Aliases (Linux habits)
# -----------------------------
Set-Alias clear Clear-Host
Set-Alias pwd Get-Location
Set-Alias which Get-Command

# -----------------------------
# eza (ls replacement)
# -----------------------------
function ls {
    eza
}

function ll {
    eza -lah --icons --git
}

function la {
    eza -a --icons
}

# -----------------------------
# File & text utilities
# -----------------------------
Set-Alias cat bat
Set-Alias grep rg
Set-Alias find fd

function touch {
    param([string]$name)
    New-Item -ItemType File -Name $name -Force | Out-Null
}

function rm {
    param(
        [Parameter(ValueFromRemainingArguments = $true)]
        $args
    )
    Remove-Item @args -Recurse -Force
}

# -----------------------------
# head / tail (Linux style)
# -----------------------------
function head {
    param(
        [int]$n = 10,
        [string]$file
    )
    Get-Content $file -TotalCount $n
}

function tail {
    param(
        [int]$n = 10,
        [string]$file
    )
    Get-Content $file -Tail $n
}

# -----------------------------
# System info
# -----------------------------

function whoami {
    [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
}

# -----------------------------
# cd shortcuts
# -----------------------------
function .. { Set-Location .. }
function ... { Set-Location ../.. }

# -----------------------------
# Git shortcuts
# -----------------------------
function gs  { git status }
function ga  { git add . }
function gc  { git commit }
function gcm { git commit -m }
function gp  { git push }
function gl  { git pull }

# -----------------------------
# PSReadLine (bash-like UX)
# -----------------------------
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Emacs

Set-PSReadLineKeyHandler -Key Ctrl+r `
    -Function ReverseSearchHistory

# -----------------------------
# Environment
# -----------------------------
$env:EDITOR = "nvim"
$env:PAGER  = "less"

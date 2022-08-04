function InstallScoopPackage
{
    Param
    (
         [Parameter(Mandatory=$true, Position=0)]
         [string] $DisplayName,
         [Parameter(Mandatory=$true, Position=1)]
         [string] $PackageName
    )

    Write-Host "${DisplayName} " -NoNewline; Write-Host "[ ]" -ForegroundColor Red -NoNewline
    scoop install $PackageName 6>&1 5>&1 4>&1 3>&1 2>&1 >> "./log.txt"

    if ($?)
    {
        Write-Host "`r${DisplayName} " -NoNewline; Write-Host "[X]" -ForegroundColor Green
    }
    else 
    {
        Write-Host "`nFailed to install ${DisplayName}. See log.txt for details"
        Read-Host
        Exit 1
    }
}


# Add scoop buckets
Write-Host "Buckets: " -NoNewline
Write-Host "Adding..." -NoNewline -ForegroundColor Cyan
Write-Host "`rBuckets: " -NoNewline
scoop bucket add games 6>&1 5>&1 4>&1 3>&1 2>&1 >> "./log.txt"
scoop bucket add extras 6>&1 5>&1 4>&1 3>&1 2>&1 >> "./log.txt"
scoop bucket add versions 6>&1 5>&1 4>&1 3>&1 2>&1 >> "./log.txt"
scoop bucket add java 6>&1 5>&1 4>&1 3>&1 2>&1 >> "./log.txt"
Write-Host "Added    "  -ForegroundColor Green
Write-Host


# Configure scoop
scoop config aria2-warning-enabled false 6>&1 5>&1 4>&1 3>&1 2>&1 >> "./log.txt"
Write-Host "Aria2 warning message: " -NoNewline
Write-Host "Disabled" -ForegroundColor Red
Write-Host


# Install packages
Write-Host "Installing packages..."

# Essential libraries
InstallScoopPackage -DisplayName "Aria2" -PackageName "aria2"

# Essential tools
InstallScoopPackage -DisplayName "7Zip ZSTD" -PackageName "7zip-zstd"
InstallScoopPackage -DisplayName "Ungoogled Chromium" -PackageName "ungoogled-chromium"

# Compilers, interpreters and the like
InstallScoopPackage -DisplayName "NodeJS" -PackageName "nodejs"
InstallScoopPackage -DisplayName "OpenJDK 11" -PackageName "openjdk11"
InstallScoopPackage -DisplayName "Python 2.7" -PackageName "python27"
InstallScoopPackage -DisplayName "Python 3.8" -PackageName "python38"
InstallScoopPackage -DisplayName ".NET 6 SDK" -PackageName "dotnet6-sdk"
InstallScoopPackage -DisplayName "MinGW" -PackageName "mingw"

# Programming tools
InstallScoopPackage -DisplayName "Git" -PackageName "git"
InstallScoopPackage -DisplayName "Powershell Core" -PackageName "pwsh"
InstallScoopPackage -DisplayName "Cmder" -PackageName "cmder"
InstallScoopPackage -DisplayName "VSCodium" -PackageName "vscodium"
InstallScoopPackage -DisplayName "DnSpy" -PackageName "dnspy"
InstallScoopPackage -DisplayName "Ghidra" -PackageName "ghidra"

# Social media and communication
InstallScoopPackage -DisplayName "Discord" -PackageName "discord"
InstallScoopPackage -DisplayName "Element" -PackageName "element"

# Editors and creative
InstallScoopPackage -DisplayName "Shotcut" -PackageName "shotcut"
InstallScoopPackage -DisplayName "GIMP" -PackageName "gimp"
InstallScoopPackage -DisplayName "Blender" -PackageName "blender"

# Media players
InstallScoopPackage -DisplayName "MPC-BE" -PackageName "mpc-be"
InstallScoopPackage -DisplayName "ImageGlass" -PackageName "imageglass"
InstallScoopPackage -DisplayName "AIMP" -PackageName "aimp"

# Data-hoarding tools
InstallScoopPackage -DisplayName "Ripme" -PackageName "ripme"
InstallScoopPackage -DisplayName "Gallery-DL" -PackageName "gallery-dl"

# Gaming
InstallScoopPackage -DisplayName "Steam" -PackageName "steam"
InstallScoopPackage -DisplayName "Playnite" -PackageName "playnite"

# Emulators
InstallScoopPackage -DisplayName "Nester" -PackageName "nester"
InstallScoopPackage -DisplayName "Project64" -PackageName "project64"
InstallScoopPackage -DisplayName "VisualBoyAdvance-M" -PackageName "visualboyadvance-m"
InstallScoopPackage -DisplayName "Dolphin" -PackageName "dolphin"
InstallScoopPackage -DisplayName "MelonDS" -PackageName "melonds"
InstallScoopPackage -DisplayName "Citra" -PackageName "citra"
InstallScoopPackage -DisplayName "Cemu" -PackageName "cemu"
InstallScoopPackage -DisplayName "Yuzu" -PackageName "yuzu"

# Misc
InstallScoopPackage -DisplayName "Rainmeter" -PackageName "rainmeter"
InstallScoopPackage -DisplayName "MegaSync" -PackageName "megasync"
InstallScoopPackage -DisplayName "HWInfo" -PackageName "hwinfo"
InstallScoopPackage -DisplayName "GNUPG" -PackageName "gnupg"
InstallScoopPackage -DisplayName "Monero" -PackageName "monero"
InstallScoopPackage -DisplayName "Flash Player" -PackageName "flashplayer-sa"

Write-Host

# Disable telemetry for installed applications where possible
Write-Host "Disabling application telemetry..."
[System.Environment]::SetEnvironmentVariable('POWERSHELL_TELEMETRY_OPTOUT','1',[System.EnvironmentVariableTarget]::User)
Write-Host "Powershell Core Telemetry: " -NoNewline; Write-Host "Disabled" -ForegroundColor Red

# Patch in static files


# Finish up
scoop cleanup *
scoop reset python

Write-Host "Press enter to continue..."
Read-Host
function InstallGlobalScoopPackage
{
    Param
    (
         [Parameter(Mandatory=$true, Position=0)]
         [string] $DisplayName,
         [Parameter(Mandatory=$true, Position=1)]
         [string] $PackageName
    )

    Write-Host "${DisplayName} " -NoNewline; Write-Host "[ ]" -ForegroundColor Red -NoNewline
    scoop install $PackageName -g 6>&1 5>&1 4>&1 3>&1 2>&1 >> "./log.txt"

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

# Global packages
InstallGlobalScoopPackage -DisplayName "Visual C Redistributables" -PackageName "vcredist"
InstallGlobalScoopPackage -DisplayName "Vulkan" -PackageName "vulkan"
InstallGlobalScoopPackage -DisplayName "OpenSSL" -PackageName "openssl"
InstallGlobalScoopPackage -DisplayName "Aria2" -PackageName "aria2"

Write-Host

# Disable Aria2 warning message
scoop config aria2-warning-enabled false 6>&1 5>&1 4>&1 3>&1 2>&1 >> "./log.txt"
Write-Host "Aria2 warning message: " -NoNewline
Write-Host "Disabled" -ForegroundColor Red
Write-Host


Write-Host "Press enter to continue..."
Read-Host
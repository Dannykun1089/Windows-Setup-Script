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


# If it isn't already, enable TLS 1.2 for secure connection to scoop.sh
# (This modification goes back to normal after the console exits)
if (![System.Net.ServicePointManager]::SecurityProtocol.HasFlag([System.Net.SecurityProtocolType]::Tls12))
{
    Write-Host "Temporarily switching to TLS 1.2 for this script"
    [System.Net.ServicePointManager]::SecurityProtocol += [System.Net.SecurityProtocolType]::Tls12
}

Write-Host "Scoop: " -NoNewline
Write-Host "Installing..." -NoNewline -ForegroundColor Cyan
Write-Host "`rScoop: " -NoNewline
try {
    scoop 6>&1 5>&1 4>&1 3>&1 2>&1 >$null
    Write-Host "Installed    "  -ForegroundColor Green
}
catch {
    Invoke-RestMethod get.scoop.sh | Invoke-Expression 6>&1 5>&1 4>&1 3>&1 2>&1 > "./log.txt"
    Write-Host "Installed    " -ForegroundColor Green
}

# Scoop needs git to add buckets
InstallScoopPackage -DisplayName "Git" -PackageName "git"

# Add scoop buckets
Write-Host "Buckets: " -NoNewline; Write-Host "Adding..." -NoNewline -ForegroundColor Red
scoop bucket add games 6>&1 5>&1 4>&1 3>&1 2>&1 >> "./log.txt"
scoop bucket add extras 6>&1 5>&1 4>&1 3>&1 2>&1 >> "./log.txt"
scoop bucket add versions 6>&1 5>&1 4>&1 3>&1 2>&1 >> "./log.txt"
scoop bucket add java 6>&1 5>&1 4>&1 3>&1 2>&1 >> "./log.txt"
Write-Host "`rBuckets: " -NoNewline; Write-Host "Added    "  -ForegroundColor Green
Write-Host


Write-Host "Press enter to continue..."
Read-Host
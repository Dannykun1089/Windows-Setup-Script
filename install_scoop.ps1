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
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
    Write-Host "Installed    " -ForegroundColor Green
}
Write-Host "Press enter to continue..."
Read-Host
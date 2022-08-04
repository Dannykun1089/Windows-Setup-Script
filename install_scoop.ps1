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
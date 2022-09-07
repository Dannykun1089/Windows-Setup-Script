# Enable script execution for the current user
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# If it isn't already, enable TLS 1.2 for secure connections
# (This modification goes back to normal after the console exits)
if (![System.Net.ServicePointManager]::SecurityProtocol.HasFlag([System.Net.SecurityProtocolType]::Tls12))
{
    [System.Net.ServicePointManager]::SecurityProtocol += [System.Net.SecurityProtocolType]::Tls12
}

# Run the individual setup scripts
Start-Process Powershell.exe -ArgumentList "./install_scoop.ps1" -Wait
Start-Process Powershell.exe -Verb RunAs -ArgumentList "./setup_admin.ps1" -Wait
Start-Process Powershell.exe -ArgumentList "./setup_user.ps1" -Wait

# Reset the execution policy since i dont wanna leave any mess around
Set-ExecutionPolicy -ExecutionPolicy Undefined
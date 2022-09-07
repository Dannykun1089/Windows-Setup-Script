# Run the individual setup scripts
Start-Process Powershell.exe -ArgumentList "./install_scoop.ps1" -Wait
Start-Process Powershell.exe -Verb RunAs -ArgumentList "./setup_admin.ps1" -Wait
Start-Process Powershell.exe -ArgumentList "./setup_user.ps1" -Wait

# Reset the execution policy since i dont wanna leave any mess around
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser
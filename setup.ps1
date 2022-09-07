# Install Scoop for the current user
Start-Process Powershell.exe -ArgumentList "./install_scoop.ps1" -Wait

# Refresh PATH variable 
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# Install global scoop packages
Start-Process Powershell.exe -Verb RunAs -ArgumentList "./setup_admin.ps1" -Wait

# Install user scoop packages
Start-Process Powershell.exe -ArgumentList "./setup_user.ps1" -Wait
# Install Scoop for the current user
Start-Process Powershell.exe -ArgumentList "./install_scoop.ps1" -Wait

# Refresh PATH variable 
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# Install global scoop packages
$admin_setup_script = (Get-Location).ToString() + "/setup_admin.ps1"
Start-Process Powershell.exe -ArgumentList $admin_setup_script -Wait -Verb RunAs

# Install user scoop packages
Start-Process Powershell.exe -ArgumentList "./setup_user.ps1" -Wait
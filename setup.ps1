Start-Process Powershell.exe -Verb RunAs -ArgumentList "./enable_script_execution.ps1"
Start-Process Powershell.exe -ArgumentList "./install_scoop.ps1"
Start-Process Powershell.exe -Verb RunAs -ArgumentList "./setup_admin.ps1"
Start-Process Powershell.exe -ArgumentList "./setup_user.ps1"
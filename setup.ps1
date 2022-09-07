Start-Process Powershell.exe -Verb RunAs -ArgumentList "./enable_script_execution.ps1" -Wait
Start-Process Powershell.exe -ArgumentList "./install_scoop.ps1" -Wait
Start-Process Powershell.exe -Verb RunAs -ArgumentList "./setup_admin.ps1" -Wait
Start-Process Powershell.exe -ArgumentList "./setup_user.ps1" -Wait
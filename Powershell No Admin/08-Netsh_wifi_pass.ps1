netsh wlan show profile |
    Select-String '(?<=All User Profile\s+:\s).+' |
    ForEach-Object {
        $wlan = $_.Matches.Value
        $passw = netsh wlan show profile $wlan key=clear |
            Select-String '(?<=Key Content\s+:\s).+'

        [pscustomobject]@{
            Name     = $wlan
            Password = $passw.Matches.Value
        }
    }

#powershell.exe -ExecutionPolicy Bypass -File "08-Netsh_wifi_pass.ps1"

# Lists all saved Wi-Fi profiles and their passwords.
# No need to run as administrator
netsh wlan show profiles |
  Select-String '(?<=All User Profile\s+:\s).+' |
  ForEach-Object {
      $SSID = $_.Matches.Value
      $passw = netsh wlan show profile name="$SSID" key=clear
      echo "SSID: $SSID"
      echo $passw | Select-String '(Key Content\s+:\s).+'
      echo ""
        }

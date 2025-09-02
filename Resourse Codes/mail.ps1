# PowerShell Script: Send command output via Mailtrap Live SMTP

# ==== CONFIGURATION ====


# ==== COMMAND TO RUN ====
$Command = "whoami"
$Result = Invoke-Expression $Command | Out-String

# ==== Email Body ====
$Body = "Command executed: $Command`n`nOutput:`n$Result"

# Secure password
$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
$Creds = New-Object System.Management.Automation.PSCredential ($Username, $SecurePassword)

# Send email
Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer $SmtpServer -Port $SmtpPort -UseSsl -Credential $Creds

# PowerShell Script: Send command output via Mailtrap Live SMTP

# ==== CONFIGURATION ====
$SmtpServer = "live.smtp.mailtrap.io"   # LIVE SMTP, not sandbox
$SmtpPort   = 587
$Username   = "your_live_username"      # From Mailtrap SMTP credentials
$Password   = "your_live_password"      # From Mailtrap SMTP credentials
$From       = "hello@demomailtrap.co"   # Must match your Mailtrap domain
$To         = "ririyaka@tutamail.com"   # Real recipient
$Subject    = "Command Output Report"

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

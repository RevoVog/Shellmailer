# ==== CONFIGURATION ====

$SmtpServer = $SMTP_SERVER          # LIVE SMTP, not sandbox
$SmtpPort   = $SMTP_PORT            # Typically 587 for TLS
$Username   = $SMTP_USERNAME        # From Mailtrap SMTP credentials
$Password   = $SMTP_PASSWORD        # From Mailtrap SMTP credentials
$From       = $SMTP_FROM            # Must match your Mailtrap domain
$To         = $SMTP_TO              # Real recipient

$Subject    = "Output Report"

$Output = Get-Content "output.txt" -Raw

# Secure password
$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
$Creds = New-Object System.Management.Automation.PSCredential ($Username, $SecurePassword)

# Send email
Send-MailMessage -From $From -To $To -Subject $Subject -Body $Output  -SmtpServer $SmtpServer -Port $SmtpPort -UseSsl -Credential $Creds

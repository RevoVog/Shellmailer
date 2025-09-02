# PowerShell Script: Send command output via Mailtrap Live SMTP

$envVars = Get-Content ".env" | ForEach-Object {
    $parts = $_ -split "="
    if ($parts.Length -eq 2) {
        [System.Environment]::SetEnvironmentVariable($parts[0], $parts[1])
    }
}

# ==== CONFIGURATION ====

$SmtpServer = $SMTP_SERVER          # LIVE SMTP, not sandbox
$SmtpPort   = $SMTP_PORT            # Typically 587 for TLS
$Username   = $SMTP_USERNAME        # From Mailtrap SMTP credentials
$Password   = $SMTP_PASSWORD        # From Mailtrap SMTP credentials
$From       = $SMTP_FROM            # Must match your Mailtrap domain
$To         = $SMTP_TO              # Real recipient

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

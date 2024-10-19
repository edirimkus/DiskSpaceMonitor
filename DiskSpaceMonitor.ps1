# Define parameters
$threshold = 10  # Threshold in percentage
$emailFrom = "your.email@example.com"
$emailTo = "recipient.email@example.com"
$smtpServer = "smtp.example.com"
$smtpPort = 587
$smtpUser = "your.email@example.com"
$smtpPass = "YourPassword"

# Function to check disk space and send email alert
function Check-DiskSpace {
    $drives = Get-PSDrive -PSProvider FileSystem
    foreach ($drive in $drives) {
        $freeSpacePercent = ($drive.Free / $drive.Used) * 100
        if ($freeSpacePercent -lt $threshold) {
            $subject = "Alert: Low Disk Space on $($drive.Name)"
            $body = "The drive $($drive.Name) has less than $threshold% free space remaining."
            Send-MailMessage -From $emailFrom -To $emailTo -Subject $subject -Body $body -SmtpServer $smtpServer -Port $smtpPort -Credential (New-Object PSCredential($smtpUser, (ConvertTo-SecureString $smtpPass -AsPlainText -Force)))
        }
    }
}

# Schedule the function to run daily
$trigger = New-ScheduledTaskTrigger -Daily -At "08:00AM"
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File `"$PSScriptRoot\DiskSpaceMonitor.ps1`""
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "DiskSpaceMonitor" -Description "Monitors disk space and sends email alerts" -User "$env:UserName" -RunLevel Highest -Force

# Run the function
Check-DiskSpace

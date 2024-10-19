# DiskSpaceMonitor

## Description
This PowerShell script monitors disk space on all drives and sends an email alert if the free space falls below a specified threshold. It also schedules the task to run daily.

## Features
- Monitors disk space on all drives.
- Sends email alerts when disk space is low.
- Schedules the script to run daily.

## Prerequisites
- Windows PowerShell
- Administrator privileges
- SMTP server details for sending email alerts

## Installation
1. Customize the email parameters (`$emailFrom`, `$emailTo`, `$smtpServer`, `$smtpPort`, `$smtpUser`, `$smtpPass`) with your own details.
2. Download and save the script as `DiskSpaceMonitor.ps1`.
3. Run the script in PowerShell with administrator privileges to set up the scheduled task.

## Usage
- The script will log CPU and memory usage daily at the specified time.
- Logs are saved in `C:\PerformanceLogs\SystemPerformance.log`.
- It will send an email alert if any drive's free space falls below the specified threshold.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


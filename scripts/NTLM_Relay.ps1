# Define task and schedule parameters
$task = '/c powershell New-PSDrive -Name "Public" -PSProvider "FileSystem" -Root "\\son.goku\Private"'
$repeatInterval = New-TimeSpan -Minutes 5
$taskName = "NTLM_SCRIPT"
$user = "dbz.com\king.yemma"
$password = "Bringmecookies@@@"

# Create scheduled task action, trigger, and settings
$action = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "$task"
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval $repeatInterval
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -RunOnlyIfNetworkAvailable -DontStopOnIdleEnd

# Check if the task already exists, and unregister it if it does
$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName }
if($taskExists) {
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}

# Register the scheduled task
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -User $user -Password $password -Settings $settings

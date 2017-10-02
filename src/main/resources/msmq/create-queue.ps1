[System.Reflection.Assembly]::LoadWithPartialName("System.Messaging")

$queueName = if($deployed.queueName) { $deployed.queueName } else { $deployed.name }

Write-Host "Creating queue [$queueName]"
$queue = [System.Messaging.MessageQueue]::Create("$queueName" )

Write-Host "Setting UseJournalQueue to [$deployed.useJournalQueue]"
$queue.UseJournalQueue = $deployed.useJournalQueue

Write-Host "Setting Allow Permissions."
foreach ( $permission in $deployed.allowPermissions.GetEnumerator() ) {
	$queue.SetPermissions($permission.Name, [System.Messaging.MessageQueueAccessRights] $permission.Value, [System.Messaging.AccessControlEntryType]::Allow)
}
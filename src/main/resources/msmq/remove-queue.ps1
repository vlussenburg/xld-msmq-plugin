[System.Reflection.Assembly]::LoadWithPartialName("System.Messaging")

$queueName = if($deployed.queueName) { $deployed.queueName } else { $deployed.name }

Write-Host "Removing queue [$queueName]"
[System.Messaging.MessageQueue]::Delete("$queueName" )

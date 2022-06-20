# Monitor and report to the Teams channel on various health metrics

$config = (Get-Content .\config.json | ConvertFrom-Json)

$replHealth = Get-VMReplication | Select-Object Name,ReplicationHealth,State,LastReplicationTime | ConvertTo-Json

foreach($replInstance in Get-VMReplication) {
    if ($replInstance.State -ne "Replicating" -or $replInstance.Health -ne "Normal") {
        .\New-AlertToPushover.ps1 -Token $config.PushoverToken -User $config.PushoverUser -Title "VM Replication issue with $($replInstance.VMName)" -Message "VM Replication for $($replInstance.VMName) is in state $($replInstance.State). Replica Server: $($replInstance.ReplicaServerName). Health: $($replInstance.Health)"
    }
}

#.\New-AlertToMicrosoftTeams.ps1 -Text $replHealth -Uri $config.StatusWebHookURI -Proxy $config.Proxy
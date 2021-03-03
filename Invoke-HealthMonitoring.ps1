# Monitor and report to the Teams channel on various health metrics

$config = (Get-Content .\config.json | ConvertFrom-Json)

$replHealth = Get-VMReplication | Select-Object Name,ReplicationHealth | ConvertTo-Csv

.\New-AlertToMicrosoftTeams.ps1 -Text $replHealth -Uri $config.StatusWebHookURI -Proxy $config.Proxy
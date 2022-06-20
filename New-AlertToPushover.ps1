# Requires PowerShell 7 for -Proxy flag to Invoke-RestMethod

[cmdletbinding(SupportsShouldProcess)] 
Param([Parameter(Mandatory)] [string]$Token, [Parameter(Mandatory)] [string]$User, [Parameter(Mandatory)] [string]$Message, [int]$Priority = 0, [string]$Title = "")

$item = @{
    "token"=$Token
    "user"=$User
    "message"=$Message
    "priority"=$Priority
    "title"=$Title
}

$json=($item | ConvertTo-Json)


Invoke-RestMethod -Method post -ContentType 'Application/Json' -Body $json -Uri "https://api.pushover.net/1/messages.json" -TimeoutSec 60
Start-Sleep -Seconds 1
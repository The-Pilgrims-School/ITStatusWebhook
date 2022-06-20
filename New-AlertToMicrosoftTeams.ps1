# Requires PowerShell 7 for -Proxy flag to Invoke-RestMethod

[cmdletbinding(SupportsShouldProcess)] 
Param([Parameter(Mandatory)] [string]$Text, [Parameter(Mandatory)] [string]$Uri)

$item = @{
    "text"=$Text
}

$json=($item | ConvertTo-Json)


Invoke-RestMethod -Method post -ContentType 'Application/Json' -Body $json -Uri $Uri -TimeoutSec 60
Start-Sleep -Seconds 1
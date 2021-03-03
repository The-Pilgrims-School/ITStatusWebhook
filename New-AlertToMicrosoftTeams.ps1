# Requires PowerShell 7 for -Proxy flag to Invoke-RestMethod

[cmdletbinding(SupportsShouldProcess)] 
Param([string]$Text, [string]$Uri, [string]$Proxy)

$item = @{
    "text"=$Text
}

$json=($item | ConvertTo-Json)


Invoke-RestMethod -Method post -ContentType 'Application/Json' -Body $json -Uri $Uri -Proxy $Proxy -TimeoutSec 60
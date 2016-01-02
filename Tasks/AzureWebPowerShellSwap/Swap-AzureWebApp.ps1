[CmdletBinding(DefaultParameterSetName = 'None')]
param
(
    [String] [Parameter(Mandatory = $true)]
    $ConnectedServiceName,

    [String] [Parameter(Mandatory = $true)]
    $WebSiteName,

    [String] [Parameter(Mandatory = $false)]
    $WebSiteLocation,

    [String] [Parameter(Mandatory = $true)]
    $Slot1,

    [String] [Parameter(Mandatory = $false)]
    $Slot2,

    [String] [Parameter(Mandatory = $false)]
    $AdditionalArguments
)

# Import the Task.Common and Task.Internal dll that has all the cmdlets we need for Build
import-module "Microsoft.TeamFoundation.DistributedTask.Task.Internal"
import-module "Microsoft.TeamFoundation.DistributedTask.Task.Common"

# adding System.Web explicitly, since we use http utility
Add-Type -AssemblyName System.Web

Write-Verbose "Entering script Swap-AzureWebApp.ps1"

Write-Host "ConnectedServiceName= $ConnectedServiceName"
Write-Host "WebSiteName= $WebSiteName"
Write-Host "Package= $Package"
Write-Host "Slot1= $Slot1"
Write-Host "Slot2= $Slot2"
Write-Host "AdditionalArguments= $AdditionalArguments"

$azureWebSiteError = $null

#Swap WebApp slots
$azureCommand = "Switch-AzureWebsiteSlot"
$azureCommandArguments = "-Name `"$WebSiteName`" -Force -Slot1 `"$Slot1`" -Slot2 `"$Slot2`" $AdditionalArguments -ErrorVariable publishAzureWebsiteError"
$finalCommand = "$azureCommand $azureCommandArguments"
Write-Host "$finalCommand"
Invoke-Expression -Command $finalCommand

Write-Verbose "Leaving script Swap-AzureWebApp.ps1"
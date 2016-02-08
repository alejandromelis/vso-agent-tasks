param (
    [string]$cwd,
    [string]$msg
)

Write-Verbose 'Entering sample.ps1'
Write-Verbose "cwd = $cwd"
Write-Verbose "msg = $msg"

# Import the Task.Common and Task.Internal dll that has all the cmdlets we need for Build
# import-module "Microsoft.TeamFoundation.DistributedTask.Task.Internal"
# import-module "Microsoft.TeamFoundation.DistributedTask.Task.Common"
# Import the Task.TestResults dll that has the cmdlet we need for publishing results
# import-module "Microsoft.TeamFoundation.DistributedTask.Task.TestResults"

 

# if(!$cwd)
# {
#     throw (Get-LocalizedString -Key "Working directory parameter is not set")
# }
# 
# if(!(Test-Path $cwd -PathType Container))
# {
#     throw ("$cwd does not exist");
# }
# 
# Write-Verbose "Setting working directory to $cwd"
# Set-Location $cwd
# 
# Write-Host $msg

################################################################################
function Get-MsTest
{
	<#
	.SYNOPSIS
		Gets path for latest version of MsTest.exe
	
	.DESCRIPTION
		Gets path for latest version of MsTest.exe
	#>
	
	
	$MsTest = "$(Get-VsCommonTools)..\IDE\MsTest.exe"
	if (Test-Path $MsTest) {$MsTest}
	else {Write-Error "Unable to find MsTest.exe"}
}
################################################################################
function Get-VsCommonTools
{
	<#
	.SYNOPSIS
		Gets path to the current VS common tools
	
	.DESCRIPTION
		Gets path to the current VS common tools. 
		Current list supports VS11 and VS10, you may need to add to this list
		to satisfy your needs.
	#>
	
	$VsCommonToolsPaths = @(@($env:VS140COMNTOOLS,$env:VS120COMNTOOLS,$env:VS110COMNTOOLS,$env:VS100COMNTOOLS) | Where-Object {$_ -ne $null})
	if ($VsCommonToolsPaths.Count -ne 0) {$VsCommonToolsPaths[0]}
	else {Write-Error "Unable to find Visual Studio Common Tool Path."}
}
################################################################################

Write-Host $(Get-MsTest)
[Environment]::SetEnvironmentVariable("Test.Server","http://i2timetableapi-int.azurewebsites.net","User")
$proc = Start-Process $(Get-MsTest) -ArgumentList "/testcontainer:C:\Users\aleja\Source\Workspaces\I2\Dev\I2.Timetable\I2.Timetable.WebTests/OriginsAndDestinations.webtest" -Wait -PassThru

Write-Host $proc.ExitCode

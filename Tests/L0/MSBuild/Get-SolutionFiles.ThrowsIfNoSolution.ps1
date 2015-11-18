[cmdletbinding()]
param()

# Arrange.
. $PSScriptRoot\..\..\lib\Initialize-Test.ps1
. $PSScriptRoot\..\..\..\Tasks\MSBuild\Helpers.ps1
Register-Mock Get-LocalizedString { 'Some error message' }

# Act/Assert.
Assert-Throws { Get-SolutionFiles -Solution '' }

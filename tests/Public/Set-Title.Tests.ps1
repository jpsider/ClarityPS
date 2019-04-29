$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "New-ReportCard function for $script:ModuleName" -Tags Build
{
    It "Should return False if -WhatIf is used." {
        New-ReportCard -WhatIf | Should be $false
    }
    It "Should Return true." {
        New-ReportCard | Should be $true
    }
}

$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-DocumentTitle function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-DocumentTitle -WhatIf -Title "MyDocument" | Should be $false
    }
    It "Should not be null." {
        Add-DocumentTitle -Title "MyDocument" | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-DocumentTitle -Title "MyDocument" | Should be "<h3>MyDocument</h3></br></br>"
    }
    It "Should not Throw" {
        { Add-DocumentTitle -Title "MyDocument" } | Should not Throw
    }
}

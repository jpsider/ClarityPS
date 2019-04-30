$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-HeaderActions function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-HeaderActions -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-HeaderActions | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-HeaderActions -Title MyCard | Should be "<div class='header-actions'><! Start MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Add-HeaderActions | Should be "<div class='header-actions'>"
    }
    It "Should not Throw" {
        { Add-HeaderActions } | Should not Throw
    }
}

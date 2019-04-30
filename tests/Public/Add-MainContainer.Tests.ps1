$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-MainContainer function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-MainContainer -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-MainContainer | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-MainContainer -Title MyCard | Should be "<div class='main-container'><! Start MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Add-MainContainer | Should be "<div class='main-container'>"
    }
    It "Should not Throw" {
        { Add-MainContainer } | Should not Throw
    }
}

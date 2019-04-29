$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-Card function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-Card -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-Card | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-Card -Title MyCard | Should be "<div class='card'><! Start MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Add-Card | Should be "<div class='card'>"
    }
    It "Should not Throw" {
        { Add-Card } | Should not Throw
    }
}

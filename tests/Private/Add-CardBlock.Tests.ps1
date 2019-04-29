$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-CardBlock function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-CardBlock -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-CardBlock | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-CardBlock -Title MyCard | Should be "<div class='card-block'><! Start MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Add-CardBlock | Should be "<div class='card-block'>"
    }
    It "Should not Throw" {
        { Add-CardBlock } | Should not Throw
    }
}

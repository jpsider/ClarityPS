$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-CardTitle function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-CardTitle -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-CardTitle | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-CardTitle -Title MyCard | Should be "<h3 class='card-title'><!-- Start MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Add-CardTitle | Should be "<h3 class='card-title'>"
    }
    It "Should not Throw" {
        { Add-CardTitle } | Should not Throw
    }
}

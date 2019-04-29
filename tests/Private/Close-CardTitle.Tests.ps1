$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-CardTitle function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-CardTitle -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-CardTitle | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-CardTitle -Title MyCard | Should be "</h3><! End MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Close-CardTitle | Should be "</h3>"
    }
    It "Should not Throw" {
        { Close-CardTitle } | Should not Throw
    }
}
$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-Style function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-Style -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-Style | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-Style -Title MyCard | Should be "</style><! End MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Close-Style | Should be "</style>"
    }
    It "Should not Throw" {
        { Close-Style } | Should not Throw
    }
}
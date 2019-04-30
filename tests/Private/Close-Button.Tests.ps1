$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-Button function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-Button -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-Button | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-Button -Title MyCard | Should be "</button><! End MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Close-Button | Should be "</button>"
    }
    It "Should not Throw" {
        { Close-Button } | Should not Throw
    }
}
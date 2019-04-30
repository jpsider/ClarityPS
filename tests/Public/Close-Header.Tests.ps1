$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-Header function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-Header -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-Header | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-Header -Title MyCard | Should be "</header><! End MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Close-Header | Should be "</header>"
    }
    It "Should not Throw" {
        { Close-Header } | Should not Throw
    }
}
$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-Script function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-Script -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-Script | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-Script -Title MyCard | Should be "</script><! End MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Close-Script | Should be "</script>"
    }
    It "Should not Throw" {
        { Close-Script } | Should not Throw
    }
}
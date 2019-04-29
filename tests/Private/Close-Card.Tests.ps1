$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-Card function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-Card -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-Card | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-Card -Title MyCard | Should be "</div><! End MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Close-Card | Should be "</div>"
    }
    It "Should not Throw" {
        { Close-Card } | Should not Throw
    }
}
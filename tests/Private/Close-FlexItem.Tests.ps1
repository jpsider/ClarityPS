$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-FlexItem function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-FlexItem -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-FlexItem | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-FlexItem -Title MyCard | Should be "</div><! End MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Close-FlexItem | Should be "</div>"
    }
    It "Should not Throw" {
        { Close-FlexItem } | Should not Throw
    }
}
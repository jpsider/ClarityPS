$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-FlexContainer function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-FlexContainer -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-FlexContainer | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-FlexContainer -Title MyCard | Should be "<flex-container><!-- Start MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Add-FlexContainer | Should be "<flex-container>"
    }
    It "Should not Throw" {
        { Add-FlexContainer } | Should not Throw
    }
}

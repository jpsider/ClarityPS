$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-FlexItem function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-FlexItem -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-FlexItem | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-FlexItem -Title MyCard | Should be "<div class='flex-item'><!-- Start MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Add-FlexItem | Should be "<div class='flex-item'>"
    }
    It "Should not Throw" {
        { Add-FlexItem } | Should not Throw
    }
}

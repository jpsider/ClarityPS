$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-HeaderAction function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-HeaderAction -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-HeaderAction | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-HeaderAction -Title MyCard | Should be "<div class='header-actions'><!-- Start MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Add-HeaderAction | Should be "<div class='header-actions'>"
    }
    It "Should not Throw" {
        { Add-HeaderAction } | Should not Throw
    }
}

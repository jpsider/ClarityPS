$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-ButtonGroup function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-ButtonGroup -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-ButtonGroup | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-ButtonGroup -Title MyCard | Should be "<div class='btn-group'><!-- Start MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Add-ButtonGroup | Should be "<div class='btn-group'>"
    }
    It "Should not Throw" {
        { Add-ButtonGroup } | Should not Throw
    }
}

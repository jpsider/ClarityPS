$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-HeaderNav function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-HeaderNav -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-HeaderNav | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-HeaderNav -Title MyCard | Should be "<div class='header-nav'><!-- Start MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Add-HeaderNav | Should be "<div class='header-nav'>"
    }
    It "Should not Throw" {
        { Add-HeaderNav } | Should not Throw
    }
}

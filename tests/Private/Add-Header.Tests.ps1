$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-Header function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-Header -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-Header | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-Header -Title MyCard -HeaderOption Header-6 | Should be "<header class='header Header-6'><! Start MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Add-Header | Should be "<header class='header Header-3'>"
    }
    It "Should not Throw" {
        { Add-Header } | Should not Throw
    }
}

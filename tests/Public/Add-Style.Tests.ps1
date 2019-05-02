$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-Style function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-Style -WhatIf -StyleText "Some CSS" | Should be $false
    }
    It "Should not be null." {
        Add-Style -StyleText "Some CSS" | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-Style -Title MyCard -StyleText "Some CSS" | Should be "<style>Some CSS<!-- Start MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Add-Style -StyleText "Some CSS" | Should be "<style>Some CSS"
    }
    It "Should not Throw" {
        { Add-Style -StyleText "Some CSS" } | Should not Throw
    }
}

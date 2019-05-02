$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-HeaderAction function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-HeaderAction -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-HeaderAction | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-HeaderAction -Title MyCard | Should be "</div><!-- End MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Close-HeaderAction | Should be "</div>"
    }
    It "Should not Throw" {
        { Close-HeaderAction } | Should not Throw
    }
}
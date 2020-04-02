$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-Link function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-Link -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-Link | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-Link -Title MyCard | Should be "</a><!-- End MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Close-Link | Should be "</a>"
    }
    It "Should not Throw" {
        { Close-Link } | Should not Throw
    }
}
$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-ClarityCardBody function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-ClarityCardBody -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-ClarityCardBody | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-ClarityCardBody -Title MyCard | Should be "</center><!-- End MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Close-ClarityCardBody | Should be "</center>"
    }
    It "Should not Throw" {
        { Close-ClarityCardBody } | Should not Throw
    }
}
$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-HtmlTitle function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-HtmlTitle -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-HtmlTitle | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-HtmlTitle -Title MyCard | Should be "</title><! End MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Close-HtmlTitle | Should be "</title>"
    }
    It "Should not Throw" {
        { Close-HtmlTitle } | Should not Throw
    }
}
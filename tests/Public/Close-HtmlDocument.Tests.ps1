$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-HtmlDocument function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-HtmlDocument -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-HtmlDocument | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-HtmlDocument -Title MyCard | Should be "</html><! End MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Close-HtmlDocument | Should be "</html>"
    }
    It "Should not Throw" {
        { Close-HtmlDocument } | Should not Throw
    }
}
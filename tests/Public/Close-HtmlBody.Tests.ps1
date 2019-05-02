$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-HtmlBody function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-HtmlBody -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-HtmlBody | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-HtmlBody -Title MyCard | Should be "</body><!-- End MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Close-HtmlBody | Should be "</body>"
    }
    It "Should not Throw" {
        { Close-HtmlBody } | Should not Throw
    }
}
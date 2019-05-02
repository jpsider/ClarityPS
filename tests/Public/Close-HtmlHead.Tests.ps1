$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-HtmlHead function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-HtmlHead -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-HtmlHead | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-HtmlHead -Title MyCard | Should be "</head><!-- End MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Close-HtmlHead | Should be "</head>"
    }
    It "Should not Throw" {
        { Close-HtmlHead } | Should not Throw
    }
}
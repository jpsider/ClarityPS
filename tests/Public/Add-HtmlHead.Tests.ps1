$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-HtmlHead function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-HtmlHead -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-HtmlHead | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-HtmlHead -Title MyCard | Should be "<head><!-- Start MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Add-HtmlHead | Should be "<head>"
    }
    It "Should not Throw" {
        { Add-HtmlHead } | Should not Throw
    }
}

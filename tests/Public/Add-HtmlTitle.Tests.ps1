$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-HtmlTitle function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-HtmlTitle -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-HtmlTitle | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-HtmlTitle -Title MyCard -HtmlTitle "MyHtmlDocument" | Should be "<!-- Start MyCard --><title>MyHtmlDocument"
    }
    It "Should be valid ClarityPS HTML." {
        Add-HtmlTitle -HtmlTitle "MyHtmlDocument" | Should be "<title>MyHtmlDocument"
    }
    It "Should be valid ClarityPS HTML." {
        Add-HtmlTitle | Should be "<title>ClarityPS"
    }
    It "Should not Throw" {
        { Add-HtmlTitle } | Should not Throw
    }
}

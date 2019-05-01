$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "New-HtmlDocument function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        New-HtmlDocument -WhatIf | Should be $false
    }
    It "Should not be null." {
        New-HtmlDocument -Title ClarityPSDocument | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        New-HtmlDocument -Title ClarityPSDocument | Should be "<!DOCTYPE html><html lang='en'><! Start ClarityPSDocument>"
    }
    It "Should be valid ClarityPS HTML." {
        New-HtmlDocument | Should be "<!DOCTYPE html><html lang='en'>"
    }
    It "Should not Throw" {
        { New-HtmlDocument -Title ClarityPSDocument } | Should not Throw
    }
}

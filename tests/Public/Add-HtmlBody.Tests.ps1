$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-HtmlBody function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-HtmlBody -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-HtmlBody | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-HtmlBody -Title MyCard -HtmlBodyOption "onload='set_style_from_cookie()'" | Should be "<body onload='set_style_from_cookie()'><! Start MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Add-HtmlBody -HtmlBodyOption "onload='set_style_from_cookie()'" | Should be "<body onload='set_style_from_cookie()'>"
    }
    It "Should not Throw" {
        { Add-HtmlBody } | Should not Throw
    }
}

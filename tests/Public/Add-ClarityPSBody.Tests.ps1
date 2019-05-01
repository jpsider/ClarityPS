$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

function Add-HtmlBody { }
Describe "Add-ClarityPSBody function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-ClarityPSBody -WhatIf | Should be $false
    }
    It "Should not be null." {
        Mock -CommandName 'Add-HtmlBody' -MockWith {
            return "<body onload='set_style_from_cookie()'>"
        }
        Add-ClarityPSBody | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Mock -CommandName 'Add-HtmlBody' -MockWith {
            return "<body onload='set_style_from_cookie()'><! Start ClarityPSHtmlBody>"
        }
        Add-ClarityPSBody -Title ClarityPSHtmlBody | Should be "<body onload='set_style_from_cookie()'><! Start ClarityPSHtmlBody>"
    }
    It "Should be valid ClarityPS HTML." {
        Mock -CommandName 'Add-HtmlBody' -MockWith {
            return "<body onload='set_style_from_cookie()'>"
        }
        Add-ClarityPSBody | Should be "<body onload='set_style_from_cookie()'>"
    }
    It "Should not Throw" {
        Mock -CommandName 'Add-HtmlBody' -MockWith {
            return "<body onload='set_style_from_cookie()'>"
        }
        { Add-ClarityPSBody } | Should not Throw
    }
    It "Should Throw when Add-HtmlBody fails." {
        Mock -CommandName 'Add-HtmlBody' -MockWith {
            Throw "Add-HtmlBody failed to return data."
        }
        { Add-ClarityPSBody } | Should Throw
    }
}

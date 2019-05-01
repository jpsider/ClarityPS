$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

function Close-FlexContainer { }
function Close-HtmlBody { }
function Close-HtmlDocument { }
Describe "Close-ClarityDocument function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Mock -CommandName 'Close-FlexContainer' -MockWith {
            return "</flex-container><! End FlexContainer>"
        }
        Mock -CommandName 'Close-HtmlBody' -MockWith {
            return "</body><! End Body>"
        }
        Mock -CommandName 'Close-HtmlDocument' -MockWith {
            return "</html><! End ClarityDocument>"
        }
        Close-ClarityDocument -WhatIf | Should be $false
    }
    It "Should not be null." {
        Mock -CommandName 'Close-FlexContainer' -MockWith {
            return "</flex-container><! End FlexContainer>"
        }
        Mock -CommandName 'Close-HtmlBody' -MockWith {
            return "</body><! End Body>"
        }
        Mock -CommandName 'Close-HtmlDocument' -MockWith {
            return "</html><! End ClarityDocument>"
        }
        Close-ClarityDocument | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Mock -CommandName 'Close-FlexContainer' -MockWith {
            return "</flex-container><! End FlexContainer>"
        }
        Mock -CommandName 'Close-HtmlBody' -MockWith {
            return "</body><! End Body>"
        }
        Mock -CommandName 'Close-HtmlDocument' -MockWith {
            return "</html><! End ClarityDocument>"
        }
        Close-ClarityDocument -Title MyCard | Should be "</flex-container><! End FlexContainer></body><! End Body></html><! End ClarityDocument>"
    }
    It "Should not Throw" {
        Mock -CommandName 'Close-FlexContainer' -MockWith {
            return "</flex-container><! End FlexContainer>"
        }
        Mock -CommandName 'Close-HtmlBody' -MockWith {
            return "</body><! End Body>"
        }
        Mock -CommandName 'Close-HtmlDocument' -MockWith {
            return "</html><! End ClarityDocument>"
        }
        { Close-ClarityDocument } | Should not Throw
    }
    It "Should Throw if Close-FlexContainer fails." {
        Mock -CommandName 'Close-FlexContainer' -MockWith {
            Throw "Close-FlexContainer Failed"
        }
        Mock -CommandName 'Close-HtmlBody' -MockWith {
            return "</body>"
        }
        Mock -CommandName 'Close-HtmlDocument' -MockWith {
            return "</html>"
        }
        { Close-ClarityDocument } | Should Throw
    }
    It "Should Throw if Close-HtmlBody fails." {
        Mock -CommandName 'Close-FlexContainer' -MockWith {
            return "</flex-container>"
        }
        Mock -CommandName 'Close-HtmlBody' -MockWith {
            Throw "Close-HtmlBody Failed"
        }
        Mock -CommandName 'Close-HtmlDocument' -MockWith {
            return "</html>"
        }
        { Close-ClarityDocument } | Should Throw
    }
    It "Should Throw if Close-HtmlDocument fails." {
        Mock -CommandName 'Close-FlexContainer' -MockWith {
            return "</flex-container>"
        }
        Mock -CommandName 'Close-HtmlBody' -MockWith {
            return "</body>"
        }
        Mock -CommandName 'Close-HtmlDocument' -MockWith {
            Throw "Close-HtmlDocument Failed"
        }
        { Close-ClarityDocument } | Should Throw
    }
}
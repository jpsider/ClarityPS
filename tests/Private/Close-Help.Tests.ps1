$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-Help function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-Help -WhatIf | Should be $false
    }
    It "Should not be null." {
        Close-Help | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Close-Help -Title MyCard | Should be "<clr-icon shape='cog'></clr-icon></a><!-- End MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Close-Help | Should be "<clr-icon shape='cog'></clr-icon></a>"
    }
    It "Should not Throw" {
        { Close-Help } | Should not Throw
    }
}
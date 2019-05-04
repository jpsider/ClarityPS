$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Close-ClarityCard function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Close-ClarityCard -Title TEST -WhatIf | Should be $false
    }
    It "Should not be Null." {
        Close-ClarityCard -Title TEST | Should not be $null
    }
    It "Should be proper ClarityPS HTML." {
        Close-ClarityCard -Title TEST | Should be "</div></div></div><!-- End TEST Card -->"
    }
}

$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-Branding function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-Branding -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-Branding | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-Branding -Title MyCard | Should be "<div class='branding'><! Start MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Add-Branding | Should be "<div class='branding'>"
    }
    It "Should not Throw" {
        { Add-Branding } | Should not Throw
    }
}

$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-Help function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-Help -Title MyCard -URL "http://invoke-automation.blog" -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-Help -Title MyCard -URL "http://invoke-automation.blog" | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-Help -Title MyCard -URL "http://invoke-automation.blog" | Should be "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'><! Start MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Add-Help -URL "http://invoke-automation.blog" | Should be "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
    }
    It "Should not Throw" {
        { Add-Help -Title MyCard -URL "http://invoke-automation.blog" } | Should not Throw
    }
}

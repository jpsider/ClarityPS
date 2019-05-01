$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-HeaderNavLink function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-HeaderNavLink -WhatIf -LinkTitle ClarityPS -URL "index.html" | Should be $false
    }
    It "Should not be null." {
        Add-HeaderNavLink -LinkTitle ClarityPS -URL "index.html" | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-HeaderNavLink -LinkTitle ClarityPS -Active -URL "index.html" | Should be "<a href='index.html'class='active nav-link nav-text'>ClarityPS"
    }
    It "Should be valid ClarityPS HTML." {
        Add-HeaderNavLink -LinkTitle ClarityPS -URL "index.html" | Should be "<a href='index.html'class='nav-link nav-text'>ClarityPS"
    }
    It "Should not Throw" {
        { Add-HeaderNavLink -LinkTitle ClarityPS -URL "index.html" } | Should not Throw
    }
}

$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-BrandingTitle function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-BrandingTitle -WhatIf -Title MyWebPage | Should be $false
    }
    It "Should not be null." {
        Add-BrandingTitle -Title MyWebPage | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-BrandingTitle -Title MyWebPage -URL "index.html" | Should be "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
    }
    It "Should be valid ClarityPS HTML." {
        Add-BrandingTitle -Title MyWebPage | Should be "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
    }
    It "Should not Throw" {
        { Add-BrandingTitle -Title MyWebPage } | Should not Throw
    }
}

$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-CardFooter function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-CardFooter -Title MyCardFooter -CardFooter "SomeHTML Text" -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-CardFooter -Title MyCardFooter -CardFooter "SomeHTML Text" | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-CardFooter -Title MyCardFooter -CardFooter "SomeHTML Text" | Should be "<!-- Start MyCardFooter -->SomeHTML Text"
    }
    It "Should be valid ClarityPS HTML." {
        Add-CardFooter -CardFooter "SomeHTML Text" | Should be "SomeHTML Text"
    }
    It "Should not Throw" {
        { Add-CardFooter -Title MyCardFooter -CardFooter "SomeHTML Text" } | Should not Throw
    }
}

$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-CardText function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-CardText -Title MyCardText -CardText "<someElement>SomeHTML Text</someElement>" -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-CardText -Title MyCardText -CardText "<someElement>SomeHTML Text</someElement>" | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-CardText -Title MyCardText -CardText "<someElement>SomeHTML Text</someElement>" | Should be "<!-- Start MyCardText --><p class='card-text'><someElement>SomeHTML Text</someElement></p>"
    }
    It "Should be valid ClarityPS HTML." {
        Add-CardText -CardText "<someElement>SomeHTML Text</someElement>" | Should be "<p class='card-text'><someElement>SomeHTML Text</someElement></p>"
    }
    It "Should not Throw" {
        { Add-CardText -Title MyCardText -CardText "<someElement>SomeHTML Text</someElement>" } | Should not Throw
    }
}

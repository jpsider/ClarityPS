$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-CardText function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-CardText -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-CardText | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-CardText -Title MyCard | Should be ""
    }
    It "Should be valid ClarityPS HTML." {
        Add-CardText | Should be ""
    }
    It "Should not Throw" {
        { Add-CardText } | Should not Throw
    }
}

$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-ClarityCardBody function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-ClarityCardBody -WhatIf -CardText MyCardText | Should be $false
    }
    It "Should not be null." {
        Add-ClarityCardBody -CardText MyCardText | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-ClarityCardBody -CardText MyCardText | Should be "<center><p class='card-text'>MyCardText</p>"
    }
    It "Should not Throw" {
        { Add-ClarityCardBody -CardText MyCardText } | Should not Throw
    }
}

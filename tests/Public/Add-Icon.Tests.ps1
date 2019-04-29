$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-Icon function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-Icon -Icon CPU -WhatIf | Should be $false
    }
    It "Should be proper ClarityPS HTML." {
        Add-Icon -Icon CPU | Should not be $null
    }
    It "Should be proper ClarityPS HTML." {
        Add-Icon -Icon CPU -IconSize 36 | Should not be $null
    }
    It "Should be proper ClarityPS HTML." {
        Add-Icon -Icon Memory | Should be "<clr-icon shape='Memory' size='24'></clr-icon>"
    }
    It "Should be proper ClarityPS HTML." {
        Add-Icon -Icon Storage -IconSize 36 | Should be "<clr-icon shape='Storage' size='36'></clr-icon>"
    }
}

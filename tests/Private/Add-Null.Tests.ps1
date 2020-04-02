$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-Null function for $script:ModuleName" -Tags Build {
    It "Should return null." {
        Add-Null | Should be $null
    }
    It "Should return null." {
        Add-Null -WhatIf | Should be $null
    }
}
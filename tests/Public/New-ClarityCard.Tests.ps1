$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"
function Add-Icon { }
function Add-FlexItem { }
Describe "New-ClarityCard function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        New-ClarityCard -Title Storage -Icon Storage -IconSize 24 -WhatIf | Should be $false
    }
    It "Should not be Null." {
        Mock -CommandName "Add-FlexItem" {
            return "div class='flex-item'><!-- Start Storage -->"
        }
        Mock -CommandName "Add-Icon" -MockWith {
            return "<clr-icon shape='Storage' size='25'></clr-icon>"
        }
        New-ClarityCard -Title Storage -Icon Storage -IconSize 25 | Should not be $null
    }
    It "Should be Proper ClarityPS HTML." {
        Mock -CommandName "Add-FlexItem" {
            return "<div class='flex-item'><!-- Start CPU>"
        }
        Mock -CommandName "Add-Icon" -MockWith {
            return "<clr-icon shape='CPU' size='36'></clr-icon>"
        }
        New-ClarityCard -Title CPU -Icon CPU -IconSize 36 | Should be "<div class='flex-item'><!-- Start CPU><div class='card'><div class='card-block'><h3 class='card-title'><clr-icon shape='CPU' size='36'></clr-icon>&nbsp CPU</h3><center>"
    }
    It "Should be Proper ClarityPS HTML." {
        Mock -CommandName "Add-FlexItem" {
            return "<div class='flex-item'><!-- Start Storage -->"
        }
        Mock -CommandName "Add-Icon" -MockWith {
            return "<clr-icon shape='Storage' size='25'></clr-icon>"
        }
        New-ClarityCard -Title Memory | Should be "<div class='flex-item'><!-- Start Storage --><div class='card'><div class='card-block'><h3 class='card-title'>&nbsp Memory</h3><center>"
    }
    It "Should not throw." {
        Mock -CommandName "Add-FlexItem" {
            return "<div class='flex-item'><!-- Start Storage -->"
        }
        { New-ClarityCard -Title Storage } | Should not Throw
    }
    It "Should throw when Add-Icon fails." {
        Mock -CommandName "Add-Icon" -MockWith {
            Throw "Add-Icon - Unable to perform function."
        }
        { New-ClarityCard -Title Storage -Icon Storage } | Should Throw
    }
    It "Should throw when Add-FlexItem fails." {
        Mock -CommandName "Add-FlexItem" -MockWith {
            Throw "Flex-Item - Unable to perform function."
        }
        { New-ClarityCard -Title Storage -Icon Storage } | Should Throw
    }
}

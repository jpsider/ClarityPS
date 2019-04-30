$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-Button function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-Button -Title MyCard -Class btn-success -OnClick '' -ButtonText MyButton -ButtonValue 'Button01' -ID 'thisButton' -Name 'Button001' -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-Button -Title MyCard -Class btn-success -OnClick '' -ButtonText MyButton -ButtonValue 'Button01' -ID 'thisButton' -Name 'Button001' | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-Button -Title MyCard -Class btn-success -OnClick '' -ButtonText MyButton -ButtonValue 'Button01' -ID 'thisButton' -Name 'Button001' | Should be "<button class='btn-success' type='button' name='Button001' value='Button01' id='thisButton'>MyButton<! Start MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Add-Button -Class btn-success -OnClick '' -ButtonText MyButton -ButtonValue 'Button01' -ID 'thisButton' -Name 'Button001' | Should be "<button class='btn-success' type='button' name='Button001' value='Button01' id='thisButton'>MyButton"
    }
    It "Should be valid ClarityPS HTML." {
        Add-Button -Class btn-success -OnClick 'thisclick' -ButtonText MyButton -ButtonValue 'Button01' -ID 'thisButton' -Name 'Button001' | Should be "<button class='btn-success' type='button' name='Button001' value='Button01' id='thisButton' onclick='thisclick'>MyButton"
    }
    It "Should not Throw" {
        { Add-Button -Title MyCard -Class btn-success -OnClick '' -ButtonText MyButton -ButtonValue 'Button01' -ID 'thisButton' -Name 'Button001' } | Should not Throw
    }
}

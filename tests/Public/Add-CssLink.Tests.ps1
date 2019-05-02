$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-CssLink function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-CssLink -WhatIf -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" | Should be $false
    }
    It "Should not be null." {
        Add-CssLink -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-CssLink -Title MyCard -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" | Should be "<link rel='stylesheet' href='http://invoke-automation.blog' title='Invoke-Automation' type='text/css' /><!-- Start MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Add-CssLink -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" | Should be "<link rel='stylesheet' href='http://invoke-automation.blog' title='Invoke-Automation' type='text/css' />"
    }
    It "Should not Throw" {
        { Add-CssLink -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" } | Should not Throw
    }
}

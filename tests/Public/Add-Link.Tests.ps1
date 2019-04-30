$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-Link function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-Link -WhatIf  -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" | Should be $false
    }
    It "Should not be null." {
        Add-Link -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-Link -Title MyCard -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" -NewTab | Should be "<a href='http://invoke-automation.blog' target='_blank'>Invoke-Automation<! Start MyCard>"
    }
    It "Should be valid ClarityPS HTML with new tab." {
        Add-Link -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" -NewTab | Should be "<a href='http://invoke-automation.blog' target='_blank'>Invoke-Automation"
    }
    It "Should be valid ClarityPS HTML, No New Tab." {
        Add-Link -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" | Should be "<a href='http://invoke-automation.blog'>Invoke-Automation"
    }
    It "Should not Throw" {
        { Add-Link -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" } | Should not Throw
    }
}

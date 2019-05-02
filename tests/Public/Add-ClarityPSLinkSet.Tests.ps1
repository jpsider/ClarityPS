$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"
function Get-Module { }
function Get-Content { }
function Add-CssLink { }
$RawReturn = @(
    @{
        path = 'c:\someModulePath'
    }               
)
$ReturnJson = $RawReturn | ConvertTo-Json
$ReturnData = $ReturnJson | convertfrom-json
Describe "Add-ClarityPSLinkSet function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-ClarityPSLinkSet -WhatIf | Should be $false
    }
    It "Should not be null." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $ReturnJson
        }
        Mock -CommandName 'Add-CssLink' -MockWith {
            return "<link rel='stylesheet' href='http://invoke-automation.blog' title='Invoke-Automation type='text/css' />"
        }
        Add-ClarityPSLinkSet | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $ReturnJson
        }
        Mock -CommandName 'Add-CssLink' -MockWith {
            return "<link rel='stylesheet' href='http://invoke-automation.blog' title='Invoke-Automation type='text/css' />"
        }
        Add-ClarityPSLinkSet -Title MyCard | Should be "<link rel='stylesheet' href='http://invoke-automation.blog' title='Invoke-Automation type='text/css' />"
    }
    It "Should not Throw" {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $ReturnJson
        }
        Mock -CommandName 'Add-CssLink' -MockWith {
            return "<link rel='stylesheet' href='http://invoke-automation.blog' title='Invoke-Automation type='text/css' />"
        }
        { Add-ClarityPSLinkSet } | Should not Throw
    }
    It "Should Throw When Get-Module Fails" {
        Mock -CommandName 'Get-Module' -MockWith {
            Throw "Get-Module Failed"
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $ReturnJson
        }
        Mock -CommandName 'Add-CssLink' -MockWith {
            return "<link rel='stylesheet' href='http://invoke-automation.blog' title='Invoke-Automation type='text/css' />"
        }
        { Add-ClarityPSLinkSet } | Should Throw
    }
    It "Should Throw When Get-Content Fails" {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            Throw "Get-Content Failed"
        }
        Mock -CommandName 'Add-CssLink' -MockWith {
            return "<link rel='stylesheet' href='http://invoke-automation.blog' title='Invoke-Automation type='text/css' />"
        }
        { Add-ClarityPSLinkSet } | Should Throw
    }
    It "Should Throw When Add-CssLink Fails" {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $ReturnJson
        }
        Mock -CommandName 'Add-CssLink' -MockWith {
            Throw "Add-CssLink Failed."
        }
        { Add-ClarityPSLinkSet } | Should Throw
    }
}

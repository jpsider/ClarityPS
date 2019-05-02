$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

function Get-Module { }
function Get-Content { }
function Add-Style { }
function Close-Style { }
$RawReturn = @(
    @{
        path = 'c:\someModulePath'
    }               
)
$ReturnJson = $RawReturn | ConvertTo-Json
$ReturnData = $ReturnJson | convertfrom-json
Describe "Add-ClarityPSStyleSet function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-ClarityPSStyleSet -WhatIf | Should be $false
    }
    It "Should not be null." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return "CssText; Looks Great!"
        }
        Mock -CommandName 'Add-Style' -MockWith {
            return "<style>CssText; Looks Great!"
        }
        Mock -CommandName 'Add-Style' -MockWith {
            return "</style>"
        }
        Add-ClarityPSStyleSet | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return "CssText; Looks Great!"
        }
        Mock -CommandName 'Add-Style' -MockWith {
            return "<style>CssText; Looks Great!"
        }
        Mock -CommandName 'Close-Style' -MockWith {
            return "</style>"
        }
        Add-ClarityPSStyleSet -Title MyCard | Should be "<style>CssText; Looks Great!</style>"
    }
    It "Should not Throw" {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return "CssText; Looks Great!"
        }
        Mock -CommandName 'Add-Style' -MockWith {
            return "<style>CssText; Looks Great!"
        }
        Mock -CommandName 'Close-Style' -MockWith {
            return "</style>"
        }
        { Add-ClarityPSStyleSet } | Should not Throw
    }
    It "Should Throw when Get-Module fails" {
        Mock -CommandName 'Get-Module' -MockWith {
            Throw "Get-Module Failed."
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return "CssText; Looks Great!"
        }
        Mock -CommandName 'Add-Style' -MockWith {
            return "<style>CssText; Looks Great!</style>"
        }
        Mock -CommandName 'Close-Style' -MockWith {
            return "</style>"
        }
        { Add-ClarityPSStyleSet } | Should Throw
    }
    It "Should Throw When Get-Content Fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            Throw "Get-Content Failed."
        }
        Mock -CommandName 'Add-Style' -MockWith {
            return "<style>CssText; Looks Great!"
        }
        Mock -CommandName 'Close-Style' -MockWith {
            return "</style>"
        }
        { Add-ClarityPSStyleSet } | Should Throw
    }
    It "Should Throw when Add-Style Fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return "CssText; Looks Great!"
        }
        Mock -CommandName 'Add-Style' -MockWith {
            Throw "Add-Style Fails."
        }
        Mock -CommandName 'Close-Style' -MockWith {
            return "</style>"
        }
        { Add-ClarityPSStyleSet } | Should Throw
    }
    It "Should Throw when Close-Style Fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return "CssText; Looks Great!"
        }
        Mock -CommandName 'Add-Style' -MockWith {
            return "<style>CssText; Looks Great!"
        }
        Mock -CommandName 'Close-Style' -MockWith {
            Throw "Add-Style Fails"
        }
        { Add-ClarityPSStyleSet } | Should Throw
    }
}

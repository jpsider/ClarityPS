$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"
function Get-Module { }
function Get-Content { }
function Add-Script { }
$RawReturn = @(
    @{
        path = 'c:\someModulePath'
    }               
)
$ReturnJson = $RawReturn | ConvertTo-Json
$ReturnData = $ReturnJson | convertfrom-json
$cookieData = "Lots of JavaScript"
$AddScriptText = "<script>Lots of JavaScript<!-- Start ClarityCookieMgmtScript -->"
Describe "Add-ClarityPSCookie function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $CookieData
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return $AddScriptText
        }
        Add-ClarityPSCookie -WhatIf | Should be $false
    }
    It "Should not be null." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $CookieData
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return $AddScriptText
        }
        Add-ClarityPSCookie | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $CookieData
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return $AddScriptText
        }
        Add-ClarityPSCookie -Title ClarityCookieMgmtScript | Should be "<script>Lots of JavaScript<!-- Start ClarityCookieMgmtScript -->"
    }
    It "Should be valid ClarityPS HTML." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $CookieData
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return $AddScriptText
        }
        Add-ClarityPSCookie | Should be "<script>Lots of JavaScript<!-- Start ClarityCookieMgmtScript -->"
    }
    It "Should not Throw" {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $CookieData
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return $AddScriptText
        }
        { Add-ClarityPSCookie } | Should not Throw
    }
    It "Should Throw if Get-Module fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            Throw "Get-Mdoule failed"
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $CookieData
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return $AddScriptText
        }
        { Add-ClarityPSCookie } | Should Throw
    }
    It "Should Throw if Get-Content fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            Throw "Get-Content Failed"
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return $AddScriptText
        }
        { Add-ClarityPSCookie } | Should Throw
    }
    It "Should Throw if Add-Script fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $CookieData
        }
        Mock -CommandName 'Add-Script' -MockWith {
            Throw "Add-Script Failed"
        }
        { Add-ClarityPSCookie } | Should Throw
    }
}

$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

function Get-Module { }
function Get-Content { }
function Add-Script { }
function Close-Script { }
$RawReturn = @(
    @{
        path = 'c:\someModulePath'
    }               
)
$ReturnJson = $RawReturn | ConvertTo-Json
$ReturnData = $ReturnJson | convertfrom-json
Describe "Add-ClarityPSIconSet function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-ClarityPSIconSet -WhatIf | Should be $false
    }
    It "Should not be null." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return "JavaScript Magic"
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return "<script>JavaScript Magic"
        }
        Mock -CommandName 'Close-Script' -MockWith {
            return "</script>"
        }
        Add-ClarityPSIconSet | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return "JavaScript Magic"
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return "<script>JavaScript Magic"
        }
        Mock -CommandName 'Close-Script' -MockWith {
            return "</script>"
        }
        Add-ClarityPSIconSet -Title MyCard | Should be "<script>JavaScript Magic</script>"
    }
    It "Should not Throw" {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return "JavaScript Magic"
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return "<script>JavaScript Magic"
        }
        Mock -CommandName 'Close-Script' -MockWith {
            return "</script>"
        }
        { Add-ClarityPSIconSet } | Should not Throw
    }
    It "Should Throw When Get-Module Fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            Throw "get-Module Failed"
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return "JavaScript Magic"
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return "<script>JavaScript Magic"
        }
        Mock -CommandName 'Close-Script' -MockWith {
            return "</script>"
        }
        { Add-ClarityPSIconSet } | Should Throw
    }
    It "Should Throw When Get-Content Fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            Throw "Get-Content Failed."
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return "<script>JavaScript Magic"
        }
        Mock -CommandName 'Close-Script' -MockWith {
            return "</script>"
        }
        { Add-ClarityPSIconSet } | Should Throw
    }
    It "Should Throw When Add-Script Fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return "JavaScript Magic"
        }
        Mock -CommandName 'Add-Script' -MockWith {
            Throw "Add-Script Failed."
        }
        Mock -CommandName 'Close-Script' -MockWith {
            return "</script>"
        }
        { Add-ClarityPSIconSet } | Should Throw
    }
    It "Should Throw When Close-Script Fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return "JavaScript Magic"
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return "<script>JavaScript Magic"
        }
        Mock -CommandName 'Close-Script' -MockWith {
            Throw "Close-Script Failed."
        }
        { Add-ClarityPSIconSet } | Should Throw
    }
}

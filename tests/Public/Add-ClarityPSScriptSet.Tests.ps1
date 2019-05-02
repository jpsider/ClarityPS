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
Describe "Add-ClarityPSScriptSet function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-ClarityPSScriptSet -WhatIf | Should be $false
    }
    It "Should not be null." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $ReturnJson
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return "<script>Several Scriptblocks for JavaScript imports"
        }
        Mock -CommandName 'Close-Script' -MockWith {
            return "</script>"
        }
        Add-ClarityPSScriptSet | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $ReturnJson
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return "<script>Several Scriptblocks for JavaScript imports"
        }
        Mock -CommandName 'Close-Script' -MockWith {
            return "</script>"
        }
        Add-ClarityPSScriptSet -Title MyCard | Should be "<script>Several Scriptblocks for JavaScript imports</script>"
    }
    It "Should not Throw" {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $ReturnJson
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return "<script>Several Scriptblocks for JavaScript imports"
        }
        Mock -CommandName 'Close-Script' -MockWith {
            return "</script>"
        }
        { Add-ClarityPSScriptSet } | Should not Throw
    }
    It "Should Throw when Get-Module Fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            Throw "Get-Module Failed."
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $ReturnJson
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return "<script>Several Scriptblocks for JavaScript imports"
        }
        Mock -CommandName 'Close-Script' -MockWith {
            return "</script>"
        }
        { Add-ClarityPSScriptSet } | Should Throw
    }
    It "Should Throw when Get-Content Fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            Throw "Get-Content Failed."
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return "<script>Several Scriptblocks for JavaScript imports"
        }
        Mock -CommandName 'Close-Script' -MockWith {
            return "</script>"
        }
        { Add-ClarityPSScriptSet } | Should Throw
    }
    It "Should Throw when Add-Script Fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $ReturnJson
        }
        Mock -CommandName 'Add-Script' -MockWith {
            Throw "Add-Script Failed"
        }
        Mock -CommandName 'Close-Script' -MockWith {
            return "</script>"
        }
        { Add-ClarityPSScriptSet } | Should Throw
    }
    It "Should Throw when Close-Script Fails." {
        Mock -CommandName 'Get-Module' -MockWith {
            return $ReturnData
        }
        Mock -CommandName 'Get-Content' -MockWith {
            return $ReturnJson
        }
        Mock -CommandName 'Add-Script' -MockWith {
            return "<script>Several Scriptblocks for JavaScript imports"
        }
        Mock -CommandName 'Close-Script' -MockWith {
            Throw "Close-Script Failed."
        }
        { Add-ClarityPSScriptSet } | Should Throw
    }
}

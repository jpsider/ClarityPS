$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-Script function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-Script -Title MyCard -ScriptText "Some JavaScript" -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-Script -Title MyCard -ScriptText "Some JavaScript" | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-Script -Title MyCard -ScriptText "Some JavaScript" | Should be "<script>Some JavaScript<!-- Start MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Add-Script -ScriptText "Some JavaScript" | Should be "<script>Some JavaScript"
    }
    It "Should not Throw" {
        { Add-Script -Title MyCard -ScriptText "Some JavaScript" } | Should not Throw
    }
}

$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-ScriptLink function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-ScriptLink -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-ScriptLink | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-ScriptLink -Title MyCard -SourceLink "https://unpkg.com/clarity-icons/clarity-icons.min.js" | Should be "<script src='https://unpkg.com/clarity-icons/clarity-icons.min.js'><!-- Start MyCard -->"
    }
    It "Should be valid ClarityPS HTML." {
        Add-ScriptLink -SourceLink "https://unpkg.com/clarity-icons/clarity-icons.min.js" | Should be "<script src='https://unpkg.com/clarity-icons/clarity-icons.min.js'>"
    }
    It "Should not Throw" {
        { Add-ScriptLink } | Should not Throw
    }
}

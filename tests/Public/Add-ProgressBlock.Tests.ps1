$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Add-ProgressBlock function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-ProgressBlock -Title MyCard -Class "progress success" -Value "29" -Max "100" -WhatIf | Should be $false
    }
    It "Should not be null." {
        Add-ProgressBlock -Title MyCard -Class "progress success" -Value "29" -Max "100" | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Add-ProgressBlock -Title MyCard -Class "progress success" -Value "29" -Max "100" | Should be "<div class='progress-block'><div class='progress success'><progress value='29' max='100' data-displayval='29%'></progress></div></div><! Start MyCard>"
    }
    It "Should be valid ClarityPS HTML." {
        Add-ProgressBlock -Class "progress success" -Value "29" -Max "100" | Should be "<div class='progress-block'><div class='progress success'><progress value='29' max='100' data-displayval='29%'></progress></div></div>"
    }
    It "Should not Throw" {
        { Add-ProgressBlock -Title MyCard -Class "progress success" -Value "29" -Max "100" } | Should not Throw
    }
}

$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

function Add-HtmlHead { }
function Add-ClarityPSLinkSet { }
function Add-ClarityPSScriptSet { }
function Add-ClarityPSStyleSet { }
function Add-ClarityIconSet { }
function Add-HtmlTitle { }
function Close-HtmlHead { }

Describe "Add-ClarityPSHeadSet function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Mock -CommandName 'Add-HtmlHead' -MockWith {
            return "<head>"
        }
        Mock -CommandName 'Add-ClarityPSLinkSet' -MockWith {
            return "<link src='somelink' />"
        }
        Mock -CommandName 'Add-ClarityPSScriptSet' -MockWith {
            return "<script>someScript</script>"
        }
        Mock -CommandName 'Add-ClarityPSStyleSet' -MockWith {
            return "<style>Fancy Style</style>"
        }
        Mock -CommandName 'Add-ClarityIconSet' -MockWith {
            return "<script>ForIcons</script>"
        }
        Mock -CommandName 'Add-HtmlTitle' -MockWith {
            return "<h3>FancyTitle</h3></br></br>"
        }
        Mock -CommandName 'Close-HtmlHead' -MockWith {
            return "</head>"
        }
        Add-ClarityPSHeadSet -WhatIf | Should be $false
    }
    It "Should not be null." {
        Mock -CommandName 'Add-HtmlHead' -MockWith {
            return "<head>"
        }
        Mock -CommandName 'Add-ClarityPSLinkSet' -MockWith {
            return "<link src='somelink' />"
        }
        Mock -CommandName 'Add-ClarityPSScriptSet' -MockWith {
            return "<script>someScript</script>"
        }
        Mock -CommandName 'Add-ClarityPSStyleSet' -MockWith {
            return "<style>Fancy Style</style>"
        }
        Mock -CommandName 'Add-ClarityIconSet' -MockWith {
            return "<script>ForIcons</script>"
        }
        Mock -CommandName 'Add-HtmlTitle' -MockWith {
            return "<h3>FancyTitle</h3></br></br>"
        }
        Mock -CommandName 'Close-HtmlHead' -MockWith {
            return "</head>"
        }
        Add-ClarityPSHeadSet | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Mock -CommandName 'Add-HtmlHead' -MockWith {
            return "<head>"
        }
        Mock -CommandName 'Add-ClarityPSLinkSet' -MockWith {
            return "<link src='somelink' />"
        }
        Mock -CommandName 'Add-ClarityPSScriptSet' -MockWith {
            return "<script>someScript</script>"
        }
        Mock -CommandName 'Add-ClarityPSStyleSet' -MockWith {
            return "<style>Fancy Style</style>"
        }
        Mock -CommandName 'Add-ClarityIconSet' -MockWith {
            return "<script>ForIcons</script>"
        }
        Mock -CommandName 'Add-HtmlTitle' -MockWith {
            return "<h3>FancyTitle</h3></br></br>"
        }
        Mock -CommandName 'Close-HtmlHead' -MockWith {
            return "</head>"
        }
        Add-ClarityPSHeadSet -Title MyCard | Should be "<head><link src='somelink' /><script>someScript</script><style>Fancy Style</style><script>ForIcons</script><h3>FancyTitle</h3></br></br></head>"
    }
    It "Should not Throw" {
        Mock -CommandName 'Add-HtmlHead' -MockWith {
            return "<head>"
        }
        Mock -CommandName 'Add-ClarityPSLinkSet' -MockWith {
            return "<link src='somelink' />"
        }
        Mock -CommandName 'Add-ClarityPSScriptSet' -MockWith {
            return "<script>someScript</script>"
        }
        Mock -CommandName 'Add-ClarityPSStyleSet' -MockWith {
            return "<style>Fancy Style</style>"
        }
        Mock -CommandName 'Add-ClarityIconSet' -MockWith {
            return "<script>ForIcons</script>"
        }
        Mock -CommandName 'Add-HtmlTitle' -MockWith {
            return "<h3>FancyTitle</h3></br></br>"
        }
        Mock -CommandName 'Close-HtmlHead' -MockWith {
            return "</head>"
        }
        { Add-ClarityPSHeadSet } | Should not Throw
    }
    It "Should Throw when Add-HtmlHead Fails." {
        Mock -CommandName 'Add-HtmlHead' -MockWith {
            Throw "Add-HtmlHead Failed"
        }
        Mock -CommandName 'Add-ClarityPSLinkSet' -MockWith {
            return "<link src='somelink' />"
        }
        Mock -CommandName 'Add-ClarityPSScriptSet' -MockWith {
            return "<script>someScript</script>"
        }
        Mock -CommandName 'Add-ClarityPSStyleSet' -MockWith {
            return "<style>Fancy Style</style>"
        }
        Mock -CommandName 'Add-ClarityIconSet' -MockWith {
            return "<script>ForIcons</script>"
        }
        Mock -CommandName 'Add-HtmlTitle' -MockWith {
            return "<h3>FancyTitle</h3></br></br>"
        }
        Mock -CommandName 'Close-HtmlHead' -MockWith {
            return "</head>"
        }
        { Add-ClarityPSHeadSet } | Should Throw
    }
    It "Should Throw when Add-ClarityPSLinkSet Fails." {
        Mock -CommandName 'Add-HtmlHead' -MockWith {
            return "<head>"
        }
        Mock -CommandName 'Add-ClarityPSLinkSet' -MockWith {
            Throw "Add-ClarityPSLinkSet failed"
        }
        Mock -CommandName 'Add-ClarityPSScriptSet' -MockWith {
            return "<script>someScript</script>"
        }
        Mock -CommandName 'Add-ClarityPSStyleSet' -MockWith {
            return "<style>Fancy Style</style>"
        }
        Mock -CommandName 'Add-ClarityIconSet' -MockWith {
            return "<script>ForIcons</script>"
        }
        Mock -CommandName 'Add-HtmlTitle' -MockWith {
            return "<h3>FancyTitle</h3></br></br>"
        }
        Mock -CommandName 'Close-HtmlHead' -MockWith {
            return "</head>"
        }
        { Add-ClarityPSHeadSet } | Should Throw
    }
    It "Should Throw when Add-ClarityPSScriptSet Fails." {
        Mock -CommandName 'Add-HtmlHead' -MockWith {
            return "<head>"
        }
        Mock -CommandName 'Add-ClarityPSLinkSet' -MockWith {
            return "<link src='somelink' />"
        }
        Mock -CommandName 'Add-ClarityPSScriptSet' -MockWith {
            Throw "Add-ClarityPSScriptSet failed"
        }
        Mock -CommandName 'Add-ClarityPSStyleSet' -MockWith {
            return "<style>Fancy Style</style>"
        }
        Mock -CommandName 'Add-ClarityIconSet' -MockWith {
            return "<script>ForIcons</script>"
        }
        Mock -CommandName 'Add-HtmlTitle' -MockWith {
            return "<h3>FancyTitle</h3></br></br>"
        }
        Mock -CommandName 'Close-HtmlHead' -MockWith {
            return "</head>"
        }
        { Add-ClarityPSHeadSet } | Should Throw
    }
    It "Should Throw when Add-ClarityPSStyleSet Fails." {
        Mock -CommandName 'Add-HtmlHead' -MockWith {
            return "<head>"
        }
        Mock -CommandName 'Add-ClarityPSLinkSet' -MockWith {
            return "<link src='somelink' />"
        }
        Mock -CommandName 'Add-ClarityPSScriptSet' -MockWith {
            return "<script>someScript</script>"
        }
        Mock -CommandName 'Add-ClarityPSStyleSet' -MockWith {
            Throw "Add-ClarityPSScriptStyleSet failed."
        }
        Mock -CommandName 'Add-ClarityIconSet' -MockWith {
            return "<script>ForIcons</script>"
        }
        Mock -CommandName 'Add-HtmlTitle' -MockWith {
            return "<h3>FancyTitle</h3></br></br>"
        }
        Mock -CommandName 'Close-HtmlHead' -MockWith {
            return "</head>"
        }
        { Add-ClarityPSHeadSet } | Should Throw
    }
    It "Should Throw when Add-ClarityIconSet Fails." {
        Mock -CommandName 'Add-HtmlHead' -MockWith {
            return "<head>"
        }
        Mock -CommandName 'Add-ClarityPSLinkSet' -MockWith {
            return "<link src='somelink' />"
        }
        Mock -CommandName 'Add-ClarityPSScriptSet' -MockWith {
            return "<script>someScript</script>"
        }
        Mock -CommandName 'Add-ClarityPSStyleSet' -MockWith {
            return "<style>Fancy Style</style>"
        }
        Mock -CommandName 'Add-ClarityIconSet' -MockWith {
            Throw "Add-ClarityIconSet Failed"
        }
        Mock -CommandName 'Add-HtmlTitle' -MockWith {
            return "<h3>FancyTitle</h3></br></br>"
        }
        Mock -CommandName 'Close-HtmlHead' -MockWith {
            return "</head>"
        }
        { Add-ClarityPSHeadSet } | Should Throw
    }
    It "Should Throw when Add-HtmlTitle Fails." {
        Mock -CommandName 'Add-HtmlHead' -MockWith {
            return "<head>"
        }
        Mock -CommandName 'Add-ClarityPSLinkSet' -MockWith {
            return "<link src='somelink' />"
        }
        Mock -CommandName 'Add-ClarityPSScriptSet' -MockWith {
            return "<script>someScript</script>"
        }
        Mock -CommandName 'Add-ClarityPSStyleSet' -MockWith {
            return "<style>Fancy Style</style>"
        }
        Mock -CommandName 'Add-ClarityIconSet' -MockWith {
            return "<script>ForIcons</script>"
        }
        Mock -CommandName 'Add-HtmlTitle' -MockWith {
            Throw "Add-HtmlTitle failed."
        }
        Mock -CommandName 'Close-HtmlHead' -MockWith {
            return "</head>"
        }
        { Add-ClarityPSHeadSet } | Should Throw
    }
    It "Should Throw when Close-HtmlHead Fails." {
        Mock -CommandName 'Add-HtmlHead' -MockWith {
            return "<head>"
        }
        Mock -CommandName 'Add-ClarityPSLinkSet' -MockWith {
            return "<link src='somelink' />"
        }
        Mock -CommandName 'Add-ClarityPSScriptSet' -MockWith {
            return "<script>someScript</script>"
        }
        Mock -CommandName 'Add-ClarityPSStyleSet' -MockWith {
            return "<style>Fancy Style</style>"
        }
        Mock -CommandName 'Add-ClarityIconSet' -MockWith {
            return "<script>ForIcons</script>"
        }
        Mock -CommandName 'Add-HtmlTitle' -MockWith {
            return "<h3>FancyTitle</h3></br></br>"
        }
        Mock -CommandName 'Close-HtmlHead' -MockWith {
            Throw "Close-HtmlHead Failed"
        }
        { Add-ClarityPSHeadSet } | Should Throw
    }
}

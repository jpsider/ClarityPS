$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

function New-HtmlDocument { }
function Add-ClarityPSHeadSet { }
function Add-ClarityPSBody { }
function Add-MainContainer { }
function Add-ClarityPSHeader { }
function Add-DocumentTitle { }
function Add-FlexContainer { }
Describe "New-ClarityDocument function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Mock -CommandName New-HtmlDocument -MockWith {
            return "<!DOCTYPE html><html lang='en'>"
        }
        Mock -CommandName Add-ClarityPSHeadSet -MockWith {
            return "<head>Lots of Head text</head>"
        }
        Mock -CommandName Add-ClarityPSBody -MockWith {
            return "<body onload='set_style_from_cookie()'>"
        }
        Mock -CommandName Add-MainContainer -MockWith {
            return "<div class='main-container'><!-- Start MainContainer -->"
        }
        Mock -CommandName Add-ClarityPSHeader -MockWith {
            return "<header>Lots of Header Text></Header>"
        }
        Mock -CommandName Add-DocumentTitle -MockWith {
            return "<h3>NewClarityDoc</h3></br></br>"
        }
        Mock -CommandName Add-FlexContainer -MockWith {
            return "<flex-container>"
        }
        New-ClarityDocument -WhatIf -Title "NewClarityDoc" | Should be $false
    }
    It "Should not be null." {
        Mock -CommandName New-HtmlDocument -MockWith {
            return "<!DOCTYPE html><html lang='en'>"
        }
        Mock -CommandName Add-ClarityPSHeadSet -MockWith {
            return "<head>Lots of Head text</head>"
        }
        Mock -CommandName Add-ClarityPSBody -MockWith {
            return "<body onload='set_style_from_cookie()'>"
        }
        Mock -CommandName Add-MainContainer -MockWith {
            return "<div class='main-container'><!-- Start MainContainer -->"
        }
        Mock -CommandName Add-ClarityPSHeader -MockWith {
            return "<header>Lots of Header Text></Header>"
        }
        Mock -CommandName Add-DocumentTitle -MockWith {
            return "<h3>NewClarityDoc</h3></br></br>"
        }
        Mock -CommandName Add-FlexContainer -MockWith {
            return "<flex-container>"
        }
        New-ClarityDocument -WhatIf -Title "NewClarityDoc" | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Mock -CommandName New-HtmlDocument -MockWith {
            return "<!DOCTYPE html><html lang='en'>"
        }
        Mock -CommandName Add-ClarityPSHeadSet -MockWith {
            return "<head>Lots of Head text</head>"
        }
        Mock -CommandName Add-ClarityPSBody -MockWith {
            return "<body onload='set_style_from_cookie()'>"
        }
        Mock -CommandName Add-MainContainer -MockWith {
            return "<div class='main-container'><!-- Start MainContainer -->"
        }
        Mock -CommandName Add-ClarityPSHeader -MockWith {
            return "<header>Lots of Header Text></Header>"
        }
        Mock -CommandName Add-DocumentTitle -MockWith {
            return "<h3>NewClarityDoc</h3></br></br>"
        }
        Mock -CommandName Add-FlexContainer -MockWith {
            return "<flex-container>"
        }
        New-ClarityDocument -Title "NewClarityDoc" | Should be "<!DOCTYPE html><html lang='en'><head>Lots of Head text</head><body onload='set_style_from_cookie()'><div class='main-container'><!-- Start MainContainer --><header>Lots of Header Text></Header><h3>NewClarityDoc</h3></br></br><flex-container>"
    }
    It "Should not Throw" {
        Mock -CommandName New-HtmlDocument -MockWith {
            return "<!DOCTYPE html><html lang='en'>"
        }
        Mock -CommandName Add-ClarityPSHeadSet -MockWith {
            return "<head>Lots of Head text</head>"
        }
        Mock -CommandName Add-ClarityPSBody -MockWith {
            return "<body onload='set_style_from_cookie()'>"
        }
        Mock -CommandName Add-MainContainer -MockWith {
            return "<div class='main-container'><!-- Start MainContainer -->"
        }
        Mock -CommandName Add-ClarityPSHeader -MockWith {
            return "<header>Lots of Header Text></Header>"
        }
        Mock -CommandName Add-DocumentTitle -MockWith {
            return "<h3>NewClarityDoc</h3></br></br>"
        }
        Mock -CommandName Add-FlexContainer -MockWith {
            return "<flex-container>"
        }
        { New-ClarityDocument -Title ClarityPSDocument } | Should not Throw
    }
    It "Should Throw when New-HtmlDocument Fails." {
        Mock -CommandName New-HtmlDocument -MockWith {
            Throw "New-HtmlDocument Failed"
        }
        Mock -CommandName Add-ClarityPSHeadSet -MockWith {
            return "<head>Lots of Head text</head>"
        }
        Mock -CommandName Add-ClarityPSBody -MockWith {
            return "<body onload='set_style_from_cookie()'>"
        }
        Mock -CommandName Add-MainContainer -MockWith {
            return "<div class='main-container'><!-- Start MainContainer -->"
        }
        Mock -CommandName Add-ClarityPSHeader -MockWith {
            return "<header>Lots of Header Text></Header>"
        }
        Mock -CommandName Add-DocumentTitle -MockWith {
            return "<h3>NewClarityDoc</h3></br></br>"
        }
        Mock -CommandName Add-FlexContainer -MockWith {
            return "<flex-container>"
        }
        { New-ClarityDocument -Title ClarityPSDocument } | Should Throw
    }
    It "Should Throw when Add ClarityPSHeadSet Fails." {
        Mock -CommandName New-HtmlDocument -MockWith {
            return "<!DOCTYPE html><html lang='en'>"
        }
        Mock -CommandName Add-ClarityPSHeadSet -MockWith {
            Throw "Add-ClarityPSHeadSet failed"
        }
        Mock -CommandName Add-ClarityPSBody -MockWith {
            return "<body onload='set_style_from_cookie()'>"
        }
        Mock -CommandName Add-MainContainer -MockWith {
            return "<div class='main-container'><!-- Start MainContainer -->"
        }
        Mock -CommandName Add-ClarityPSHeader -MockWith {
            return "<header>Lots of Header Text></Header>"
        }
        Mock -CommandName Add-DocumentTitle -MockWith {
            return "<h3>NewClarityDoc</h3></br></br>"
        }
        Mock -CommandName Add-FlexContainer -MockWith {
            return "<flex-container>"
        }
        { New-ClarityDocument -Title ClarityPSDocument } | Should Throw
    }
    It "Should Throw when Add-ClarityPSBody Fails." {
        Mock -CommandName New-HtmlDocument -MockWith {
            return "<!DOCTYPE html><html lang='en'>"
        }
        Mock -CommandName Add-ClarityPSHeadSet -MockWith {
            return "<head>Lots of Head text</head>"
        }
        Mock -CommandName Add-ClarityPSBody -MockWith {
            Throw "Add-ClarityPSBody Failed"
        }
        Mock -CommandName Add-MainContainer -MockWith {
            return "<div class='main-container'><!-- Start MainContainer -->"
        }
        Mock -CommandName Add-ClarityPSHeader -MockWith {
            return "<header>Lots of Header Text></Header>"
        }
        Mock -CommandName Add-DocumentTitle -MockWith {
            return "<h3>NewClarityDoc</h3></br></br>"
        }
        Mock -CommandName Add-FlexContainer -MockWith {
            return "<flex-container>"
        }
        { New-ClarityDocument -Title ClarityPSDocument } | Should Throw
    }
    It "Should Throw when Add-MainContainer Fails." {
        Mock -CommandName New-HtmlDocument -MockWith {
            return "<!DOCTYPE html><html lang='en'>"
        }
        Mock -CommandName Add-ClarityPSHeadSet -MockWith {
            return "<head>Lots of Head text</head>"
        }
        Mock -CommandName Add-ClarityPSBody -MockWith {
            return "<body onload='set_style_from_cookie()'>"
        }
        Mock -CommandName Add-MainContainer -MockWith {
            Throw "Add-MainContainer Failed."
        }
        Mock -CommandName Add-ClarityPSHeader -MockWith {
            return "<header>Lots of Header Text></Header>"
        }
        Mock -CommandName Add-DocumentTitle -MockWith {
            return "<h3>NewClarityDoc</h3></br></br>"
        }
        Mock -CommandName Add-FlexContainer -MockWith {
            return "<flex-container>"
        }
        { New-ClarityDocument -Title ClarityPSDocument } | Should Throw
    }
    It "Should Throw when Add-ClarityPSHeader Fails." {
        Mock -CommandName New-HtmlDocument -MockWith {
            return "<!DOCTYPE html><html lang='en'>"
        }
        Mock -CommandName Add-ClarityPSHeadSet -MockWith {
            return "<head>Lots of Head text</head>"
        }
        Mock -CommandName Add-ClarityPSBody -MockWith {
            return "<body onload='set_style_from_cookie()'>"
        }
        Mock -CommandName Add-MainContainer -MockWith {
            return "<div class='main-container'><!-- Start MainContainer -->"
        }
        Mock -CommandName Add-ClarityPSHeader -MockWith {
            Throw "Add-ClarityPSHeader Failed."
        }
        Mock -CommandName Add-DocumentTitle -MockWith {
            return "<h3>NewClarityDoc</h3></br></br>"
        }
        Mock -CommandName Add-FlexContainer -MockWith {
            return "<flex-container>"
        }
        { New-ClarityDocument -Title ClarityPSDocument } | Should Throw
    }
    It "Should Throw when Add-DocumentTitle Fails." {
        Mock -CommandName New-HtmlDocument -MockWith {
            return "<!DOCTYPE html><html lang='en'>"
        }
        Mock -CommandName Add-ClarityPSHeadSet -MockWith {
            return "<head>Lots of Head text</head>"
        }
        Mock -CommandName Add-ClarityPSBody -MockWith {
            return "<body onload='set_style_from_cookie()'>"
        }
        Mock -CommandName Add-MainContainer -MockWith {
            return "<div class='main-container'><!-- Start MainContainer -->"
        }
        Mock -CommandName Add-ClarityPSHeader -MockWith {
            return "<header>Lots of Header Text></Header>"
        }
        Mock -CommandName Add-DocumentTitle -MockWith {
            Throw "Add-DocumentTitle failed"
        }
        Mock -CommandName Add-FlexContainer -MockWith {
            return "<flex-container>"
        }
        { New-ClarityDocument -Title ClarityPSDocument } | Should Throw
    }
    It "Should Throw when Add-FlexContainer Fails." {
        Mock -CommandName New-HtmlDocument -MockWith {
            return "<!DOCTYPE html><html lang='en'>"
        }
        Mock -CommandName Add-ClarityPSHeadSet -MockWith {
            return "<head>Lots of Head text</head>"
        }
        Mock -CommandName Add-ClarityPSBody -MockWith {
            return "<body onload='set_style_from_cookie()'>"
        }
        Mock -CommandName Add-MainContainer -MockWith {
            return "<div class='main-container'><!-- Start MainContainer -->"
        }
        Mock -CommandName Add-ClarityPSHeader -MockWith {
            return "<header>Lots of Header Text></Header>"
        }
        Mock -CommandName Add-DocumentTitle -MockWith {
            return "<h3>NewClarityDoc</h3></br></br>"
        }
        Mock -CommandName Add-FlexContainer -MockWith {
            Throw "Add-FlexContainer Fails."
        }
        { New-ClarityDocument -Title ClarityPSDocument } | Should Throw
    }
}
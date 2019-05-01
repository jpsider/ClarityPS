$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"


function Add-Header { }
function Add-Branding { }
function Close-Branding { }
function Add-BrandingTitle { }
function Add-HeaderNav { }
function Add-Link { }
function Close-Link { }
function Close-HeaderNav { }
function Add-HeaderNavLink { }
function Add-HeaderAction { }
function Add-HeaderAction { }
function Add-ButtonGroup { }
function Add-Button { }
function Add-Button { }
function Close-Button { }
function Close-ButtonGroup { }
function Close-HeaderAction { }
function Add-Help { }
function Close-Help { }
function Close-Header { }

Describe "Add-ClarityPSHeader function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        Add-ClarityPSHeader -WhatIf | Should be $false
    }
    It "Should not be null." {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        Add-ClarityPSHeader | Should not be $null
    }
    It "Should be valid ClarityPS HTML." {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        Add-ClarityPSHeader -Title MyCard | Should be "<header class='header Header-3'><div class='branding'><a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a></div><div class='header-nav'><a href='index.html'class='nav-link nav-text'>ClarityPS</a></div><div class='header-actions'><div class='btn-group'><button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme</button><button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme</button></div><a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'><clr-icon shape='cog'></clr-icon></a></div></header>"
    }
    It "Should Throw if Add-Header Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            Throw "Add-Header Failed"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Add-Branding Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            Throw "Add-Branding Failed"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Add-BrandingTitle Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            Throw " Add-BrandingTitle Failed"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Close-Branding Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            Throw "Close-Branding Failed"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Add-HeaderNav Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            Throw "Add HeaderNav Failed"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Add-HeaderNavLink Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            Throw "Add-HeaderNavLink Failed"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Close-Link Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            Throw "Close-Link Failed"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Close-HeaderNav Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            Throw "Close-HeaderNav Failed" 
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Add-HeaderAction Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            Throw "Add-HeaderAction Failed"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Add-ButtonGroup Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            Throw "Add-ButtonGroup Failed"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Add-Button Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            Throw "Add-Button Failed"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Close-Button Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            Throw "Close-Button Failed"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Close-ButtonGroup Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            Throw "Close-ButtonGroup Failed"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Close-HeaderAction Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            Throw "Close-HeaderAction Failed"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Add-Help Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            Throw "Add-Help Failed"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Close-Help Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            Throw "Close-Help Failed"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            return "</header>"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
    It "Should Throw if Close-Header Fails" {
        Mock -CommandName 'Add-Header' -MockWith {
            return "<header class='header Header-3'>"
        }
        Mock -CommandName 'Add-Branding' -MockWith {
            return "<div class='branding'>"
        }
        Mock -CommandName 'Add-BrandingTitle' -MockWith {
            return "<a href='index.html' class='nav-link'><span class='title'>MyWebPage</span></a>"
        }
        Mock -CommandName 'Close-Branding' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderNav' -MockWith {
            return "<div class='header-nav'>"
        }
        Mock -CommandName 'Add-HeaderNavLink' -MockWith {
            return "<a href='index.html'class='nav-link nav-text'>ClarityPS"
        }
        Mock -CommandName 'Close-Link' -MockWith {
            return "</a>"
        }
        Mock -CommandName 'Close-HeaderNav' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-HeaderAction' -MockWith {
            return "<div class='header-actions'>"
        }
        Mock -CommandName 'Add-ButtonGroup' -MockWith {
            return "<div class='btn-group'>"
        }
        Mock -CommandName 'Add-Button' -MockWith {
            return "<button class='btn btn-inverse btn-sm' type='button' onclick='switch_style('dark');return false;' name='theme' value='Dark Theme' id='dark'>Dark Theme"
        }
        Mock -CommandName 'Close-Button' -MockWith {
            return "</button>"
        }
        Mock -CommandName 'Close-ButtonGroup' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Close-HeaderAction' -MockWith {
            return "</div>"
        }
        Mock -CommandName 'Add-Help' -MockWith {
            return "<a href='http://invoke-automation.blog' class='nav-link nav-icon' target='_blank'>"
        }
        Mock -CommandName 'Close-Help' -MockWith {
            return "<clr-icon shape='cog'></clr-icon></a>"
        }
        Mock -CommandName 'Close-Header' -MockWith {
            Throw "Close-Header Failed"
        }
        { Add-ClarityPSHeader } | Should Throw
    }
}

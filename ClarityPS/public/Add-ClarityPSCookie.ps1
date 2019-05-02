function Add-ClarityPSCookie
{
    <#
    .DESCRIPTION
        Adds Clarity Cookie MGMT script.
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-ClarityPSCookie -Title MyCard
    .NOTES
        No notes at this time.
    #>
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = "Low"
    )]
    [OutputType([String])]
    [OutputType([Boolean])]
    param(
        [Parameter()][String]$Title = "ClarityCookieMgmtScript"
    )
    if ($pscmdlet.ShouldProcess("Starting Add-ClarityPSCookie function."))
    {
        # Determine the Module Path
        $SourceModulePath = (Split-Path -Path (Get-Module -ListAvailable ClarityPS | Sort-Object -Property Version -Descending | Select-Object -First 1).path)
        $ScriptPath = "$SourceModulePath\lib\cookie.js"
        $CookieScript = Get-Content -Path $ScriptPath
        $ClarityPSCookieHtml = Add-Script -Title $Title -ScriptText "$CookieScript"
        $ClarityPSCookieHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

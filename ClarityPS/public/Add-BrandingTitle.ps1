function Add-BrandingTitle
{
    <#
    .DESCRIPTION
        Adds Page title with link.
    .PARAMETER Title
        Title, used for comment
    .PARAMETER URL
        URL, to provide a link. Defaults to 'index.html'
    .EXAMPLE
        Add-BrandingTitle -Title MyCard -URL "index.html"
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
        [Parameter(Mandatory = $true)][String]$Title,
        [Parameter()][String]$URL = "index.html"
    )
    if ($pscmdlet.ShouldProcess("Starting Add-BrandingTitle function."))
    {
        $BrandingTitleHtml = "<a href='$URL' class='nav-link'><span class='title'>$Title</span></a>"
        $BrandingTitleHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

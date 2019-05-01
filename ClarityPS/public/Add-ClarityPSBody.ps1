function Add-ClarityPSBody
{
    <#
    .DESCRIPTION
        Adds ClarityPS Body Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-ClarityPSBody -Title ClarityHtmlBody
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
        [Parameter()][String]$Title = "ClarityPSHtmlBody"
    )
    if ($pscmdlet.ShouldProcess("Starting Add-ClarityPSBody function."))
    {
        $ClarityPSBodyHtml = Add-HtmlBody -Title $title -HtmlBodyOption "onload='set_style_from_cookie()'"
        $ClarityPSBodyHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

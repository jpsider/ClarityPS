function Close-HtmlHead
{
    <#
    .DESCRIPTION
        Closes HTML Head Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-HtmlHead -Title MyCard
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
        [Parameter()][String]$Title
    )
    if ($pscmdlet.ShouldProcess("Starting Close-HtmlHead function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HtmlHeadHtml = "</head><! End $Title>"
        }
        else
        {
            $HtmlHeadHtml = "</head>"
        }
        $HtmlHeadHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

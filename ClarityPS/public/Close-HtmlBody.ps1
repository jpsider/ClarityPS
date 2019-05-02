function Close-HtmlBody
{
    <#
    .DESCRIPTION
        Closes HTML Body Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-HtmlBody -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-HtmlBody function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HtmlBodyHtml = "</body><!-- End $Title -->"
        }
        else
        {
            $HtmlBodyHtml = "</body>"
        }
        $HtmlBodyHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

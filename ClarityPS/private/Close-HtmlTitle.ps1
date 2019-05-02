function Close-HtmlTitle
{
    <#
    .DESCRIPTION
        Closes Html Title Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-HtmlTitle -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-HtmlTitle function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HtmlTitleHtml = "</title><!-- End $Title -->"
        }
        else
        {
            $HtmlTitleHtml = "</title>"
        }
        $HtmlTitleHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

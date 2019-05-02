function Close-HtmlDocument
{
    <#
    .DESCRIPTION
        Closes Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-HtmlDocument -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-HtmlDocument function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HtmlDocumentHtml = "</html><!-- End $Title -->"
        }
        else
        {
            $HtmlDocumentHtml = "</html>"
        }
        $HtmlDocumentHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

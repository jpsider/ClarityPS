function Close-ClarityDocument
{
    <#
    .DESCRIPTION
        Closes Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-ClarityDocument -Title MyCard
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
        [Parameter()][String]$Title = "ClarityDocument"
    )
    if ($pscmdlet.ShouldProcess("Starting Close-ClarityDocument function."))
    {
        # Determine if a title was specified
        try
        {
            $CloseClarityDocumentHtml += Close-FlexContainer -Title "FlexContainer"
            $CloseClarityDocumentHtml += Close-HtmlBody -Title "Body"
            $CloseClarityDocumentHtml += Close-HtmlDocument -Title "$Title"
            $CloseClarityDocumentHtml
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message
            $FailedItem = $_.Exception.ItemName
            Throw "Close-ClarityDocument: $ErrorMessage $FailedItem"
        }
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

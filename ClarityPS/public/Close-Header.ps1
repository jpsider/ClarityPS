function Close-FlexItem
{
    <#
    .DESCRIPTION
        Closes Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-FlexItem -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-FlexItem function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $FlexItemHtml = "</div><! End $Title>"
        }
        else
        {
            $FlexItemHtml = "</div>"
        }
        $FlexItemHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

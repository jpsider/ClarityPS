function Close-Card
{
    <#
    .DESCRIPTION
        Closes Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-Card -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-Card function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $CardHtml = "</div><! End $Title>"
        }
        else
        {
            $CardHtml = "</div>"
        }
        $CardHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

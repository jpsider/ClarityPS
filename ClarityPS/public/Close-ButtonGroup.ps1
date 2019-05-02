function Close-ButtonGroup
{
    <#
    .DESCRIPTION
        Closes Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-ButtonGroup -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-ButtonGroup function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $ButtonGroupHtml = "</div><!-- End $Title -->"
        }
        else
        {
            $ButtonGroupHtml = "</div>"
        }
        $ButtonGroupHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

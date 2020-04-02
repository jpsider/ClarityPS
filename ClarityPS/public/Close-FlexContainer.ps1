function Close-FlexContainer
{
    <#
    .DESCRIPTION
        Closes Flex Container Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-FlexContainer -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-FlexContainer function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $FlexContainerHtml = "</div><!-- End $Title -->"
        }
        else
        {
            $FlexContainerHtml = "</div>"
        }
        $FlexContainerHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

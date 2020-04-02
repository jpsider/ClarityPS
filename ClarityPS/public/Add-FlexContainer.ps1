function Add-FlexContainer
{
    <#
    .DESCRIPTION
        Adds Flex Container Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-FlexContainer -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Add-FlexContainer function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $FlexContainerHtml = "<flex-container><!-- Start $Title -->"
        }
        else
        {
            $FlexContainerHtml = "<flex-container>"
        }
        $FlexContainerHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

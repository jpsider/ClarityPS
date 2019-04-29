function Add-FlexItem
{
    <#
    .DESCRIPTION
        Adds Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-FlexItem -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Add-FlexItem function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $FlexItemHtml = "<div class='flex-item'><! Start $Title>"
        }
        else
        {
            $FlexItemHtml = "<div class='flex-item'>"
        }
        $FlexItemHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

function Add-HeaderActions
{
    <#
    .DESCRIPTION
        Adds Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-HeaderActions -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Add-HeaderActions function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HeaderActionsHtml = "<div class='header-actions'><! Start $Title>"
        }
        else
        {
            $HeaderActionsHtml = "<div class='header-actions'>"
        }
        $HeaderActionsHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

function Add-ButtonGroup
{
    <#
    .DESCRIPTION
        Adds Button Group Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-ButtonGroup -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Add-ButtonGroup function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $ButtonGroupHtml = "<div class='btn-group'><! Start $Title>"
        }
        else
        {
            $ButtonGroupHtml = "<div class='btn-group'>"
        }
        $ButtonGroupHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

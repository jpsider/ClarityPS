function Add-Card
{
    <#
    .DESCRIPTION
        Adds Card Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-Card -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Add-Card function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $CardClassHtml = "<div class='card'><!-- Start $Title -->"
        }
        else
        {
            $CardClassHtml = "<div class='card'>"
        }
        $CardClassHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

function Add-Style
{
    <#
    .DESCRIPTION
        Adds Style Element
    .PARAMETER Title
        Title, used for comment
    .PARAMETER StyleText
        Text for the CSS Style
    .EXAMPLE
        Add-Style -Title MyCard -StyleText "Some CSS"
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
        [Parameter()][String]$Title,
        [Parameter(Mandatory = $true)][String]$StyleText
    )
    if ($pscmdlet.ShouldProcess("Starting Add-Style function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $StyleHtml = "<style>$StyleText<!-- Start $Title -->"
        }
        else
        {
            $StyleHtml = "<style>$StyleText"
        }
        $StyleHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

function Add-CardTitle
{
    <#
    .DESCRIPTION
        Adds Card Title Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-CardTitle -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Add-CardTitle function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $CardTitleHtml = "<h3 class='card-title'><! Start $Title>"
        }
        else
        {
            $CardTitleHtml = "<h3 class='card-title'>"
        }
        $CardTitleHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

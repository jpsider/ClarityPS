function Add-Header
{
    <#
    .DESCRIPTION
        Adds Header Element
    .PARAMETER Title
        Title, used for comment
    .PARAMETER HeaderOption
        Used for CSS Style selection.
    .EXAMPLE
        Add-Header -Title MyCard -HeaderOption Header-6
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
        [Parameter()][String]$HeaderOption = "header-6"
    )
    if ($pscmdlet.ShouldProcess("Starting Add-Header function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HeaderHtml = "<header class='header $HeaderOption'><! Start $Title>"
        }
        else
        {
            $HeaderHtml = "<header class='header $HeaderOption'>"
        }
        $HeaderHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

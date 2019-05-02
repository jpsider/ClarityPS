function Add-HeaderNav
{
    <#
    .DESCRIPTION
        Adds Header Nav Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-HeaderNav -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Add-HeaderNav function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HeaderNavHtml = "<div class='header-nav'><!-- Start $Title -->"
        }
        else
        {
            $HeaderNavHtml = "<div class='header-nav'>"
        }
        $HeaderNavHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

function Add-Branding
{
    <#
    .DESCRIPTION
        Adds Branding Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-Branding -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Add-Branding function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $BrandingHtml = "<div class='branding'><! Start $Title>"
        }
        else
        {
            $BrandingHtml = "<div class='branding'>"
        }
        $BrandingHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

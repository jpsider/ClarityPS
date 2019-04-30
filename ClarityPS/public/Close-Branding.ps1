function Close-Branding
{
    <#
    .DESCRIPTION
        Closes Branding Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-Branding -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-Branding function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $BrandingHtml = "</div><! End $Title>"
        }
        else
        {
            $BrandingHtml = "</div>"
        }
        $BrandingHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

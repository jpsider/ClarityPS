function Close-ClarityCardBody
{
    <#
    .DESCRIPTION
        Closes Card Body Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-ClarityCardBody -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-ClarityCardBody function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $BrandingHtml = "</center><!-- End $Title -->"
        }
        else
        {
            $BrandingHtml = "</center>"
        }
        $BrandingHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

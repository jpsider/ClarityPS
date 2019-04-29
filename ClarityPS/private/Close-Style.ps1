function Close-Style
{
    <#
    .DESCRIPTION
        Closes Style Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-Style -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-Style function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $StyleHtml = "</style><! End $Title>"
        }
        else
        {
            $StyleHtml = "</style>"
        }
        $StyleHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

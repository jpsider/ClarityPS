function Close-Button
{
    <#
    .DESCRIPTION
        Closes Button Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-Button -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-Button function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $ButtonHtml = "</button><! End $Title>"
        }
        else
        {
            $ButtonHtml = "</button>"
        }
        $ButtonHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

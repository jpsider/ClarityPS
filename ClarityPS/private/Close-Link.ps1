function Close-Link
{
    <#
    .DESCRIPTION
        Closes Link Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-Link -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-Link function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $LinkHtml = "</a><! End $Title>"
        }
        else
        {
            $LinkHtml = "</a>"
        }
        $LinkHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

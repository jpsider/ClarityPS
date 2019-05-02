function Close-HeaderAction
{
    <#
    .DESCRIPTION
        Closes Header-Nav Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-HeaderAction -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-HeaderAction function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HeaderActionHtml = "</div><!-- End $Title -->"
        }
        else
        {
            $HeaderActionHtml = "</div>"
        }
        $HeaderActionHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

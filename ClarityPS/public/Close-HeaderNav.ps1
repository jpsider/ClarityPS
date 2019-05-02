function Close-HeaderNav
{
    <#
    .DESCRIPTION
        Closes Header-Nav Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-HeaderNav -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-HeaderNav function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HeaderNavHtml = "</div><!-- End $Title -->"
        }
        else
        {
            $HeaderNavHtml = "</div>"
        }
        $HeaderNavHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

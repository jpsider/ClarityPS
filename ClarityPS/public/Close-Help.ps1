function Close-Help
{
    <#
    .DESCRIPTION
        Closes Help Link with Cog Icon.
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-Help -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-Help function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HelpHtml = "<clr-icon shape='cog'></clr-icon></a><!-- End $Title -->"
        }
        else
        {
            $HelpHtml = "<clr-icon shape='cog'></clr-icon></a>"
        }
        $HelpHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

function Close-CardTitle
{
    <#
    .DESCRIPTION
        Closes Card Title Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-CardTitle -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-CardTitle function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $CardTitleHtml = "</h3><!-- End $Title -->"
        }
        else
        {
            $CardTitleHtml = "</h3>"
        }
        $CardTitleHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

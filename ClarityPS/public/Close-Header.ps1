function Close-Header
{
    <#
    .DESCRIPTION
        Closes header Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-Header -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-Header function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HeaderHtml = "</header><!-- End $Title -->"
        }
        else
        {
            $HeaderHtml = "</header>"
        }
        $HeaderHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

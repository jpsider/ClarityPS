function Close-CardBlock
{
    <#
    .DESCRIPTION
        Closes Card-Block Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-CardBlock -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-CardBlock function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $CardBlockHtml = "</div><!-- End $Title -->"
        }
        else
        {
            $CardBlockHtml = "</div>"
        }
        $CardBlockHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

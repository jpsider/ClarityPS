function Close-CardText
{
    <#
    .DESCRIPTION
        Closes Card-Text Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-CardText -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-CardText function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $CardTextHtml = "</div><! End $Title>"
        }
        else
        {
            $CardTextHtml = "</div>"
        }
        $CardTextHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

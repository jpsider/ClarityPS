function Add-CardText
{
    <#
    .DESCRIPTION
        Adds Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .PARAMETER CardText
        Text String of Data to be placed on the card.
    .EXAMPLE
        Add-CardText -Title MyCardText -CardText "<someElement>SomeHTML Text</someElement>"
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
        [Parameter()][String]$Title,
        [Parameter(Mandatory = $true)][String]$CardText
    )
    if ($pscmdlet.ShouldProcess("Starting Add-CardText function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $CardTextHtml = "<! Start $Title><p class='card-text'>$CardText</p>"
        }
        else
        {
            $CardTextHtml = "<p class='card-text'>$CardText</p>"
        }
        $CardTextHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

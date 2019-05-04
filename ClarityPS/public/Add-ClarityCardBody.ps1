function Add-ClarityCardBody
{
    <#
    .DESCRIPTION
        Returns the HTML needed to start Start a Clarity Card Body.
    .PARAMETER CardText
        Title of the card.
    .EXAMPLE
        Add-ClarityCardBody -CardText "SomeHTML"
    .NOTES
        No notes at this time.
    #>
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = "Low"
    )]
    [OutputType([String])]
    [OutputType([boolean])]
    param(
        [Parameter(Mandatory = $true)][String]$CardText
    )
    if ($pscmdlet.ShouldProcess("Starting Add-ClarityCardBody function."))
    {
        #Open the Body of the card.
        $CardBodyHtml = "<center><p class='card-text'>$CardText</p>"
        $CardBodyHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}
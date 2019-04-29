function New-ClarityCardBody
{
    <#
    .DESCRIPTION
        Builds HTML Reports using VMware's ClarityUI library.
    .PARAMETER CardText
        HTML Text String
    .EXAMPLE
        New-ClarityCardBody -CardText $CardText
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
        [Parameter(Mandatory = $true)][System.Object]$CardText
    )
    if ($pscmdlet.ShouldProcess("Starting New-ClarityCardBody function."))
    {
        # If the CardText is less than or equal to 9 characters, throw an error.
        if ($CardText.Length -le 2)
        {
            Throw "New-ClarityCardBody: CardText is less that expected length."
        }
        else
        {
            $CardBodyText = "<p class='card-text'>"
            $CardBodyText += $CardText
            $CardBodyText
        }
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

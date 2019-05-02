function Close-ClarityCard
{
    <#
    .DESCRIPTION
        Returns the HTML to close a standard ClarityPS Card.
    .PARAMETER Title
        Provide a Title so a proper comment can be added.
    .EXAMPLE
        Close-ClarityCard -Title Storage
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
        [Parameter(Mandatory = $true)][String]$Title
    )
    if ($pscmdlet.ShouldProcess("Starting Close-ClarityCard function."))
    {
        # Return the closing HTML for a Standard ClarityPS Card.
        $ClosingBaseHTML = "</center></div></div></div>" + "<!-- End $Title Card -->"
        $ClosingBaseHTML
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

function Add-Null
{
    <#
    .DESCRIPTION
        Adds Null Element
    .EXAMPLE
        Add-Null
    .NOTES
        No notes at this time.
    #>
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = "Low"
    )]
    [OutputType([String])]
    [OutputType([Boolean])]
    param()
    if ($pscmdlet.ShouldProcess("Starting Add-Null function."))
    {
        # This function does Nothing. It's a place holder for now.
    }
    else
    {
        # -WhatIf was used.
        return $null
    }
}
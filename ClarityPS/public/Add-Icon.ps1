function Add-Icon
{
    <#
    .DESCRIPTION
        Builds HTML Reports using VMware's ClarityUI library.
    .PARAMETER Icon
        Clarity Icon.
    .PARAMETER IconSize
        Size of the Icon.
    .EXAMPLE
        Add-Icon
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
        [Parameter(Mandatory = $true)][String]$Icon,
        [Parameter()][String]$IconSize = 24
    )
    if ($pscmdlet.ShouldProcess("Starting Add-Icon function."))
    {
        $IconHTML = "<clr-icon shape='$Icon' size='$IconSize'></clr-icon>"
        $IconHTML
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

function Add-Script
{
    <#
    .DESCRIPTION
        Adds Script Element
    .PARAMETER Title
        Title, used for comment
    .PARAMETER ScriptText
        Title, used for comment
    .EXAMPLE
        Add-Script -Title MyCard -ScriptText "Some JavaScript"
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
        [Parameter(Mandatory = $true)][String]$ScriptText
    )
    if ($pscmdlet.ShouldProcess("Starting Add-Script function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $ScriptHtml = "<script>$ScriptText<!-- Start $Title -->"
        }
        else
        {
            $ScriptHtml = "<script>$ScriptText"
        }
        $ScriptHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

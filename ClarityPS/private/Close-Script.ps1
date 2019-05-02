function Close-Script
{
    <#
    .DESCRIPTION
        Closes Script Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-Script -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-Script function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $ScriptHtml = "</script><!-- End $Title -->"
        }
        else
        {
            $ScriptHtml = "</script>"
        }
        $ScriptHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

function Add-ScriptLink
{
    <#
    .DESCRIPTION
        Adds Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .PARAMETER SourceLink
        Link to the CSS resource
    .EXAMPLE
        Add-ScriptLink -Title MyCard -SourceLink "https://unpkg.com/clarity-icons@0.10.28/clarity-icons.min.js"
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
        [Parameter()][String]$SourceLink
    )
    if ($pscmdlet.ShouldProcess("Starting Add-ScriptLink function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $ScriptLinkHtml = "<script src='$SourceLink'></script><! Start $Title>"
        }
        else
        {
            $ScriptLinkHtml = "<script src='$SourceLink'></script>"
        }
        $ScriptLinkHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

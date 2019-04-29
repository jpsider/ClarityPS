function Add-CssLink
{
    <#
    .DESCRIPTION
        Adds CSS Link Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-CssLink -Title MyCard
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
        [Parameter(Mandatory = $true)][String]$URL,
        [Parameter()][String]$LinkTitle,
        [Parameter()][String]$RelType = "stylesheet"
    )
    if ($pscmdlet.ShouldProcess("Starting Add-CssLink function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $CssLinkHtml = "<link rel='$RelType' href='$URL' title='$LinkTitle type='text/css' /><! Start $Title>"
        }
        else
        {
            $CssLinkHtml = "<link rel='$RelType' href='$URL' title='$LinkTitle type='text/css' />"
        }
        $CssLinkHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

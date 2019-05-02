function Add-DocumentTitle
{
    <#
    .DESCRIPTION
        Adds Title to Card Html Document
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-DocumentTitle -Title MyCard
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
        [Parameter(Mandatory = $true)][String]$Title
    )
    if ($pscmdlet.ShouldProcess("Starting Add-DocumentTitle function."))
    {
        # Determine if a title was specified
        $DocumentTitleHtml = "<h3>$Title</h3></br></br>"
        $DocumentTitleHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

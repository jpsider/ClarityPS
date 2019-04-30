function Add-Help
{
    <#
    .DESCRIPTION
        Adds Help Link with Cog Icon in the Header.
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-Help -Title MyCard -URL "http://invoke-automation.blog"
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
        [Parameter(Mandatory = $true)][String]$URL
    )
    if ($pscmdlet.ShouldProcess("Starting Add-Help function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HelpHtml = "<a href='$URL' class='nav-link nav-icon' target='_blank'><! Start $Title>"
        }
        else
        {
            $HelpHtml = "<a href='$URL' class='nav-link nav-icon' target='_blank'>"
        }
        $HelpHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

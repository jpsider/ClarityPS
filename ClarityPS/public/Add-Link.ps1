function Add-Link
{
    <#
    .DESCRIPTION
        Adds Link Element
    .PARAMETER Title
        Title, used for comment
    .PARAMETER URL
        Web URL for the link.
    .PARAMETER LinkTitle
        Title of the link in the HTML doc (user facing)
    .PARAMETER NewTab
        Adds a property to open the link in a new tab.
    .EXAMPLE
        Add-Link -Title MyCard -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" -NewTab
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
        [Parameter(Mandatory = $true)][String]$LinkTitle,
        [Parameter()][switch]$NewTab = $false
    )
    if ($pscmdlet.ShouldProcess("Starting Add-Link function."))
    {
        # Determine if a title was specified
        $LinkHtml = "<a href='$URL'"
        if ($NewTab)
        {
            $LinkHtml += " target='_blank'>$LinkTitle"
        }
        else
        {
            $LinkHtml += ">$LinkTitle"
        }

        if ($Title)
        {
            $LinkHtml += "<!-- Start $Title -->"
        }
        else
        {
            # adding nothing
        }
        $LinkHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

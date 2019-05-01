function Add-HeaderNavLink
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
        Add-HeaderNavLink -Title MyCard -URL "http://invoke-automation.blog" -LinkTitle "Invoke-Automation" -NewTab
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
        [Parameter(Mandatory = $true)][String]$URL,
        [Parameter(Mandatory = $true)][String]$LinkTitle,
        [Parameter()][switch]$Active
    )
    if ($pscmdlet.ShouldProcess("Starting Add-HeaderNavLink function."))
    {
        # Determine if a title was specified
        $LinkHtml = "<a href='$URL'"

        if ($Active)
        {
            $class = "class='active nav-link nav-text'"
        }
        else
        {
            $class = "class='nav-link nav-text'"
        }
 
        $LinkHtml += $class
        $LinkHtml += ">$LinkTitle"
        $LinkHtml

    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

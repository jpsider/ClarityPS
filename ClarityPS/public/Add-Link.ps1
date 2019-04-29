function Add-Link
{
    <#
    .DESCRIPTION
        Adds Link Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-Link -Title MyCard
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
        [Parameter()][String]$URL

        #### Not done!



    )
    if ($pscmdlet.ShouldProcess("Starting Add-Link function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $LinkHtml = "<a href='$URL'><! Start $Title>"
        }
        else
        {
            $LinkHtml = "<div class='flex-item'>"
        }
        $LinkHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

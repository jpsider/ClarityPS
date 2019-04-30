function Add-HtmlHead
{
    <#
    .DESCRIPTION
        Adds HTML Head Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-HtmlHead -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Add-HtmlHead function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HtmlHeadHtml = "<head><! Start $Title>"
        }
        else
        {
            $HtmlHeadHtml = "<head>"
        }
        $HtmlHeadHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

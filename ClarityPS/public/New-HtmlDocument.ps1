function New-HtmlDocument
{
    <#
    .DESCRIPTION
        Adds HTML Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        New-HtmlDocument -Title MyHTMLDocument
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
    if ($pscmdlet.ShouldProcess("Starting New-HtmlDocument function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HtmlString = "<!DOCTYPE html><html lang='en'><!-- Start $Title -->"
        }
        else
        {
            $HtmlString = "<!DOCTYPE html><html lang='en'>"
        }
        $HtmlString
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}
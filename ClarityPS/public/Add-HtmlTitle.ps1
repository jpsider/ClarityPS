function Add-HtmlTitle
{
    <#
    .DESCRIPTION
        Adds HTML Title Element for the Browser Tab.
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-HtmlTitle -Title MyCard -HtmlTitle "MyHtmlDocument"
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
        [Parameter()][String]$HtmlTitle = "ClarityPS"
    )
    if ($pscmdlet.ShouldProcess("Starting Add-HtmlTitle function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $HtmlTitleHtml = "<title>$HtmlTitle<! Start $Title>"
        }
        else
        {
            $HtmlTitleHtml = "<title>$HtmlTitle"
        }
        $HtmlTitleHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

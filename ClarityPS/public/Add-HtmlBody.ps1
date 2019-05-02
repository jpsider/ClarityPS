function Add-HtmlBody
{
    <#
    .DESCRIPTION
        Adds HTML Body Element
    .PARAMETER Title
        Title, used for comment
    .PARAMETER HtmlBodyOption
        Allows for Javascript options in the body element.
    .EXAMPLE
        Add-HtmlBody -Title MyCard -HtmlBodyOption "onload='set_style_from_cookie()'"
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
        [Parameter()][String]$HtmlBodyOption = "onload='set_style_from_cookie()'"
    )
    if ($pscmdlet.ShouldProcess("Starting Add-HtmlBody function."))
    {
        # Determine if a title was specified
        $HtmlBodyHtml = "<body "
        if ($HtmlBodyOption)
        {
            $HtmlBodyHtml += "$HtmlBodyOption"
        }
        else
        {
            # Nothing to add here.
        }

        if ($Title)
        {
            $HtmlBodyHtml += "><!-- Start $Title -->"
        }
        else
        {
            $HtmlBodyHtml += ">"
        }
        $HtmlBodyHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

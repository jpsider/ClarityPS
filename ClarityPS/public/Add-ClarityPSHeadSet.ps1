function Add-ClarityPSHeadSet
{
    <#
    .DESCRIPTION
        Adds Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-ClarityPSHeadSet -Title MyCard
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
        [Parameter()][String]$Title = "ClarityPSHeadSet"
    )
    if ($pscmdlet.ShouldProcess("Starting Add-ClarityPSHeadSet function."))
    {
        try
        {
            # Determine if a title was specified
            $ClarityPSHeadSetHtml += Add-HtmlHead -Title $Title
            $ClarityPSHeadSetHtml += Add-ClarityPSLinkSet
            $ClarityPSHeadSetHtml += Add-ClarityPSScriptSet
            $ClarityPSHeadSetHtml += Add-ClarityPSCookie
            $ClarityPSHeadSetHtml += Add-ClarityPSStyleSet
            $ClarityPSHeadSetHtml += Add-ClarityPSIconSet
            $ClarityPSHeadSetHtml += Add-HtmlTitle -Title "ClarityPS"
            $ClarityPSHeadSetHtml += Close-HtmlTitle
            $ClarityPSHeadSetHtml += Close-HtmlHead -Title $Title
            $ClarityPSHeadSetHtml
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message
            $FailedItem = $_.Exception.ItemName
            Throw "Add-ClarityPSHeadSet: $ErrorMessage $FailedItem"
        }
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

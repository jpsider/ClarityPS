function New-ClarityDocument
{
    <#
    .DESCRIPTION
        Returns the HTML needed to start a new Clarity card.
    .PARAMETER Title
        Title of the card.
    .PARAMETER Icon
        Clarity Icon.
    .PARAMETER IconSize
        Size of the Icon.
    .EXAMPLE
        New-ClarityDocument -Title Storage
    .NOTES
        No notes at this time.
    #>
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = "Low"
    )]
    [OutputType([String])]
    [OutputType([boolean])]
    param(
        [Parameter(Mandatory = $true)][String]$Title
    )
    if ($pscmdlet.ShouldProcess("Starting New-ClarityDocument function."))
    {
        Try
        {
            # Add the Title
            $HtmlBaseString += New-HtmlDocument
            $HtmlBaseString += Add-ClarityPSHeadSet
            $HtmlBaseString += Add-ClarityPSBody
            $HtmlBaseString += Add-MainContainer
            $HtmlBaseString += Add-ClarityPSHeader
            $HtmlBaseString += Add-DocumentTitle -Title $Title
            $HtmlBaseString += Add-FlexContainer
            $HtmlBaseString
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message
            $FailedItem = $_.Exception.ItemName
            Throw "New-ClarityDocument: $ErrorMessage $FailedItem"
        }
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

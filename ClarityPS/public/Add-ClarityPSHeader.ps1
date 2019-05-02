function Add-ClarityPSHeader
{
    <#
    .DESCRIPTION
        Adds Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-ClarityPSHeader -Title MyCard
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
        [Parameter()][String]$Title = "ClarityPSHeader"
    )
    if ($pscmdlet.ShouldProcess("Starting Add-ClarityPSHeader function."))
    {
        try
        {
            # Determine if a title was specified
            $ClarityPSHeaderHtml += Add-Header -Title HeaderElement
            $ClarityPSHeaderHtml += Add-Branding -Title BrandingElement
            $ClarityPSHeaderHtml += Add-BrandingTitle -Title ClarityPS
            $ClarityPSHeaderHtml += Close-Branding

            $ClarityPSHeaderHtml += Add-HeaderNav -Title HeaderNav
            $ClarityPSHeaderHtml += Add-HeaderNavLink -URL "#" -LinkTitle "FutureLink" -Active
            $ClarityPSHeaderHtml += Close-Link
            $ClarityPSHeaderHtml += Close-HeaderNav -Title HeaderNav

            $ClarityPSHeaderHtml += Add-HeaderAction -Title $Title
            $ClarityPSHeaderHtml += Add-ButtonGroup -Title $Title
            $ClarityPSHeaderHtml += Add-Button -Class "btn btn-inverse btn-sm" -OnClick 'switch_style("dark");return false;' -ButtonText "Dark Theme" -ButtonValue 'Dark Theme' -ID 'dark' -Name 'theme'
            $ClarityPSHeaderHtml += Close-Button
            $ClarityPSHeaderHtml += Add-Button -Class "btn btn-inverse btn-sm" -OnClick 'switch_style("light");return false;' -ButtonText "Light Theme" -ButtonValue 'Light Theme' -ID 'light' -Name 'theme'
            $ClarityPSHeaderHtml += Close-Button
            $ClarityPSHeaderHtml += Close-ButtonGroup -Title $Title
            $ClarityPSHeaderHtml += Add-Help -Title MyCard -URL "https://github.com/jpsider/reportcardps"
            $ClarityPSHeaderHtml += Close-Help
            $ClarityPSHeaderHtml += Close-HeaderAction -Title $Title

            $ClarityPSHeaderHtml += Close-Header -Title $Title
            $ClarityPSHeaderHtml
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message
            $FailedItem = $_.Exception.ItemName
            Throw "Add-ClarityPSHeader: $ErrorMessage $FailedItem"
        }
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

function Add-ClarityPSLinkSet
{
    <#
    .DESCRIPTION
        Adds Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-ClarityPSLinkSet -Title MyCard
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
        [Parameter()][String]$Title = "ClarityPSLinkSet"
    )
    if ($pscmdlet.ShouldProcess("Starting Add-ClarityPSLinkSet function."))
    {
        try
        {
            $SourceModulePath = (Split-Path -Path (Get-Module -ListAvailable ClarityPS | Sort-Object -Property Version -Descending | Select-Object -First 1).path)
            $ScriptPath = "$SourceModulePath\lib\CssLinkSet.json"
            $LinkSet = Get-Content -Path $ScriptPath | ConvertFrom-Json
            foreach ($CSSLink in $LinkSet)
            {
                $CssURL = $CSSLink.URL
                $CssTitle = $CSSLink.Title
                $RelType = $CSSLink.RelType
                $ClarityPSLinkSetHtml += Add-CssLink -URL "$CssURL" -LinkTitle "$CssTitle" -RelType $RelType
            }
            $ClarityPSLinkSetHtml
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message
            $FailedItem = $_.Exception.ItemName
            Throw "Add-ClarityPSLinkSet: $ErrorMessage $FailedItem"
        }
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

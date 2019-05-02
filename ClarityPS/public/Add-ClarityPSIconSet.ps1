function Add-ClarityPSIconSet
{
    <#
    .DESCRIPTION
        Adds Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-ClarityPSIconJs -Title MyCard
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
        [Parameter()][String]$Title = "ClarityIconSetJS"
    )
    if ($pscmdlet.ShouldProcess("Starting Add-ClarityPSIconJs function."))
    {
        try
        {
            $SourceModulePath = (Split-Path -Path (Get-Module -ListAvailable ClarityPS | Sort-Object -Property Version -Descending | Select-Object -First 1).path)
            $ScriptPath = "$SourceModulePath\lib\IconSet.js"
            $IconScriptSet = Get-Content -Path $ScriptPath
            $ClarityPSIconJsHtml += Add-Script -Title $Title -ScriptText "$IconScriptSet"
            $ClarityPSIconJsHtml += Close-Script
            $ClarityPSIconJsHtml
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message
            $FailedItem = $_.Exception.ItemName
            Throw "Add-ClarityPSIconSet: $ErrorMessage $FailedItem"
        }
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

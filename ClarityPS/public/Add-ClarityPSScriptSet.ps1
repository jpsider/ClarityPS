function Add-ClarityPSScriptSet
{
    <#
    .DESCRIPTION
        Adds Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-ClarityPSScriptSet -Title MyCard
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
        [Parameter()][String]$Title = "ClarityPSScriptSet"
    )
    if ($pscmdlet.ShouldProcess("Starting Add-ClarityPSScriptSet function."))
    {
        try
        {
            $SourceModulePath = (Split-Path -Path (Get-Module -ListAvailable ClarityPS | Sort-Object -Property Version -Descending | Select-Object -First 1).path)
            $ScriptPath = "$SourceModulePath\lib\ScriptSet.json"
            $JSScriptList = Get-Content -Path $ScriptPath | ConvertFrom-Json
            foreach ($JSScript in $JSScriptList)
            {
                $JSScriptURL = $JSScript.URL
                $ClarityPSScriptSetHtml += Add-Script -ScriptText "$JSScriptURL"
                $ClarityPSScriptSetHtml += Close-Script
            }
            $ClarityPSScriptSetHtml
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message
            $FailedItem = $_.Exception.ItemName
            Throw "Add-ClarityPSScriptSet: $ErrorMessage $FailedItem"
        }
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

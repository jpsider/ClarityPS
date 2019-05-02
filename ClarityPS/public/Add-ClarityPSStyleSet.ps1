function Add-ClarityPSStyleSet
{
    <#
    .DESCRIPTION
        Adds Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-ClarityPSStyleSet -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Add-ClarityPSStyleSet function."))
    {
        try
        {
            # Get the specified Style data.
            $SourceModulePath = (Split-Path -Path (Get-Module -ListAvailable ClarityPS | Sort-Object -Property Version -Descending | Select-Object -First 1).path)
            $StylePath = "$SourceModulePath\lib\style.css"
            $StyleData = Get-Content -Path $StylePath
            $ClarityPSStyleSetHtml += Add-Style -StyleText "$StyleData"
            $ClarityPSStyleSetHtml += Close-Style
            $ClarityPSStyleSetHtml
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message
            $FailedItem = $_.Exception.ItemName
            Throw "Add-ClarityPSStyleSet: $ErrorMessage $FailedItem"
        }
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

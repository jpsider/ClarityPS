function New-ReportCard
{
    <#
    .DESCRIPTION
        Builds HTML Reports using VMware's ClarityUI library.
    .PARAMETER tbd01
        working on the details
    .PARAMETER tbd02
        working on the details
    .EXAMPLE
        New-ReportCard
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
        [Parameter()][String]$tbd01,
        [Parameter()][String]$tbd02
    )
    if ($pscmdlet.ShouldProcess("Starting New-ReportCard function."))
    {
        try
        {
            #Add Function details
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message
            $FailedItem = $_.Exception.ItemName
            Throw "New-ReportCard: $ErrorMessage $FailedItem"
        }
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

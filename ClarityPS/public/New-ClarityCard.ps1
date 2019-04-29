function New-ClarityCard
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
        New-ClarityCard -Title Storage -Icon Storage -IconSize 24
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
        [Parameter(Mandatory = $true)][String]$Title,
        [Parameter()][String]$Icon,
        [Parameter()][String]$IconSize = 24
    )
    if ($pscmdlet.ShouldProcess("Starting New-ClarityCard function."))
    {
        Try
        {
            # Add the Title
            $CardBaseString = Add-FlexItem -Title $Title
            $CardBaseString += "<div class='card'>"
            $CardBaseString += "<div class='card-block'>"
            $CardBaseString += "<h3 class='card-title'>"
            # Add the Icon with size
            if ($Icon)
            {
                $CardBaseString += Add-Icon -Icon $Icon -IconSize $IconSize
            }
            else
            {
                # No Icon to Add
            }
            $FinalCardString = $CardBaseString + "&nbsp $Title</h3><center>"
            $FinalCardString
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message
            $FailedItem = $_.Exception.ItemName
            Throw "New-ClarityCard: $ErrorMessage $FailedItem"
        }
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

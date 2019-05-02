function Add-Button
{
    <#
    .DESCRIPTION
        Adds Button Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-Button -Title MyCard -Class btn-success -OnClick '' -ButtonText MyButton -ButtonValue 'Button01' -ID 'thisButton' -Name 'Button001'
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
        [Parameter(Mandatory = $true)][String]$Class,
        [Parameter(Mandatory = $true)][String]$ButtonText,
        [Parameter(Mandatory = $true)][String]$ButtonValue,
        [Parameter(Mandatory = $true)][String]$ID,
        [Parameter(Mandatory = $true)][String]$Name,
        [Parameter()][String]$OnClick
    )
    if ($pscmdlet.ShouldProcess("Starting Add-Button function."))
    {
        # Determine if a title was specified
        $ButtonHtml = "<button class='$Class' type='button' name='$Name' value='$ButtonValue' id='$ID'"
        if ($OnClick)
        {
            $ButtonHtml += (" onclick='$OnClick'" + ">$ButtonText")
        }
        else
        {
            $ButtonHtml += ">$ButtonText"
        }
        if ($Title)
        {
            $ButtonHtml += "<! Start $Title>"
        }
        else
        {
            # nothing to add here.
        }
        $ButtonHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

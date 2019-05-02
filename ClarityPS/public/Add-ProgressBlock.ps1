function Add-ProgressBlock
{
    <#
    .DESCRIPTION
        Adds Progress Block Element
    .PARAMETER Title
        Title, used for comment
    .PARAMETER Class
        Class to be used for the color.
    .PARAMETER Value
        Percent of the Progress bar to fill in.
    .PARAMETER Max
        Maximum progress bar value.
    .EXAMPLE
        Add-ProgressBlock -Title MyCard -Class "progress success" -Value "29" -Max "100"
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
        [Parameter()][String]$Class,
        [Parameter()][String]$Value,
        [Parameter()][String]$Max
    )
    if ($pscmdlet.ShouldProcess("Starting Add-ProgressBlock function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $ProgressBlockHtml = "<div class='progress-block'><div class='$Class'><progress value='$value' max='$Max' data-displayval='$Value%'></progress></div></div><!-- Start $Title -->"
        }
        else
        {
            $ProgressBlockHtml = "<div class='progress-block'><div class='$Class'><progress value='$value' max='$Max' data-displayval='$Value%'></progress></div></div>"
        }
        $ProgressBlockHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

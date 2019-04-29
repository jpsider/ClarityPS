function Add-CardBlock
{
    <#
    .DESCRIPTION
        Adds Card-block Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-CardBlock -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Add-CardBlock function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $CardBlockHtml = "<div class='card-block'><! Start $Title>"
        }
        else
        {
            $CardBlockHtml = "<div class='card-block'>"
        }
        $CardBlockHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

function Add-MainContainer
{
    <#
    .DESCRIPTION
        Adds Main-Container Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Add-MainContainer -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Add-MainContainer function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $MainContainerHtml = "<div class='main-container'><! Start $Title>"
        }
        else
        {
            $MainContainerHtml = "<div class='main-container'>"
        }
        $MainContainerHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

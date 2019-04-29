function Close-MainContainer
{
    <#
    .DESCRIPTION
        Closes Main container Element
    .PARAMETER Title
        Title, used for comment
    .EXAMPLE
        Close-MainContainer -Title MyCard
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
    if ($pscmdlet.ShouldProcess("Starting Close-MainContainer function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $MainContainerHtml = "</div><! End $Title>"
        }
        else
        {
            $MainContainerHtml = "</div>"
        }
        $MainContainerHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

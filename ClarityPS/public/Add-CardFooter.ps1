function Add-CardFooter
{
    <#
    .DESCRIPTION
        Adds Flex Item Element
    .PARAMETER Title
        Title, used for comment
    .PARAMETER CardFooter
        Text String of Data to be placed on the card.
    .EXAMPLE
        Add-CardFooter -Title MyCardFooter -CardFooter "SomeHTML Text"
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
        [Parameter(Mandatory = $true)][String]$CardFooter
    )
    if ($pscmdlet.ShouldProcess("Starting Add-CardFooter function."))
    {
        # Determine if a title was specified
        if ($Title)
        {
            $CardFooterHtml = "<!-- Start $Title -->$CardFooter"
        }
        else
        {
            $CardFooterHtml = "$CardFooter"
        }
        $CardFooterHtml
    }
    else
    {
        # -WhatIf was used.
        return $false
    }
}

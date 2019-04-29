$script:ModuleName = 'ClarityPS'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

$vmObject = New-Object System.Object
$vmObject | Add-Member -MemberType NoteProperty -Name "Powered On" -Value "1"
$vmObject | Add-Member -MemberType NoteProperty -Name "Powered Off" -Value "2"
$vmObject | Add-Member -MemberType NoteProperty -Name "Suspended" -Value "0"
$CardText = $vmObject | ConvertTo-Html -Fragment
$vmObject02 | Add-Member -MemberType NoteProperty -Name "Suspended" -Value "0"
$CardText02 = $vmObject02 | ConvertTo-Html -Fragment

Describe "New-ClarityCardBody function for $script:ModuleName" -Tags Build {
    It "Should return False if -WhatIf is used." {
        New-ClarityCardBody -CardText $CardText -WhatIf | Should be $false
    }
    It "Should not be null." {
        New-ClarityCardBody -CardText $CardText | Should not be $null
    }
    It "Should Return valid ClarityPS HTML." {
        New-ClarityCardBody -CardText $CardText | Should be "<p class='card-text'><table> <colgroup><col/><col/><col/></colgroup> <tr><th>Powered On</th><th>Powered Off</th><th>Suspended</th></tr> <tr><td>1</td><td>2</td><td>0</td></tr> </table>"
    }
    It "Should Throw if the CardText is less than 10 characters." {
        { New-ClarityCardBody -CardText $CardText02 } | Should Throw
    }
}

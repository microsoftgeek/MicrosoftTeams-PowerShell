# Get the Microsoft Teams PowerShell module from here: https://www.powershellgallery.com/packages/MicrosoftTeams/
# Make sure you run Connect-MicrosoftTeams prior to running this script.

$Date = Get-Date -Format FileDateTime
$Global:Array = @()
$Global:Array2 = @()

# Array for summary report...
Function AddtoArray {
	$ArrayObj = New-Object psObject
	$ArrayObj | Add-Member -Membertype noteproperty -Name "TeamGroupId" -Value $Team.GroupId
	$ArrayObj | Add-Member -Membertype noteproperty -Name "TeamDisplayName" -Value $Team.DisplayName
	$ArrayObj | Add-Member -Membertype noteproperty -Name "TeamOwners" -Value ($GTU | ? {$_.Role -eq "Owner"}).Count
	$ArrayObj | Add-Member -Membertype noteproperty -Name "TeamMembers" -Value ($GTU | ? {$_.Role -eq "Member"}).Count
	$ArrayObj | Add-Member -Membertype noteproperty -Name "TeamGuests" -Value ($GTU | ? {$_.Role -eq "Guest"}).Count
	$ArrayObj | Add-Member -Membertype noteproperty -Name "TeamOverallUserCount" -Value $GTU.Count
	$ArrayObj | Add-Member -Membertype noteproperty -Name "TeamChannelCount" -Value $GTC.Count
	$Global:Array += $ArrayObj
}

# Array for detailed report...
Function AddtoArray2 { 
	$ArrayObj2 = New-Object psObject
	$ArrayObj2 | Add-Member -Membertype noteproperty -Name "TeamGroupId" -Value $Team.GroupId
	$ArrayObj2 | Add-Member -Membertype noteproperty -Name "TeamDisplayName" -Value $Team.DisplayName
	$ArrayObj2 | Add-Member -Membertype noteproperty -Name "UserUserId" -Value $User.UserId
	$ArrayObj2 | Add-Member -Membertype noteproperty -Name "UserUser" -Value $User.User
	$ArrayObj2 | Add-Member -Membertype noteproperty -Name "UserName" -Value $User.Name
	$ArrayObj2 | Add-Member -Membertype noteproperty -Name "UserRole" -Value $User.Role
	$Global:Array2 += $ArrayObj2
}

$Teams = Get-Team
ForEach ($Team in $Teams) {
    $GTU = Get-TeamUser -GroupId $Team.GroupId
    $GTC = Get-TeamChannel -GroupId $Team.GroupId
    AddToArray
    ForEach ($User in $GTU) {
        AddToArray2
    }
}

$Global:Array | Sort TeamOverallUserCount -Descending | Export-Csv C:\Temp\TeamsSummaryReport-$Date.csv -NoTypeInformation
$Global:Array2 | Sort TeamDisplayName | Export-Csv C:\Temp\TeamsDetailedReport-$Date.csv -NoTypeInformation